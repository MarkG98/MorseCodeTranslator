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
  always @ (posedge clk) begin
    count = count+1;
  end
  always @ (negedge signal) begin
    #1 count = 0;
  end
  always @ (posedge signal) begin
    #1 count = 0;
  end
endmodule // counter

module DitDahDecoder
#(parameter WIDTH=27)
 (
  output reg [2:0] ditsdahs,
  input signal,
  input clk
  );
  reg flag;
  wire [WIDTH:0] count;
  counterReset #(WIDTH) countRes(.count(count),.clk(clk),.signal(signal));
  always @ (negedge signal) begin
    if (count[WIDTH:WIDTH-2] == 3'b001) begin
      ditsdahs = `DIT;
    end
    if (count[WIDTH:WIDTH-2] == 3'b011) begin
      ditsdahs = `DAH;
    end
  end
  always @ (posedge signal) begin
    flag = 0;
    if (count[WIDTH:WIDTH-2] == 3'b111) begin
      ditsdahs = `SPACE;
    end
  end
  always @ (posedge clk) begin
    if (count[WIDTH:WIDTH-2] == 3'b011 && signal == 0 && flag == 0) begin
      #1
      ditsdahs = `GAP;
      flag = 1;
    end
    else begin
      #1
      ditsdahs = `WAIT;
    end
  end
endmodule // DitDahDecoder
`endif
