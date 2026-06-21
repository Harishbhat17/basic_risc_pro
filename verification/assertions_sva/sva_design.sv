module sva_design(sva_if intf);
  always_ff @(posedge intf.clk or negedge intf.rst_n)
    if(!intf.rst_n) intf.gnt <= 0;
    else intf.gnt <= intf.req;
endmodule
