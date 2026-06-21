module randomization_assertions(rand_if intf);
  property legal_opcode; @(posedge intf.clk) intf.valid |-> (intf.opcode inside {0,1}); endproperty
  assert property(legal_opcode);
endmodule
