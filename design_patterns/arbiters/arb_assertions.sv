module arb_assertions(arb_if intf);
  property one_hot_pri; @(posedge intf.clk) $onehot0(intf.gnt_pri); endproperty
  assert property(one_hot_pri);
  property one_hot_rr; @(posedge intf.clk) $onehot0(intf.gnt_rr); endproperty
  assert property(one_hot_rr);
endmodule
