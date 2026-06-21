module apb_assertions(apb_if apb);
  property psel_to_enable; @(posedge apb.pclk) disable iff(!apb.presetn) apb.psel |=> apb.penable; endproperty
  assert property(psel_to_enable);
endmodule
