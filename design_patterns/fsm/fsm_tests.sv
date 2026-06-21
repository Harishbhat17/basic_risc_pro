package fsm_tests_pkg;
  task automatic pulse(ref logic s, input logic clk); s<=1; @(posedge clk); s<=0; endtask
endpackage
