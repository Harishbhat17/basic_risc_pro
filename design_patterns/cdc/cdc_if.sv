interface cdc_if(input logic src_clk, input logic dst_clk);
  logic rst_n;
  logic src_req, src_ack;
  logic dst_req, dst_ack;
endinterface
