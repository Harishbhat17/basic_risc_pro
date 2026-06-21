module cdc_coverage(cdc_if intf);
  covergroup cg @(posedge intf.src_clk);
    cp_req: coverpoint intf.src_req;
    cp_ack: coverpoint intf.src_ack;
    cp_cross: cross cp_req, cp_ack;
  endgroup
  cg c = new();
endmodule
