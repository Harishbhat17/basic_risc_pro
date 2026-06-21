`include "uvm_macros.svh"
import uvm_pkg::*;
class cov_subscriber extends uvm_subscriber #(uvm_sequence_item);
  `uvm_component_utils(cov_subscriber)
  function new(string n, uvm_component p); super.new(n,p); endfunction
  virtual function void write(uvm_sequence_item t); `uvm_info("COV","sample transaction",UVM_LOW) endfunction
endclass
