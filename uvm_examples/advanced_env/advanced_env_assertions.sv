module advanced_env_assertions(advanced_if intf);
  property p_valid_data; @(posedge intf.clk) intf.valid |-> (intf.data!=8'hXX); endproperty
  assert property(p_valid_data);
endmodule
