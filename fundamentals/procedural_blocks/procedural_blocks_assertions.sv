module procedural_blocks_assertions(proc_if intf);
  property reset_clears; @(posedge intf.clk) !intf.rst_n |=> intf.y==0; endproperty
  assert property(reset_clears);
endmodule
