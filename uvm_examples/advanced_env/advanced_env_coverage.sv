module advanced_env_coverage(advanced_if intf);
  covergroup cg @(posedge intf.clk); coverpoint intf.valid; coverpoint intf.data; endgroup
  cg c=new();
endmodule
