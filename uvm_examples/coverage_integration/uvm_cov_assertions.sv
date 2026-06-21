module uvm_cov_assertions(uvm_cov_if intf);
  property cmd_valid; @(posedge intf.clk) intf.valid |-> intf.cmd inside {[0:2]}; endproperty
  assert property(cmd_valid);
endmodule
