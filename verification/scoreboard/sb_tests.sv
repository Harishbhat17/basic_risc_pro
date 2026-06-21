package sb_tests_pkg;
  class scoreboard;
    int pass, fail;
    function void check(bit [7:0] a, bit [7:0] b, bit [8:0] got);
      bit [8:0] exp = a + b;
      if (exp===got) pass++; else begin fail++; $error("SB mismatch exp=%0d got=%0d",exp,got); end
    endfunction
  endclass
endpackage
