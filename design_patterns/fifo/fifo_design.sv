module sync_fifo #(parameter DEPTH=16)(fifo_if intf);
  logic [7:0] mem [0:DEPTH-1];
  logic [$clog2(DEPTH):0] wptr, rptr;
  always_ff @(posedge intf.clk or negedge intf.rst_n) begin
    if(!intf.rst_n) begin wptr<=0; rptr<=0; intf.rdata<=0; end
    else begin
      if(intf.wr_en && !intf.full) begin mem[wptr[$clog2(DEPTH)-1:0]]<=intf.wdata; wptr<=wptr+1; end
      if(intf.rd_en && !intf.empty) begin intf.rdata<=mem[rptr[$clog2(DEPTH)-1:0]]; rptr<=rptr+1; end
    end
  end
  always_comb begin
    intf.full  = ((wptr-rptr)==DEPTH);
    intf.empty = (wptr==rptr);
  end
endmodule
module async_fifo_stub(input logic wr_clk, rd_clk, rst_n);
  // Educational placeholder: gray pointers + 2FF sync in full implementation.
endmodule
