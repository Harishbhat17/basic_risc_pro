module uvm_basic_coverage(uvm_basic_if intf);
  covergroup cg @(posedge intf.clk);
    cp_valid: coverpoint intf.valid;
    cp_data: coverpoint intf.data;
  endgroup
  cg c=new();
endmodule
