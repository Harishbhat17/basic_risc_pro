`timescale 1ns/1ps
module uvm_cov_tb;
  logic clk=0; always #5 clk=~clk;
  uvm_cov_if intf(.clk(clk));
  initial run_test();
endmodule
