`include "uvm_macros.svh"
import uvm_pkg::*;
class smoke_uvm_test extends uvm_test;
  `uvm_component_utils(smoke_uvm_test)
  function new(string n, uvm_component p); super.new(n,p); endfunction
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("SIMPLE_TEST","Executing sequence example",UVM_LOW)
    #100ns;
    phase.drop_objection(this);
  endtask
endclass
