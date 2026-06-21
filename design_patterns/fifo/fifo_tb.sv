`timescale 1ns/1ps
module fifo_tb;
  logic clk=0, rst_n=0; always #5 clk=~clk;
  fifo_if intf(.clk(clk), .rst_n(rst_n));
  sync_fifo dut(.intf(intf));
  fifo_assertions a0(.intf(intf));
  fifo_coverage c0(.intf(intf));
  initial begin
    intf.wr_en=0; intf.rd_en=0; intf.wdata=0;
    repeat(2) @(posedge clk); rst_n=1;
    repeat(4) begin intf.wr_en=1; intf.wdata=$random; @(posedge clk); intf.wr_en=0; end
    repeat(4) begin intf.rd_en=1; @(posedge clk); intf.rd_en=0; end
    $finish;
  end
endmodule
