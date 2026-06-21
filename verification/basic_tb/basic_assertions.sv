module basic_assertions(basic_if intf);
  property p_inc; @(posedge intf.clk) disable iff(!intf.rst_n) intf.valid |=> intf.dout==$past(intf.din)+1; endproperty
  assert property(p_inc);
endmodule
