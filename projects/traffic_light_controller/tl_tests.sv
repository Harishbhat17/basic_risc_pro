package tl_tests_pkg;
  task automatic trigger_wait(ref logic car_wait, input logic clk);
    car_wait<=1; repeat(8) @(posedge clk); car_wait<=0;
  endtask
endpackage
