module mp_fifo_assertions(mp_fifo_if intf);
  property no_overflow; @(posedge intf.wr_clk) intf.full |-> !(|intf.wr_en); endproperty
  assert property(no_overflow);
endmodule
