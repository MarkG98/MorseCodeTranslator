// Outdated machine that converted a signal to dits and dahs.

`define WAIT 3'h0
`define DIT 3'h1
`define DAH 3'h2
`define GAP 3'h3
`define SPACE 3'h4


module DitsMachine (
  output reg [2:0] ditsdahs,
  input signal,
  input bigclk
  );

// State encoding (binary counter)
reg [3:0] state;
localparam INIT = 0,
           GOTONE = 1,
           ONEZERO = 2,
           ONEONE = 3,
           ONEONEONE = 4,
           ONEONEONEZERO = 5,
           ZEROZERO = 6,
           ZEROZEROZERO = 7,
           ZEROZEROZEROONE = 8,
           ZEROZEROZEROZERO= 9,
           ZEROZEROZEROZEROZERO = 10,
           ZEROZEROZEROZEROZEROZERO = 11,
           ZEROZEROZEROZEROZEROZEROZERO = 12;


//Initialize state to IF_
initial begin
  state = INIT;
end

// Change state on the p-clk edge
always @ (posedge bigclk) begin
  // Transitions from IF_
  if (state == INIT && signal == 1) begin
    state <= GOTONE;
  end
  if (state == GOTONE && signal == 0) begin
    state <= ONEZERO;
  end
  if (state == GOTONE && signal == 1) begin
    state <= ONEONE;
  end
  if (state == ONEONE && signal == 1) begin
    state <= ONEONEONE;
  end
  if (state == ONEONEONE && signal == 0) begin
    state <= ONEONEONEZERO;
  end
  if (state == ONEZERO && signal == 1) begin
    state <= GOTONE;
  end
  if (state == ONEONEONEZERO && signal == 1) begin
    state <= GOTONE;
  end
  if (state == ONEZERO && signal == 0) begin
    state <= ZEROZERO;
  end
  if (state == ONEONEONEZERO && signal == 0) begin
    state <= ZEROZERO;
  end
  if (state == ZEROZERO && signal == 0) begin
    state <= ZEROZEROZERO;
  end
  if (state == ZEROZEROZERO && signal == 1) begin
    state <= ZEROZEROZEROONE;
  end
  if (state == ZEROZEROZERO && signal == 0) begin
    state <= ZEROZEROZEROZERO;
  end
  if (state == ZEROZEROZEROZERO && signal == 0) begin
    state <= ZEROZEROZEROZEROZERO;
  end
  if (state == ZEROZEROZEROZEROZERO && signal == 0) begin
    state <= ZEROZEROZEROZEROZEROZERO;
  end
  if (state == ZEROZEROZEROZEROZEROZERO && signal == 0) begin
    state <= ZEROZEROZEROZEROZEROZEROZERO;
  end
  if (state == ZEROZEROZEROZEROZEROZEROZERO && signal == 1) begin
    state <= GOTONE;
  end
  if (state == ZEROZEROZEROONE && signal == 1) begin
    state <= ONEONE;
  end
  if (state == ZEROZEROZEROONE && signal == 0) begin
    state <= ONEZERO;
  end
  // if (state == EX_SUB) begin
  //   state <= WB_ADD_SUB_SLT;
  // end
  // if (state == EX_SLT) begin
  //   state <= WB_ADD_SUB_SLT;
  // end
  // if (state == EX_JR) begin
  //   state <= IF_;
  // end
  // if (state == EX_BEQ) begin
  //   state <= IF_;
  // end
  // if (state == EX_BNE) begin
  //   state <= IF_;
  // end
  // // Transitions from MEM
  // if (state == MEM_LW) begin
  //   state <= WB_LW;
  // end
  // if (state == MEM_SW) begin
  //   state <= IF_;
  // end
  //
  // // Transition from WB
  // if (state == WB_LW || state == WB_ADDI_XORI || state == WB_ADD_SUB_SLT) begin
  //   state <= IF_;
  // end
end

// output reg logic (depends only on state - Moore machine)
always @ (state) begin
  case (state)
    INIT: begin ditsdahs = 0; end
    GOTONE: begin ditsdahs = 0; end
    ONEZERO: begin ditsdahs = 1; end
    ONEONE: begin ditsdahs = 0; end
    ONEONEONE: begin ditsdahs = 0; end
    ONEONEONEZERO: begin ditsdahs = 2; end
    ZEROZERO: begin ditsdahs = 0; end
    ZEROZEROZERO: begin ditsdahs = 3; end
    ZEROZEROZEROONE: begin ditsdahs = 0; end
    ZEROZEROZEROZERO: begin ditsdahs = 0; end
    ZEROZEROZEROZEROZERO: begin ditsdahs = 0; end
    ZEROZEROZEROZEROZEROZERO: begin ditsdahs = 0; end
    ZEROZEROZEROZEROZEROZEROZERO: begin ditsdahs = 4; end
  endcase
end
endmodule // DitsMachine
