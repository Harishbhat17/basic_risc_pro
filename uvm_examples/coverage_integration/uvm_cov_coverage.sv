module uvm_cov_coverage(uvm_cov_if intf);
  covergroup cg @(posedge intf.clk);
    cp_cmd: coverpoint intf.cmd;
    cp_valid: coverpoint intf.valid;
    cp_cross: cross cp_cmd, cp_valid;
  endgroup
  cg c = new();
endmodule
