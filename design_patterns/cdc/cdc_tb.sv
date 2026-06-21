`timescale 1ns/1ps
module cdc_tb;
  logic src_clk=0, dst_clk=0;
  always #3 src_clk=~src_clk;
  always #5 dst_clk=~dst_clk;
  cdc_if intf(.src_clk(src_clk), .dst_clk(dst_clk));
  cdc_design dut(.intf(intf));
  cdc_assertions a0(.intf(intf));
  cdc_coverage c0(.intf(intf));
  initial begin
    intf.rst_n=0; intf.src_req=0;
    repeat(4) @(posedge src_clk); intf.rst_n=1;
    repeat(5) begin intf.src_req=1; @(posedge src_clk); intf.src_req=0; repeat(3) @(posedge src_clk); end
    $finish;
  end
endmodule
