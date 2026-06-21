module arb_design(arb_if intf);
  logic [1:0] rr_ptr;
  integer i;
  always_ff @(posedge intf.clk or negedge intf.rst_n) begin
    if(!intf.rst_n) rr_ptr <= 0;
    else if(|intf.gnt_rr) rr_ptr <= rr_ptr + 1;
  end
  always_comb begin
    intf.gnt_pri = 4'b0000;
    if(intf.req[0]) intf.gnt_pri=4'b0001;
    else if(intf.req[1]) intf.gnt_pri=4'b0010;
    else if(intf.req[2]) intf.gnt_pri=4'b0100;
    else if(intf.req[3]) intf.gnt_pri=4'b1000;

    intf.gnt_rr = 4'b0000;
    for(i=0;i<4;i++) begin
      if(intf.req[(rr_ptr+i)%4] && (intf.gnt_rr==0)) intf.gnt_rr[(rr_ptr+i)%4]=1'b1;
    end
  end
endmodule
