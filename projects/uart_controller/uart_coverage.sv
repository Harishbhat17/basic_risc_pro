module uart_coverage(uart_if intf);
  covergroup cg @(posedge intf.clk);
    cp_start: coverpoint intf.tx_start;
    cp_busy: coverpoint intf.tx_busy;
    cp_data: coverpoint intf.tx_data;
  endgroup
  cg c=new();
endmodule
