`timescale 1ns/1ps
module counter_tb;
  logic clk=0, rst_n=0; always #5 clk=~clk;
  counter_if intf(.clk(clk), .rst_n(rst_n));
  counter_design dut(.intf(intf));
  counter_assertions a0(.intf(intf));
  counter_coverage c0(.intf(intf));
  initial begin
    intf.en=0;
    repeat(2) @(posedge clk); rst_n=1; intf.en=1;
    repeat(120) @(posedge clk);
    $finish;
  end
endmodule
