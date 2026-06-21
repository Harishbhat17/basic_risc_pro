module mp_fifo_coverage(mp_fifo_if intf);
  covergroup cg @(posedge intf.wr_clk);
    cp_wr0: coverpoint intf.wr_en[0];
    cp_wr1: coverpoint intf.wr_en[1];
    cp_full: coverpoint intf.full;
    cp_cross: cross cp_wr0, cp_wr1, cp_full;
  endgroup
  cg c=new();
endmodule
