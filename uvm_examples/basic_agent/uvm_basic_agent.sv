`include "uvm_macros.svh"
import uvm_pkg::*;
class basic_txn extends uvm_sequence_item;
  rand bit [7:0] data;
  `uvm_object_utils(basic_txn)
  function new(string name="basic_txn"); super.new(name); endfunction
endclass
class basic_driver extends uvm_driver #(basic_txn);
  virtual uvm_basic_if vif;
  `uvm_component_utils(basic_driver)
  function new(string n, uvm_component p); super.new(n,p); endfunction
  task run_phase(uvm_phase phase);
    basic_txn t;
    forever begin seq_item_port.get_next_item(t); vif.valid<=1; vif.data<=t.data; @(posedge vif.clk); vif.valid<=0; seq_item_port.item_done(); end
  endtask
endclass
class basic_monitor extends uvm_monitor;
  virtual uvm_basic_if vif;
  uvm_analysis_port #(basic_txn) ap;
  `uvm_component_utils(basic_monitor)
  function new(string n, uvm_component p); super.new(n,p); ap=new("ap",this); endfunction
  task run_phase(uvm_phase phase);
    forever begin @(posedge vif.clk); if(vif.valid) begin basic_txn t=new(); t.data=vif.data; ap.write(t); end end
  endtask
endclass
class basic_agent extends uvm_agent;
  uvm_sequencer #(basic_txn) seqr; basic_driver drv; basic_monitor mon;
  `uvm_component_utils(basic_agent)
  function new(string n, uvm_component p); super.new(n,p); endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqr=uvm_sequencer#(basic_txn)::type_id::create("seqr",this);
    drv=basic_driver::type_id::create("drv",this);
    mon=basic_monitor::type_id::create("mon",this);
  endfunction
  function void connect_phase(uvm_phase phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass
