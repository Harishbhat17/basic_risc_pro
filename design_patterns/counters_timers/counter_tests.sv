package counter_tests_pkg;
  task automatic enable_for(ref logic en, input logic clk, input int n);
    en<=1; repeat(n) @(posedge clk); en<=0;
  endtask
endpackage
