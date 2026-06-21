module axi_lite_assertions(axi_lite_if intf);
  property write_resp_follows_write;
    @(posedge intf.aclk) disable iff(!intf.aresetn)
      (intf.awvalid && intf.wvalid && intf.awready && intf.wready) |=> intf.bvalid;
  endproperty
  assert property(write_resp_follows_write);
endmodule
