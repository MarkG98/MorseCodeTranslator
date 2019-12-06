//-----------------------------------------------------------------------------
//  Wrapper for Final Project
//
//  Rationale:
//     The ZYBO board has 4 buttons, 4 switches, and 4 LEDs. But if we want to
//     show the results of a 4-bit add operation, we will need at least 6 LEDs!
//
//     This wrapper module assumes the use of the Pmod 8LD LED module and the
//     Pmod SWT switch module. In the following code the 8LD is plugged into JE
//     (bottom left) and the SWT is plugged into the top half of JA (right side),
//     but you can change that in code.
//
//  Your job:
//     Write FullAdder4bit with the proper port signature. It will be instantiated
//     by the lab0_wrapper_pmod module in this file, which interfaces with the
//     switches and LEDs for you.
//
//     Note: Be sure to un-comment in your project XDC file: btn, je
//
//     Note: Buttons, switches, and LEDs have the least-significant (0) position
//     labeled (usually on the right, except the SWT Pmod).
//-----------------------------------------------------------------------------

`timescale 1ns / 1ps

`include "MorseDecoder.v"

module lab0_wrapper_pmod
(
    input [3:0] btn,             // Button 0, used for inputting the "morse code"
    input clk,
    output [7:0] je
);

    wire inputSignal;        // Input to decoder
    wire [7:0] letter;           // 8-bit ASCII code
    wire done;                   // Done flag

    MorseDecoder decoder(.letter(letter),
                         .done(done),
                         .signal(inputSignal),
                         .clk(clk));

    assign inputSignal = btn[0];
    //assign je = clk;
    assign je[0] = decoder.sub_decoder.count[27];

    // always @( * ) begin
    //   if (done) begin
    //     je = letter;
    //   end
    // end
endmodule
