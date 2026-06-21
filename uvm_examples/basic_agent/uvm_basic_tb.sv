`timescale 1ns/1ps
module uvm_basic_tb;
  logic clk=0; always #5 clk=~clk;
  uvm_basic_if intf(.clk(clk));
  uvm_basic_design dut(.intf(intf));
  initial begin intf.rst_n=1; run_test(); end
endmodule
