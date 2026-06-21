interface mp_fifo_if(input logic wr_clk, input logic rd_clk, input logic rst_n);
  logic [1:0] wr_en;
  logic [1:0][7:0] wdata;
  logic rd_en;
  logic [7:0] rdata;
  logic full, empty;
endinterface
