`timescale 1ns/1ps
module sva_tb;
  logic clk=0,rst_n=0; always #5 clk=~clk;
  sva_if intf(.clk(clk), .rst_n(rst_n));
  sva_design dut(.intf(intf));
  sva_assertions a0(.intf(intf));
  sva_coverage c0(.intf(intf));
  initial begin
    intf.req=0; repeat(2) @(posedge clk); rst_n=1;
    repeat(5) begin intf.req=1; @(posedge clk); intf.req=0; @(posedge clk); end
    $finish;
  end
endmodule
