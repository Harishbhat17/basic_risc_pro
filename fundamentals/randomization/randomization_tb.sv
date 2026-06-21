`timescale 1ns/1ps
import randomization_pkg::*;
module randomization_tb;
  logic clk=0; always #5 clk=~clk;
  rand_if intf(.clk(clk));
  randomization_design dut(.intf(intf));
  randomization_assertions a0(.intf(intf));
  randomization_coverage c0(.intf(intf));
  alu_txn t;
  initial begin
    intf.valid=0;
    repeat(2) @(posedge clk);
    repeat(20) begin
      t = new(); void'(t.randomize());
      intf.valid<=1; intf.opcode<=t.opcode; intf.a<=t.a; intf.b<=t.b;
      @(posedge clk);
    end
    $finish;
  end
endmodule
