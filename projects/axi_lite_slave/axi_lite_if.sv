interface axi_lite_if(input logic aclk, input logic aresetn);
  logic [31:0] awaddr, wdata, araddr, rdata;
  logic awvalid, awready, wvalid, wready, bvalid, bready;
  logic arvalid, arready, rvalid, rready;
endinterface
