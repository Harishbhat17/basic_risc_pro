module fsm_assertions(fsm_if intf);
  property moore_depends_on_state; @(posedge intf.clk) !intf.rst_n or ($stable(intf.moore_out) or intf.in_sig); endproperty
  assert property(moore_depends_on_state);
endmodule
