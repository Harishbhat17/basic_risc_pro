`include "uvm_macros.svh"
import uvm_pkg::*;
class env_cfg extends uvm_object; `uvm_object_utils(env_cfg) bit enable_sb=1; function new(string n="env_cfg"); super.new(n); endfunction endclass
class advanced_test extends uvm_test;
  `uvm_component_utils(advanced_test)
  function new(string n, uvm_component p); super.new(n,p); endfunction
  task run_phase(uvm_phase phase); phase.raise_objection(this); #200ns; phase.drop_objection(this); endtask
endclass
