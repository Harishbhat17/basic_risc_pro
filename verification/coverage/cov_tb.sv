`timescale 1ns/1ps
import cov_tests_pkg::*;
module cov_tb;
  logic clk=0; always #5 clk=~clk;
  cov_if intf(.clk(clk));
  cov_design dut(.intf(intf));
  cov_assertions a0(.intf(intf));
  cov_coverage c0(.intf(intf));
  cov_txn t;
  initial begin
    repeat(20) begin
      t=new(); void'(t.randomize());
      intf.mode=t.mode; intf.burst=t.burst; intf.start=t.start;
      @(posedge clk);
    end
    $finish;
  end
endmodule
