module axi_lite_coverage(axi_lite_if intf);
  covergroup cg @(posedge intf.aclk);
    cp_aw: coverpoint intf.awvalid;
    cp_w:  coverpoint intf.wvalid;
    cp_ar: coverpoint intf.arvalid;
    cp_cross: cross cp_aw, cp_w, cp_ar;
  endgroup
  cg c = new();
endmodule
