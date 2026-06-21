module multi_port_fifo #(parameter DEPTH=32)(mp_fifo_if intf);
  logic [7:0] mem [0:DEPTH-1];
  logic [$clog2(DEPTH):0] wptr, rptr;
  integer k;
  always_ff @(posedge intf.wr_clk or negedge intf.rst_n) begin
    if(!intf.rst_n) wptr<=0;
    else begin
      for(k=0;k<2;k++) begin
        if(intf.wr_en[k] && !intf.full) begin mem[wptr[$clog2(DEPTH)-1:0]]<=intf.wdata[k]; wptr<=wptr+1; end
      end
    end
  end
  always_ff @(posedge intf.rd_clk or negedge intf.rst_n) begin
    if(!intf.rst_n) begin rptr<=0; intf.rdata<=0; end
    else if(intf.rd_en && !intf.empty) begin intf.rdata<=mem[rptr[$clog2(DEPTH)-1:0]]; rptr<=rptr+1; end
  end
  always_comb begin
    intf.empty = (wptr==rptr);
    intf.full  = ((wptr-rptr)>=DEPTH-2);
  end
endmodule
