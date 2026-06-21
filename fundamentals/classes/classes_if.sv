interface classes_if(input logic clk);
  logic valid;
  logic [7:0] data;
  modport drv(output valid, data);
  modport mon(input valid, data);
endinterface
