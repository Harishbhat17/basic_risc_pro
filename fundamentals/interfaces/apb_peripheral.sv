module apb_peripheral(apb_if.slave apb);
  logic [31:0] reg0;
  always_ff @(posedge apb.pclk or negedge apb.presetn) begin
    if (!apb.presetn) reg0 <= '0;
    else if (apb.psel && apb.penable && apb.pwrite) reg0 <= apb.pwdata;
  end
  always_comb begin
    apb.pready = 1'b1;
    apb.pslverr = 1'b0;
    apb.prdata = (apb.psel && !apb.pwrite) ? reg0 : 32'h0;
  end
endmodule
