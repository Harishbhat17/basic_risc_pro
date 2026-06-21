`timescale 1ns/1ps
module fsm_tb;
  logic clk=0, rst_n=0; always #5 clk=~clk;
  fsm_if intf(.clk(clk), .rst_n(rst_n));
  fsm_design dut(.intf(intf));
  fsm_assertions a0(.intf(intf));
  fsm_coverage c0(.intf(intf));
  initial begin
    intf.in_sig=0;
    repeat(2) @(posedge clk); rst_n=1;
    intf.in_sig=1; @(posedge clk); intf.in_sig=1; @(posedge clk); intf.in_sig=0; @(posedge clk);
    $finish;
  end
endmodule
