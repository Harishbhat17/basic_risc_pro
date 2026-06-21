module sb_design(sb_if intf);
  always_ff @(posedge intf.clk or negedge intf.rst_n)
    if(!intf.rst_n) intf.sum <= 0;
    else if(intf.valid) intf.sum <= intf.a + intf.b;
endmodule
