package procedural_blocks_tests_pkg;
  task automatic drive(virtual proc_if intf, bit [7:0] a, bit [7:0] b);
    intf.en<=1; intf.a<=a; intf.b<=b; @(posedge intf.clk); intf.en<=0;
  endtask
endpackage
