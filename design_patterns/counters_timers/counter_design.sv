module counter_design(counter_if intf);
  logic [7:0] timer;
  always_ff @(posedge intf.clk or negedge intf.rst_n) begin
    if(!intf.rst_n) begin intf.up_count<=0; intf.down_count<=8'hFF; timer<=0; intf.tick<=0; end
    else if(intf.en) begin
      intf.up_count<=intf.up_count+1;
      intf.down_count<=intf.down_count-1;
      timer<=timer+1;
      intf.tick <= (timer==8'd99);
    end else intf.tick<=0;
  end
endmodule
