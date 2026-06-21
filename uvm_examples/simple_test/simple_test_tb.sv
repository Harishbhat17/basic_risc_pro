`timescale 1ns/1ps
module simple_test_tb;
  logic clk=0; always #5 clk=~clk;
  simple_test_if intf(.clk(clk));
  simple_test_design dut(.intf(intf));
  initial run_test("smoke_uvm_test");
endmodule
