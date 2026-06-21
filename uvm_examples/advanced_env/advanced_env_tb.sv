`timescale 1ns/1ps
module advanced_env_tb;
  logic clk=0; always #5 clk=~clk;
  advanced_if intf(.clk(clk));
  advanced_env_design dut(.intf(intf));
  initial run_test("advanced_test");
endmodule
