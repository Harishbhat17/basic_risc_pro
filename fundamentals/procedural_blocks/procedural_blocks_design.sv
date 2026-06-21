module procedural_blocks_design(proc_if intf);
  logic [7:0] sum;
  always_comb begin
    sum = intf.a + intf.b;
  end
  always_ff @(posedge intf.clk or negedge intf.rst_n) begin
    if(!intf.rst_n) intf.y <= '0;
    else if(intf.en) intf.y <= sum;
  end
  initial begin
    // initial block for simulation-only power-up note
  end
endmodule
