interface counter_if(input logic clk, input logic rst_n);
  logic en;
  logic [7:0] up_count, down_count;
  logic tick;
endinterface
