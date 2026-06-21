package cdc_tests_pkg;
  task automatic pulse_req(ref logic req, input logic clk);
    req<=1; @(posedge clk); req<=0;
  endtask
endpackage
