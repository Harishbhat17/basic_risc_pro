`timescale 1ns/1ps
import alu8_tests_pkg::*;
module alu8_tb;
  logic clk=0,rst_n=0; always #5 clk=~clk;
  alu8_if intf(.clk(clk), .rst_n(rst_n));
  alu8_design dut(.intf(intf));
  alu8_assertions a0(.intf(intf));
  alu8_coverage c0(.intf(intf));
  alu8_txn t;
  function automatic [7:0] ref_model(input [2:0] op, input [7:0] a,b);
    case(op)
      0: ref_model=a+b;
      1: ref_model=a-b;
      2: ref_model=a&b;
      3: ref_model=a|b;
      4: ref_model=a^b;
      default: ref_model=0;
    endcase
  endfunction
  initial begin
    intf.valid=0; intf.op=0; intf.a=0; intf.b=0;
    repeat(2) @(posedge clk); rst_n=1;
    // directed
    intf.valid=1; intf.op=0; intf.a=8'h0F; intf.b=8'h01; @(posedge clk);
    // random
    repeat(30) begin
      t=new(); void'(t.randomize());
      intf.op=t.op; intf.a=t.a; intf.b=t.b; intf.valid=1;
      @(posedge clk);
      if(intf.y!==ref_model(t.op,t.a,t.b)) $error("ALU mismatch op=%0d a=%0h b=%0h y=%0h",t.op,t.a,t.b,intf.y);
    end
    $finish;
  end
endmodule
