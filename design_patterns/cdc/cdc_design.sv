module cdc_design(cdc_if intf);
  logic req_sync1, req_sync2;
  always_ff @(posedge intf.dst_clk or negedge intf.rst_n) begin
    if(!intf.rst_n) begin req_sync1<=0; req_sync2<=0; end
    else begin req_sync1<=intf.src_req; req_sync2<=req_sync1; end
  end
  assign intf.dst_req = req_sync2;
  assign intf.dst_ack = intf.dst_req;
  logic ack_sync1, ack_sync2;
  always_ff @(posedge intf.src_clk or negedge intf.rst_n) begin
    if(!intf.rst_n) begin ack_sync1<=0; ack_sync2<=0; end
    else begin ack_sync1<=intf.dst_ack; ack_sync2<=ack_sync1; end
  end
  assign intf.src_ack = ack_sync2;
endmodule
