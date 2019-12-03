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
    input  btn,             // Button 0, used for inputting the "morse code"
    output [7:0] je         // Plug LD8 into JE, used to display the ASCII code of the decoded letter
);

    wire reg inputSignal;        // Input to decoder
    wire [7:0] letter;           // 8-bit ASCII code
    wire done;                   // Done flag

    MorseDecoder decoder(.letter(letter),.done(done),.signal(inputSignal),.clk(clk));

    always(@ posedge clk) begin
      if (done) begin
        assign inputSignal = btn;
        assign letter = je[7:0];
      end
    end

    // Assign logical signals to physical ports (change these if you move the Pmods)
    assign inputSignal = btn;
    assign letter = je[7:0];

endmodule
