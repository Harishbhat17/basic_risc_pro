interface rand_if(input logic clk);
  logic valid;
  logic [3:0] opcode;
  logic [7:0] a,b;
endinterface
