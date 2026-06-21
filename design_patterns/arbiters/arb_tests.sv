package arb_tests_pkg;
  task automatic drive_req(ref logic [3:0] req, input logic clk, input logic [3:0] v);
    req<=v; @(posedge clk);
  endtask
endpackage
