module sva_assertions(sva_if intf);
  sequence req_seq; intf.req ##1 intf.gnt; endsequence
  property req_to_gnt; @(posedge intf.clk) disable iff(!intf.rst_n) intf.req |=> intf.gnt; endproperty
  assert property(req_to_gnt);
  cover property(@(posedge intf.clk) req_seq);
endmodule
