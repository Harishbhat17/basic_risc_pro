interface uart_if(input logic clk, input logic rst_n);
  logic tx_start, tx_busy, txd;
  logic [7:0] tx_data;
  logic rxd, rx_valid;
  logic [7:0] rx_data;
endinterface
