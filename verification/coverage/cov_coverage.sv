module cov_coverage(cov_if intf);
  covergroup cg @(posedge intf.clk);
    mode_cp: coverpoint intf.mode;
    burst_cp: coverpoint intf.burst { bins short={[1:3]}; bins long={[8:15]}; }
    mode_x_burst: cross mode_cp, burst_cp;
    reactive_cp: coverpoint intf.start iff(intf.mode==2'b10);
  endgroup
  cg c = new();
endmodule
