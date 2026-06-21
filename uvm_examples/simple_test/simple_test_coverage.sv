module simple_test_coverage(simple_test_if intf);
  covergroup cg @(posedge intf.clk); cp: coverpoint intf.valid; endgroup
  cg c=new();
endmodule
