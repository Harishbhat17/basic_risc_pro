module classes_assertions(classes_if intf);
  property valid_stable; @(posedge intf.clk) intf.valid |-> !$isunknown(intf.data); endproperty
  assert property(valid_stable);
endmodule
