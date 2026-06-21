module traffic_light_controller(tl_if intf);
  typedef enum logic [1:0] {HW_GREEN, HW_YELLOW, SD_GREEN, SD_YELLOW} st_t;
  st_t st;
  logic [3:0] cnt;
  always_ff @(posedge intf.clk or negedge intf.rst_n) begin
    if(!intf.rst_n) begin st<=HW_GREEN; cnt<=0; end
    else begin
      cnt <= cnt + 1;
      unique case(st)
        HW_GREEN:  if(intf.car_wait && cnt==4'd7) begin st<=HW_YELLOW; cnt<=0; end
        HW_YELLOW: if(cnt==4'd2) begin st<=SD_GREEN; cnt<=0; end
        SD_GREEN:  if(cnt==4'd7) begin st<=SD_YELLOW; cnt<=0; end
        SD_YELLOW: if(cnt==4'd2) begin st<=HW_GREEN; cnt<=0; end
      endcase
    end
  end
  always_comb begin
    intf.highway = (st==HW_GREEN)?2'b10:(st==HW_YELLOW)?2'b01:2'b00;
    intf.side    = (st==SD_GREEN)?2'b10:(st==SD_YELLOW)?2'b01:2'b00;
  end
endmodule
