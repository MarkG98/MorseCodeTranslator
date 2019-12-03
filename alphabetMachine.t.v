// Test bench for the alphabet machine

// include alphabet FSM
`include "alphabetMachine.v"

// Input signal defines
`define WAIT 3'h0
`define DIT 3'h1
`define DAH 3'h2
`define GAP 3'h3
`define SPACE 3'h4

module testAlphabetMachine();
  reg clk;
  reg [2:0] inputSignal;
  wire done;
  wire [7:0] letter;

  // Instantiate the alphabetMachine
  alphaFSM dut(.clk(clk),
               .inputSignal(inputSignal),
               .done(done),
               .letter(letter));
  initial begin
    clk = 0;


    $display("Signal | done |   letter  | state");
    $display("------------------------------------");
    $display("Testing E");
    $display("------------------------------------");
    inputSignal = `DIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `GAP; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `WAIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `WAIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    $display("------------------------------------");
    $display("Testing B");
    $display("------------------------------------");
    inputSignal = `DAH; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `DIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `DIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `DIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `GAP; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `WAIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `WAIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    $display("-------------------------------------");
    $display("Testing Space");
    $display("-------------------------------------");
    inputSignal = `SPACE; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `WAIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `WAIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `DIT; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `SPACE; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `SPACE; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
    inputSignal = `SPACE; #5 clk = 1; #5 clk = 0;
    $display("%b    |  %b   |   %d     |  %d", inputSignal, done, letter, dut.state);
  end
endmodule
