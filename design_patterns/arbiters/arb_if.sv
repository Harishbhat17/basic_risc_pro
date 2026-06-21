interface arb_if(input logic clk, input logic rst_n);
  logic [3:0] req;
  logic [3:0] gnt_pri, gnt_rr;
endinterface
