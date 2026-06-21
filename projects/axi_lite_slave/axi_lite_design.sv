module axi_lite_slave(axi_lite_if intf);
  logic [31:0] regs [0:3];
  logic wr_addr_ok, rd_addr_ok;

  always_comb begin
    wr_addr_ok = (intf.awaddr[31:4] == '0);
    rd_addr_ok = (intf.araddr[31:4] == '0);
  end

  always_ff @(posedge intf.aclk or negedge intf.aresetn) begin
    if(!intf.aresetn) begin intf.awready<=1; intf.wready<=1; intf.bvalid<=0; end
    else begin
      if(intf.awvalid && intf.wvalid && intf.awready && intf.wready) begin
        if(wr_addr_ok) regs[intf.awaddr[3:2]] <= intf.wdata;
        intf.bvalid<=1;
      end
      if(intf.bready && intf.bvalid) intf.bvalid<=0;
    end
  end

  always_ff @(posedge intf.aclk or negedge intf.aresetn) begin
    if(!intf.aresetn) begin intf.arready<=1; intf.rvalid<=0; intf.rdata<=0; end
    else begin
      if(intf.arvalid && intf.arready) begin
        intf.rdata<= rd_addr_ok ? regs[intf.araddr[3:2]] : 32'hDEAD_BEEF;
        intf.rvalid<=1;
      end
      if(intf.rready && intf.rvalid) intf.rvalid<=0;
    end
  end
endmodule
