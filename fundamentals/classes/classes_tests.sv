package classes_tests_pkg;
  task automatic run_cycles(input int n, ref logic clk);
    repeat(n) @(posedge clk);
  endtask
endpackage
