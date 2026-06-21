`timescale 1ns/1ps
import sb_tests_pkg::*;
module sb_tb;
  logic clk=0,rst_n=0; always #5 clk=~clk;
  sb_if intf(.clk(clk), .rst_n(rst_n));
  sb_design dut(.intf(intf));
  sb_assertions a0(.intf(intf));
  sb_coverage c0(.intf(intf));
  scoreboard sb = new();
  initial begin
    intf.valid=0; intf.a=0; intf.b=0;
    repeat(2) @(posedge clk); rst_n=1;
    repeat(10) begin
      intf.a=$urandom_range(0,255); intf.b=$urandom_range(0,255); intf.valid=1;
      @(posedge clk); intf.valid=0;
      sb.check(intf.a,intf.b,intf.sum);
      @(posedge clk);
    end
    $display("scoreboard pass=%0d fail=%0d", sb.pass, sb.fail);
    $finish;
  end
endmodule
