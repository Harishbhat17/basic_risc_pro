module factory_coverage(factory_if intf);
  covergroup cg @(posedge intf.clk); coverpoint intf.data; endgroup
  cg c=new();
endmodule
