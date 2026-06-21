module axi_lite_slave(axi_lite_if intf);
  logic [31:0] regs [0:3];
  logic [1:0] wr_idx, rd_idx;
  always_ff @(posedge intf.aclk or negedge intf.aresetn) begin
    if(!intf.aresetn) begin intf.awready<=1; intf.wready<=1; intf.bvalid<=0; end
    else begin
      if(intf.awvalid && intf.wvalid && intf.awready && intf.wready) begin
        wr_idx <= intf.awaddr[3:2]; regs[intf.awaddr[3:2]] <= intf.wdata; intf.bvalid<=1;
      end
      if(intf.bready) intf.bvalid<=0;
    end
  end
  always_ff @(posedge intf.aclk or negedge intf.aresetn) begin
    if(!intf.aresetn) begin intf.arready<=1; intf.rvalid<=0; intf.rdata<=0; end
    else begin
      if(intf.arvalid && intf.arready) begin rd_idx<=intf.araddr[3:2]; intf.rdata<=regs[intf.araddr[3:2]]; intf.rvalid<=1; end
      if(intf.rready) intf.rvalid<=0;
    end
  end
endmodule
