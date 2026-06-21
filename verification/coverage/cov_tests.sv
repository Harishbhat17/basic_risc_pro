package cov_tests_pkg;
  class cov_txn;
    rand bit [1:0] mode;
    rand bit [3:0] burst;
    rand bit start;
    constraint c { burst inside {[1:15]}; }
  endclass
endpackage
