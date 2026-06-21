module sva_coverage(sva_if intf);
  covergroup cg @(posedge intf.clk);
    cp_req: coverpoint intf.req;
    cp_gnt: coverpoint intf.gnt;
  endgroup
  cg c=new();
endmodule
