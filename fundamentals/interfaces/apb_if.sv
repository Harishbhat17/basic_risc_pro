interface apb_if(input logic pclk, input logic presetn);
  logic [31:0] paddr, pwdata, prdata;
  logic psel, penable, pwrite, pready, pslverr;
  modport master (output paddr, pwdata, psel, penable, pwrite, input prdata, pready, pslverr);
  modport slave  (input paddr, pwdata, psel, penable, pwrite, output prdata, pready, pslverr);
endinterface
