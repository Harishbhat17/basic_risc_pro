`include "uvm_macros.svh"
import uvm_pkg::*;
class basic_seq extends uvm_sequence #(basic_txn);
  `uvm_object_utils(basic_seq)
  function new(string n="basic_seq"); super.new(n); endfunction
  task body(); repeat(16) begin basic_txn t=basic_txn::type_id::create("t"); start_item(t); void'(t.randomize()); finish_item(t); end endtask
endclass
