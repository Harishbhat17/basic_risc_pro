`timescale 1ns/1ps
module procedural_blocks_tb;
  logic clk=0; always #5 clk=~clk;
  proc_if intf(.clk(clk));
  procedural_blocks_design dut(.intf(intf));
  procedural_blocks_assertions a0(.intf(intf));
  procedural_blocks_coverage c0(.intf(intf));
  initial begin
    intf.rst_n=0; intf.en=0; intf.a=0; intf.b=0;
    repeat(2) @(posedge clk); intf.rst_n=1;
    intf.en=1; intf.a=8'd5; intf.b=8'd7; @(posedge clk); intf.en=0;
    $finish;
  end
endmodule
