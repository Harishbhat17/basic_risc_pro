module fsm_design(fsm_if intf);
  typedef enum logic [1:0] {IDLE,S1,S2} state_t;
  state_t s, ns;
  always_comb begin
    ns = s;
    case(s)
      IDLE: if(intf.in_sig) ns=S1;
      S1:   ns = intf.in_sig ? S2 : IDLE;
      S2:   ns = intf.in_sig ? S2 : IDLE;
    endcase
    intf.mealy_out = (s==S1 && intf.in_sig);
  end
  always_ff @(posedge intf.clk or negedge intf.rst_n) begin
    if(!intf.rst_n) s<=IDLE;
    else s<=ns;
  end
  assign intf.moore_out = (s==S2);
endmodule
