package randomization_pkg;
  class alu_txn;
    rand bit [3:0] opcode;
    rand bit [7:0] a,b;
    constraint legal { opcode inside {0,1}; a < 8'hF0; b < 8'hF0; }
  endclass
endpackage
