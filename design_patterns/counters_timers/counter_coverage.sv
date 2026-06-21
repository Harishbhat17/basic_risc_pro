module counter_coverage(counter_if intf);
  covergroup cg @(posedge intf.clk);
    cp_tick: coverpoint intf.tick;
    cp_up: coverpoint intf.up_count;
  endgroup
  cg c=new();
endmodule
