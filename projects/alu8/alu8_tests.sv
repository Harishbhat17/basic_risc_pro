package alu8_tests_pkg;
  class alu8_txn;
    rand bit [2:0] op;
    rand bit [7:0] a,b;
    constraint legal { op inside {[0:4]}; }
  endclass
endpackage
