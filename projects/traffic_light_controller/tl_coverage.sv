module tl_coverage(tl_if intf);
  covergroup cg @(posedge intf.clk);
    cp_hw: coverpoint intf.highway;
    cp_sd: coverpoint intf.side;
    cp_cross: cross cp_hw, cp_sd;
  endgroup
  cg c = new();
endmodule
