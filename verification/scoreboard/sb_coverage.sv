module sb_coverage(sb_if intf);
  covergroup cg @(posedge intf.clk);
    cp_valid: coverpoint intf.valid;
    cp_a: coverpoint intf.a;
    cp_b: coverpoint intf.b;
    cp_cross: cross cp_a, cp_b;
  endgroup
  cg c=new();
endmodule
