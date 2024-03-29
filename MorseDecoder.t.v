`include "MorseDecoder.v"

/*
If you want to input your own message, each change function represents one time step.
A dit is one 1, a dah is three 1s, a gap is three 0s, and a space is seven 0s
E.g - to implement an A,
`change(1)
`change(0)
`change(1)
`change(1)
`change(1)
`change(0)
`change(0)
`change(0)
*/

module MorseDecoderTest ();
  reg clk;
  reg signal;
  wire [7:0] letter;
  wire done;

  MorseDecoder #(8) decoder(.letter(letter),.done(done), .signal(signal), .clk(clk));

  always begin
    #5 clk = ~clk;
  end
  initial begin
    clk = 0;
    `define change(sig) \
    signal = sig; #325 #330

    $dumpfile("Decoder.vcd");
    $dumpvars();
    clk = !clk; #5
    //M
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    //A
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    //R
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    //K
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    //
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    //A
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    //N
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    //D
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(1)
    `change(0)
    `change(1)
    //
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    //J
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    //I
    `change(1)
    `change(0)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    //L
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(1)
    `change(0)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    //L
    `change(1)
    `change(0)
    `change(1)
    `change(1)
    `change(1)
    `change(0)
    `change(1)
    `change(0)
    `change(1)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)
    `change(0)


    $finish();
  end
endmodule //DitsMachineTest
