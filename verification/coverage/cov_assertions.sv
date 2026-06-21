module cov_assertions(cov_if intf);
  property burst_nonzero; @(posedge intf.clk) intf.start |-> intf.burst!=0; endproperty
  assert property(burst_nonzero);
endmodule
