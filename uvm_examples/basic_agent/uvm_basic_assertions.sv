module uvm_basic_assertions(uvm_basic_if intf);
  property no_x_when_valid; @(posedge intf.clk) intf.valid |-> !$isunknown(intf.data); endproperty
  assert property(no_x_when_valid);
endmodule
