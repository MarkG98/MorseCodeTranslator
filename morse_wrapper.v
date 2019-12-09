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
`include "register.v"

module lab0_wrapper_pmod
(
    input [3:0] btn,             // Button 0, used for inputting the "morse code"
    input clk,
    output reg [7:0] je,
    output [3:0] led
);

    wire inputSignal;        // Input to decoder
    wire [7:0] letter;           // 8-bit ASCII code
    wire done;                   // Done flag

    wire synch0out;
    wire synch1out;

    register synch0(.d(inputSignal),
                    .q(synch0out),
                    .wrenable(1'b1),
                    .clk(clk));

    register synch1(.d(synch0out),
                    .q(synch1out),
                    .wrenable(1'b1),
                    .clk(clk));


    MorseDecoder #(29) decoder(.letter(letter),
                         .done(done),
                         .signal(synch1out),
                         .clk(clk));

    assign inputSignal = btn[0];

    assign led[0] = decoder.sub_decoder.count[29];
    assign led[1] = decoder.sub_decoder.count[27];
    assign led[2] = done;
    assign led[3] = synch1out;

    always @( * ) begin
       je <= letter;
    end
endmodule
