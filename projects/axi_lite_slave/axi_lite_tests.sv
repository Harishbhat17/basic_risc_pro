package axi_lite_tests_pkg;
  task automatic axi_write(virtual axi_lite_if intf, input [31:0] a, input [31:0] d);
    intf.awaddr<=a; intf.wdata<=d; intf.awvalid<=1; intf.wvalid<=1;
    @(posedge intf.aclk); intf.awvalid<=0; intf.wvalid<=0;
  endtask
  task automatic axi_read(virtual axi_lite_if intf, input [31:0] a);
    intf.araddr<=a; intf.arvalid<=1; @(posedge intf.aclk); intf.arvalid<=0;
  endtask
endpackage
