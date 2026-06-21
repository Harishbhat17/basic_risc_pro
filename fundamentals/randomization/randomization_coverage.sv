module randomization_coverage(rand_if intf);
  covergroup cg @(posedge intf.clk);
    cp_op: coverpoint intf.opcode;
    cp_a: coverpoint intf.a;
    cp_cross: cross cp_op, cp_a;
  endgroup
  cg c=new();
endmodule
