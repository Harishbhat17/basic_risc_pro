module procedural_blocks_coverage(proc_if intf);
  covergroup cg @(posedge intf.clk);
    cp_en: coverpoint intf.en;
    cp_y: coverpoint intf.y;
  endgroup
  cg c=new();
endmodule
