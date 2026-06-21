module cdc_assertions(cdc_if intf);
  property req_eventual_ack; @(posedge intf.src_clk) disable iff(!intf.rst_n) intf.src_req |-> ##[1:8] intf.src_ack; endproperty
  assert property(req_eventual_ack);
endmodule
