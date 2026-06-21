package basic_tests_pkg;
  task automatic directed_smoke(ref logic [7:0] din, ref logic valid, input logic clk);
    din<=8'h10; valid<=1; @(posedge clk); valid<=0;
  endtask
endpackage
