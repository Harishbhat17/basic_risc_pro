module factory_assertions(factory_if intf);
  property p_valid; @(posedge intf.clk) intf.valid |-> !$isunknown(intf.data); endproperty
  assert property(p_valid);
endmodule
