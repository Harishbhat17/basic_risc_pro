module basic_coverage(basic_if intf);
  covergroup cg @(posedge intf.clk);
    cp_valid: coverpoint intf.valid;
    cp_din: coverpoint intf.din;
  endgroup
  cg c=new();
endmodule
