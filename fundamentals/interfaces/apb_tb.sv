`timescale 1ns/1ps
import apb_tests_pkg::*;
module apb_tb;
  logic pclk=0, presetn=0;
  always #5 pclk = ~pclk;
  apb_if apb(.pclk(pclk), .presetn(presetn));
  apb_peripheral dut(.apb(apb));
  apb_assertions a0(.apb(apb));
  apb_coverage c0(.apb(apb));
  initial begin
    apb.psel=0; apb.penable=0; apb.pwrite=0; apb.paddr=0; apb.pwdata=0;
    repeat(2) @(posedge pclk); presetn=1;
    apb_write(apb, 32'h4, 32'hABCD_0001);
    $finish;
  end
endmodule
