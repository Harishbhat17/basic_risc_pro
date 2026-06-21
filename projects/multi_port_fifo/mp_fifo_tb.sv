`timescale 1ns/1ps
module mp_fifo_tb;
  logic wr_clk=0, rd_clk=0, rst_n=0;
  always #4 wr_clk=~wr_clk;
  always #6 rd_clk=~rd_clk;
  mp_fifo_if intf(.wr_clk(wr_clk), .rd_clk(rd_clk), .rst_n(rst_n));
  multi_port_fifo dut(.intf(intf));
  mp_fifo_assertions a0(.intf(intf));
  mp_fifo_coverage c0(.intf(intf));
  initial begin
    intf.wr_en=0; intf.rd_en=0; intf.wdata='{default:0};
    repeat(3) @(posedge wr_clk); rst_n=1;
    repeat(10) begin intf.wr_en=2'b11; intf.wdata[0]=$urandom; intf.wdata[1]=$urandom; @(posedge wr_clk); intf.wr_en=0; end
    repeat(10) begin intf.rd_en=1; @(posedge rd_clk); intf.rd_en=0; end
    $finish;
  end
endmodule
