module fsm_coverage(fsm_if intf);
  covergroup cg @(posedge intf.clk);
    cp_in: coverpoint intf.in_sig;
    cp_mealy: coverpoint intf.mealy_out;
    cp_moore: coverpoint intf.moore_out;
    cp_cross: cross cp_in, cp_moore;
  endgroup
  cg c=new();
endmodule
