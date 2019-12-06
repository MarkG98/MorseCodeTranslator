`ifndef MORSE
`define MORSE

`include "DitDahDecoder.v"
`include "alphabetMachine.v"

module MorseDecoder
  (
    output [7:0] letter,
    output done,
    input signal,
    input clk
  );

    wire [2:0] ditsdahs;

    // Instantiate translater from 1s and 0s to dits, dahs, spaces, and gaps
    DitDahDecoder #(27) sub_decoder(.ditsdahs(ditsdahs),
                               .signal(signal),
                               .clk(clk));

    alphaFSM alphabet(.letter(letter),
                      .done(done),
                      .inputSignal(ditsdahs),
                      .clk(clk));

endmodule // MorseDecoder
`endif