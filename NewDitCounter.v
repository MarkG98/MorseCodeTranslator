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

module NewDitCounter
#(parameter WIDTH=27)
 (
  output reg [2:0] ditsdahs,
  input signal,
  input clk
  );
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
    if (count[WIDTH:WIDTH-2] == 3'b011) begin
      ditsdahs = `GAP;
    end
    if (count[WIDTH:WIDTH-2] == 3'b111) begin
      ditsdahs = `SPACE;
    end
  end
  always @ (posedge clk) begin
    ditsdahs = `WAIT;
  end
endmodule // NewDitCounter