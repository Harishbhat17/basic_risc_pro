module counter_assertions(counter_if intf);
  property tick_periodic; @(posedge intf.clk) disable iff(!intf.rst_n) intf.tick |-> intf.en; endproperty
  assert property(tick_periodic);
endmodule
