package apb_tests_pkg;
  task automatic apb_write(virtual apb_if.master vif, logic [31:0] a, logic [31:0] d);
    vif.paddr<=a; vif.pwdata<=d; vif.pwrite<=1; vif.psel<=1; vif.penable<=0;
    @(posedge vif.pclk); vif.penable<=1; @(posedge vif.pclk); vif.psel<=0; vif.penable<=0;
  endtask
endpackage
