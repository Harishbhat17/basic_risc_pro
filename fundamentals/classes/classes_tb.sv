`timescale 1ns/1ps
module classes_tb;
  logic clk=0; always #5 clk=~clk;
  classes_if intf(.clk(clk));
  classes_example dut(.intf(intf));
  classes_assertions a0(.intf(intf));
  classes_coverage c0(.intf(intf));
  initial begin repeat(20) @(posedge clk); $finish; end
endmodule
