package classes_pkg;
  class packet;
    rand bit [7:0] payload;
    virtual function string kind(); return "packet"; endfunction
  endclass
  class tagged_packet extends packet;
    rand bit [3:0] tag;
    function string kind(); return "tagged_packet"; endfunction
  endclass
  class printer;
    static function void print(packet p);
      $display("kind=%s payload=%0h", p.kind(), p.payload);
    endfunction
  endclass
endpackage
module classes_example(classes_if.drv intf);
  import classes_pkg::*;
  packet p;
  always_ff @(posedge intf.clk) begin
    p = new(); void'(p.randomize());
    intf.valid <= 1'b1;
    intf.data <= p.payload;
  end
endmodule
