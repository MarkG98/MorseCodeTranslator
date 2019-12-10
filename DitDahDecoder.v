/*
This code takes a signal and a clock and outputs dits, dahs, gaps, and spaces.
The Width defines the amount of time that the counter will count to, or in
other words the amount of time for each dit and dah.
*/

`ifndef DITDAH
`define DITDAH

`define WAIT 3'h0
`define DIT 3'h1
`define DAH 3'h2
`define GAP 3'h3
`define SPACE 3'h4

module counterReset
#(parameter WIDTH=27)
(
  output reg [WIDTH:0] count,
  input clk,
  input signal
);

  reg previous = 0;

  initial begin
    count = 0;
  end

  always @ (posedge clk) begin
    if (signal === previous) begin
      count <= count+1;
    end
    else begin
      count <= 0;
    end
    previous <= signal;
  end
endmodule // counter

module DitDahDecoder
#(parameter WIDTH=27)
 (
  output reg [2:0] ditsdahs,
  input signal,
  input clk
  );
  reg prevVal;
  wire [WIDTH:0] count;
  counterReset #(WIDTH) countRes(.count(count),.clk(clk),.signal(signal));
  always @ (posedge clk) begin
    if(prevVal == 1 && signal == 0) begin
      if (count[WIDTH:WIDTH-2] == 3'b001) begin
        ditsdahs <= `DIT;
      end
      if (count[WIDTH:WIDTH-2] == 3'b011) begin
        ditsdahs <= `DAH;
      end
    end
    else if(prevVal == 0 && signal == 1) begin
      if (count[WIDTH:WIDTH-2] == 3'b111) begin
        ditsdahs <= `SPACE;
      end
    end
    else if (count[WIDTH:WIDTH-2] == 3'b011 && count[WIDTH-3:0] == 0 && signal == 0) begin
      ditsdahs <= `GAP;
    end
    else begin
      ditsdahs <= `WAIT;
    end
    prevVal <= signal;
  end
endmodule // DitDahDecoder
`endif
