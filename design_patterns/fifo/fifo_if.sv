interface fifo_if(input logic clk, input logic rst_n);
  logic wr_en, rd_en;
  logic [7:0] wdata, rdata;
  logic full, empty;
endinterface
