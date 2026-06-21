`timescale 1ns/1ps
module arb_tb;
  logic clk=0, rst_n=0; always #5 clk=~clk;
  arb_if intf(.clk(clk), .rst_n(rst_n));
  arb_design dut(.intf(intf));
  arb_assertions a0(.intf(intf));
  arb_coverage c0(.intf(intf));
  initial begin
    intf.req=0;
    repeat(2) @(posedge clk); rst_n=1;
    intf.req=4'b1111; repeat(8) @(posedge clk);
    $finish;
  end
endmodule
