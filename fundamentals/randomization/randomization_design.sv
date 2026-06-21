module randomization_design(rand_if intf);
  logic [8:0] result;
  always_ff @(posedge intf.clk)
    if (intf.valid) result <= (intf.opcode==0) ? intf.a+intf.b : intf.a-intf.b;
endmodule
