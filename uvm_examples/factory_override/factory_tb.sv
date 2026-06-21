`timescale 1ns/1ps
module factory_tb;
  logic clk=0; always #5 clk=~clk;
  factory_if intf(.clk(clk));
  initial run_test("factory_test");
endmodule
