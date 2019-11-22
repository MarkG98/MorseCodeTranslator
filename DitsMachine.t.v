`include "DitsMachine.v"

module DitsMachineTest ();
  reg bigclk;
  reg signal;
  wire [2:0] ditsdahs;

  DitsMachine machination(.ditsdahs(ditsdahs), .signal(signal), .bigclk(bigclk));

  initial begin

    `define change(sig) \
    bigclk = 0; signal = sig; #5 bigclk = 1; #5

    $dumpfile("Dit.vcd");
    $dumpvars();

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
