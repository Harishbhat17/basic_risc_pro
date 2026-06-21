module alu8_assertions(alu8_if intf);
  property op_legal; @(posedge intf.clk) disable iff(!intf.rst_n) intf.valid |-> intf.op inside {[0:4]}; endproperty
  assert property(op_legal);
endmodule
