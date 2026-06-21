`timescale 1ns/1ps
module uart_tb;
  logic clk=0,rst_n=0; always #5 clk=~clk;
  uart_if intf(.clk(clk), .rst_n(rst_n));
  uart_controller dut(.intf(intf));
  uart_assertions a0(.intf(intf));
  uart_coverage c0(.intf(intf));
  initial begin
    intf.tx_start=0; intf.tx_data=0; intf.rxd=1;
    repeat(2) @(posedge clk); rst_n=1;
    repeat(5) begin intf.tx_data=$urandom; intf.tx_start=1; @(posedge clk); intf.tx_start=0; repeat(20) @(posedge clk); end
    $finish;
  end
endmodule
