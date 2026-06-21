module axi_lite_assertions(axi_lite_if intf);
  property write_resp_follows_write;
    @(posedge intf.aclk) disable iff(!intf.aresetn)
      (intf.awvalid && intf.wvalid && intf.awready && intf.wready) |=> intf.bvalid;
  endproperty
  assert property(write_resp_follows_write);

  property read_resp_follows_addr;
    @(posedge intf.aclk) disable iff(!intf.aresetn)
      (intf.arvalid && intf.arready) |=> intf.rvalid;
  endproperty
  assert property(read_resp_follows_addr);

  property aw_valid_addr_stable_until_ready;
    @(posedge intf.aclk) disable iff(!intf.aresetn)
      (intf.awvalid && !intf.awready) |=> (intf.awvalid && $stable(intf.awaddr));
  endproperty
  assert property(aw_valid_addr_stable_until_ready);

  property ar_valid_addr_stable_until_ready;
    @(posedge intf.aclk) disable iff(!intf.aresetn)
      (intf.arvalid && !intf.arready) |=> (intf.arvalid && $stable(intf.araddr));
  endproperty
  assert property(ar_valid_addr_stable_until_ready);
endmodule
