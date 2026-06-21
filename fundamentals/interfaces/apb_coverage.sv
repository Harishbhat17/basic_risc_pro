module apb_coverage(apb_if apb);
  covergroup cg @(posedge apb.pclk);
    cp_write: coverpoint apb.pwrite;
    cp_enable: coverpoint apb.penable;
    cp_cross: cross cp_write, cp_enable;
  endgroup
  cg c = new();
endmodule
