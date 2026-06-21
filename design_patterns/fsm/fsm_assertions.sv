module fsm_assertions(fsm_if intf);
  property mealy_output_requires_input;
    @(posedge intf.clk) disable iff(!intf.rst_n)
      intf.mealy_out |-> intf.in_sig;
  endproperty
  assert property(mealy_output_requires_input);
endmodule
