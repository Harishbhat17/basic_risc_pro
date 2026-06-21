module basic_design(basic_if intf);
  always_ff @(posedge intf.clk or negedge intf.rst_n)
    if(!intf.rst_n) intf.dout <= 0;
    else if(intf.valid) intf.dout <= intf.din + 1;
endmodule
