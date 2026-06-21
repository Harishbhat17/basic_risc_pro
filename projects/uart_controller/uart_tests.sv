package uart_tests_pkg;
  task automatic send_byte(virtual uart_if intf, input [7:0] d);
    intf.tx_data<=d; intf.tx_start<=1; @(posedge intf.clk); intf.tx_start<=0;
  endtask
endpackage
