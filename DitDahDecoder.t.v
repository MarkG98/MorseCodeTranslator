`include "DitDahDecoder.v"

module DitDahDecoderest ();
  reg clk;
  reg signal;
  wire [2:0] ditsdahs;

  DitDahDecoder #(8) newage(.ditsdahs(ditsdahs), .signal(signal), .clk(clk));
  always begin
    #5 clk = ~clk;
  end
  initial begin
    clk = 0;
    `define change(sig) \
    signal = sig; #330 #330

    $dumpfile("Dit.vcd");
    $dumpvars();
    clk = !clk; #5
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(1)



    $finish();
  end
endmodule //DitsMachineTest
