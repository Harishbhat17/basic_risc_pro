module simple_test_assertions(simple_test_if intf);
  property p; @(posedge intf.clk) intf.valid |-> !$isunknown(intf.data); endproperty
  assert property(p);
endmodule
