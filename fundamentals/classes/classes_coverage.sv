module classes_coverage(classes_if intf);
  covergroup cg @(posedge intf.clk);
    cp_valid: coverpoint intf.valid;
    cp_data: coverpoint intf.data { bins low={[0:15]}; bins high={[240:255]}; }
  endgroup
  cg c=new();
endmodule
