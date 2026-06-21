module sb_assertions(sb_if intf);
  property sum_check; @(posedge intf.clk) disable iff(!intf.rst_n) intf.valid |=> intf.sum==$past(intf.a)+$past(intf.b); endproperty
  assert property(sum_check);
endmodule
