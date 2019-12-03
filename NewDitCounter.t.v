`include "NewDitCounter.v"

module NewDitCounterTest ();
  reg clk;
  reg signal;
  wire [2:0] ditsdahs;

  NewDitCounter #(27) newage(.ditsdahs(ditsdahs), .signal(signal), .clk(clk));
  always begin
    #2 clk = ~clk;
  end
  initial begin
    clk = 0;
    `define change(sig) \
    signal = sig; #500000000 #500000000

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
