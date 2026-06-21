module alu8_design(alu8_if intf);
  logic [8:0] tmp;
  always_ff @(posedge intf.clk or negedge intf.rst_n) begin
    if(!intf.rst_n) begin intf.y<=0; intf.carry<=0; end
    else if(intf.valid) begin
      unique case(intf.op)
        3'd0: begin tmp = intf.a + intf.b; intf.y<=tmp[7:0]; intf.carry<=tmp[8]; end
        3'd1: begin tmp = intf.a - intf.b; intf.y<=tmp[7:0]; intf.carry<=tmp[8]; end
        3'd2: begin intf.y<=intf.a & intf.b; intf.carry<=0; end
        3'd3: begin intf.y<=intf.a | intf.b; intf.carry<=0; end
        3'd4: begin intf.y<=intf.a ^ intf.b; intf.carry<=0; end
        default: begin intf.y<=0; intf.carry<=0; end
      endcase
    end
  end
endmodule
