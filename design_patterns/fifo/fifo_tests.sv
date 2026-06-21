package fifo_tests_pkg;
  task automatic push(virtual fifo_if intf, byte d);
    intf.wr_en<=1; intf.wdata<=d; @(posedge intf.clk); intf.wr_en<=0;
  endtask
  task automatic pop(virtual fifo_if intf);
    intf.rd_en<=1; @(posedge intf.clk); intf.rd_en<=0;
  endtask
endpackage
