`timescale 1ns/1ps
module axi_lite_tb;
  logic aclk=0, aresetn=0; always #5 aclk=~aclk;
  axi_lite_if intf(.aclk(aclk), .aresetn(aresetn));
  axi_lite_slave dut(.intf(intf));
  axi_lite_assertions a0(.intf(intf));
  axi_lite_coverage c0(.intf(intf));
  initial begin
    intf.awvalid=0; intf.wvalid=0; intf.bready=1; intf.arvalid=0; intf.rready=1;
    repeat(2) @(posedge aclk); aresetn=1;

    intf.awaddr=32'h0; intf.wdata=32'h1234_5678; intf.awvalid=1; intf.wvalid=1;
    do @(posedge aclk); while(!(intf.awvalid && intf.awready && intf.wvalid && intf.wready));
    intf.awvalid=0; intf.wvalid=0;

    intf.araddr=32'h0; intf.arvalid=1;
    do @(posedge aclk); while(!(intf.arvalid && intf.arready));
    intf.arvalid=0;

    repeat(3) @(posedge aclk); $finish;
  end
endmodule
