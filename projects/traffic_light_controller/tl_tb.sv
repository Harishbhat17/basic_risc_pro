`timescale 1ns/1ps
module tl_tb;
  logic clk=0, rst_n=0; always #5 clk=~clk;
  tl_if intf(.clk(clk), .rst_n(rst_n));
  traffic_light_controller dut(.intf(intf));
  tl_assertions a0(.intf(intf));
  tl_coverage c0(.intf(intf));
  initial begin
    intf.car_wait=0;
    repeat(2) @(posedge clk); rst_n=1;
    repeat(3) begin intf.car_wait=1; repeat(10) @(posedge clk); intf.car_wait=0; repeat(10) @(posedge clk); end
    $finish;
  end
endmodule
