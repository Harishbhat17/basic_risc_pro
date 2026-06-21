`timescale 1ns/1ps
module basic_tb;
  logic clk=0; always #5 clk=~clk;
  basic_if intf(.clk(clk));
  basic_design dut(.intf(intf));
  basic_assertions a0(.intf(intf));
  basic_coverage c0(.intf(intf));
  initial begin
    intf.rst_n=0; intf.valid=0; intf.din=0;
    repeat(2) @(posedge clk); intf.rst_n=1;
    intf.valid=1; intf.din=8'h2A; @(posedge clk); intf.valid=0;
    $finish;
  end
endmodule
