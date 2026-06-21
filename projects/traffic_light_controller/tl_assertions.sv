module tl_assertions(tl_if intf);
  property no_dual_green; @(posedge intf.clk) !(intf.highway==2'b10 && intf.side==2'b10); endproperty
  assert property(no_dual_green);
  property no_dual_yellow; @(posedge intf.clk) !(intf.highway==2'b01 && intf.side==2'b01); endproperty
  assert property(no_dual_yellow);
endmodule
