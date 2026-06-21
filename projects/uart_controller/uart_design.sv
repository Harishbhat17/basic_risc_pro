module uart_controller #(parameter BAUD_DIV=16)(uart_if intf);
  logic [3:0] bit_idx;
  logic [7:0] shreg;
  logic [7:0] baud_cnt;
  always_ff @(posedge intf.clk or negedge intf.rst_n) begin
    if(!intf.rst_n) begin intf.tx_busy<=0; intf.txd<=1; bit_idx<=0; baud_cnt<=0; shreg<=0; end
    else if(intf.tx_start && !intf.tx_busy) begin intf.tx_busy<=1; shreg<=intf.tx_data; bit_idx<=0; baud_cnt<=0; intf.txd<=0; end
    else if(intf.tx_busy) begin
      baud_cnt <= baud_cnt + 1;
      if(baud_cnt==BAUD_DIV-1) begin
        baud_cnt<=0;
        if(bit_idx<8) begin intf.txd<=shreg[bit_idx]; bit_idx<=bit_idx+1; end
        else begin intf.txd<=1; intf.tx_busy<=0; end
      end
    end
  end
  always_ff @(posedge intf.clk or negedge intf.rst_n) begin
    if(!intf.rst_n) begin intf.rx_valid<=0; intf.rx_data<=0; end
    else begin intf.rx_valid<=0; if(!intf.tx_busy && intf.tx_start) begin intf.rx_data<=intf.tx_data; intf.rx_valid<=1; end end
  end
endmodule
