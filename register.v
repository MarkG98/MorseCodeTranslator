`ifndef REGISTER
`define REGISTER
// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q <= d;
        end
    end

endmodule

// 32-bit D Flip-Flop with enable
//   Positive edge triggered
module register32
#(parameter WIDTH=32)
(
output reg[WIDTH-1:0]	q,
input[WIDTH-1:0] d,
input	wrenable,
input	clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q <= d;
        end
    end

endmodule

// 32-bit D (Always-Zero) Flip-Flop with enable
//   Positive edge triggered
module register32zero
#(parameter WIDTH=32)
(
output reg[WIDTH-1:0] q,
input[WIDTH-1:0] d,
input wrenable,
input clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q <= {WIDTH{1'b0}};
        end
    end

endmodule
`endif
