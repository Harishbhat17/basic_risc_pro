interface alu8_if(input logic clk, input logic rst_n);
  logic valid;
  logic [2:0] op;
  logic [7:0] a,b;
  logic [7:0] y;
  logic carry;
endinterface
