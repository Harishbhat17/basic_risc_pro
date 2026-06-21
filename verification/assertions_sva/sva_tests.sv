package sva_tests_pkg;
  task automatic req_pulse(ref logic req, input logic clk);
    req<=1; @(posedge clk); req<=0;
  endtask
endpackage
