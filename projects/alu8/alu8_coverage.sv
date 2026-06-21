module alu8_coverage(alu8_if intf);
  covergroup cg @(posedge intf.clk);
    cp_op: coverpoint intf.op { bins ops[]={[0:4]}; }
    cp_a: coverpoint intf.a;
    cp_b: coverpoint intf.b;
    cp_cross: cross cp_op, cp_a, cp_b;
  endgroup
  cg c=new();
endmodule
