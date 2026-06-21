module fifo_assertions(fifo_if intf);
  property full_and_empty_mutually_exclusive;
    @(posedge intf.clk) disable iff(!intf.rst_n)
      !(intf.full && intf.empty);
  endproperty
  assert property(full_and_empty_mutually_exclusive);

  property empty_read_keeps_data_stable;
    @(posedge intf.clk) disable iff(!intf.rst_n)
      (intf.empty && intf.rd_en) |=> $stable(intf.rdata);
  endproperty
  assert property(empty_read_keeps_data_stable);
endmodule
