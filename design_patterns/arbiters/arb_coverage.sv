module arb_coverage(arb_if intf);
  covergroup cg @(posedge intf.clk);
    cp_req: coverpoint intf.req;
    cp_pri: coverpoint intf.gnt_pri;
    cp_rr: coverpoint intf.gnt_rr;
  endgroup
  cg c=new();
endmodule
