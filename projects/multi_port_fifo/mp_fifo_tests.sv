package mp_fifo_tests_pkg;
  task automatic push2(virtual mp_fifo_if intf, input [7:0] d0, input [7:0] d1);
    intf.wdata[0]<=d0; intf.wdata[1]<=d1; intf.wr_en<=2'b11;
    @(posedge intf.wr_clk); intf.wr_en<=0;
  endtask
endpackage
