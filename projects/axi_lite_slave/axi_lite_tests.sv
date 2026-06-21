package axi_lite_tests_pkg;
  task automatic axi_write(virtual axi_lite_if intf, input [31:0] a, input [31:0] d);
    bit aw_done, w_done;
    aw_done = 0; w_done = 0;
    intf.awaddr<=a; intf.wdata<=d; intf.awvalid<=1; intf.wvalid<=1; intf.bready<=1;
    while(!(aw_done && w_done)) begin
      @(posedge intf.aclk);
      if(intf.awvalid && intf.awready) begin intf.awvalid<=0; aw_done=1; end
      if(intf.wvalid && intf.wready) begin intf.wvalid<=0; w_done=1; end
    end
    wait(intf.bvalid===1'b1);
    @(posedge intf.aclk);
    intf.bready<=0;
  endtask

  task automatic axi_read(virtual axi_lite_if intf, input [31:0] a, output [31:0] d);
    intf.araddr<=a; intf.arvalid<=1; intf.rready<=1;
    do @(posedge intf.aclk); while(!(intf.arvalid && intf.arready));
    intf.arvalid<=0;
    wait(intf.rvalid===1'b1);
    d = intf.rdata;
    @(posedge intf.aclk);
    intf.rready<=0;
  endtask
endpackage
