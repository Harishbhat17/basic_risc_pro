module fifo_coverage(fifo_if intf);
  covergroup cg @(posedge intf.clk);
    cp_wr: coverpoint intf.wr_en;
    cp_rd: coverpoint intf.rd_en;
    cp_state: coverpoint {intf.full,intf.empty};
    cp_cross: cross cp_wr, cp_rd, cp_state;
  endgroup
  cg c=new();
endmodule
