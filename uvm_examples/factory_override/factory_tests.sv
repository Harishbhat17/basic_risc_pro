`include "uvm_macros.svh"
import uvm_pkg::*;
class base_seq extends uvm_sequence #(uvm_sequence_item);
  `uvm_object_utils(base_seq)
  function new(string n="base_seq"); super.new(n); endfunction
  task body(); endtask
endclass
class override_seq extends base_seq;
  `uvm_object_utils(override_seq)
  function new(string n="override_seq"); super.new(n); endfunction
endclass
class factory_test extends uvm_test;
  `uvm_component_utils(factory_test)
  function new(string n, uvm_component p); super.new(n,p); endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    base_seq::type_id::set_type_override(override_seq::get_type());
  endfunction
endclass
