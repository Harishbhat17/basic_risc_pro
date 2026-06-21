module uart_assertions(uart_if intf);
  property tx_start_busy; @(posedge intf.clk) disable iff(!intf.rst_n) intf.tx_start && !intf.tx_busy |=> intf.tx_busy; endproperty
  assert property(tx_start_busy);
endmodule
