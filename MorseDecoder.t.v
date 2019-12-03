`include "MorseDecoder.v"

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
    signal = sig; #330 #330

    $dumpfile("Decoder.vcd");
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
