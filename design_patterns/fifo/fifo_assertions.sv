module fifo_assertions(fifo_if intf);
  property no_read_when_empty; @(posedge intf.clk) intf.empty |-> !intf.rd_en; endproperty
  assert property(no_read_when_empty);
  property no_write_when_full; @(posedge intf.clk) intf.full |-> !intf.wr_en; endproperty
  assert property(no_write_when_full);
endmodule
