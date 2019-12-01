// FSM which takes a dot, dash, or gap as an input and tracks through a tree of the alphabet with these signals

// Input signal defines
`define WAIT 3'h0
`define DIT 3'h1
`define DAH 3'h2
`define GAP 3'h3
`define SPACE 3'h4

module alphaFSM
(
  output reg [5:0] letter, // output letter
  input [2:0] inputSignal // Can be dit, dah, gap, space, or wait
);

  // state encoding (binary counter)
  reg [5:0] state;

  // states
  localparam start = 0,
             A = 1,
             B = 2,
             C = 3,
             D = 4,
             E = 5,
             F = 6,
             G = 7,
             H = 8,
             I = 9,
             J = 10,
             K = 11,
             L = 12,
             M = 13,
             N = 14,
             O = 15,
             P = 16,
             Q = 17,
             R = 18,
             S = 19,
             T = 20,
             U = 21,
             V = 22,
             W = 23,
             Ex = 24,
             Y = 25,
             Zee = 26;

  // Set initial state to start
  initial begin
      state = start;
  end

  // Update the state on the positive clock edge
  always @ ( posedge clk ) begin

      // If a dit, dash, space, or gap has not yet been established,
      // stay in the same state (i.e. don't change leter)
      if (inputSignal == `WAIT) begin
        state <= state;
      end

      // Go back to start if a gap is reveived to
      // start a new letter
      if (inputSignal == `GAP) begin
        state <= start;
      end

      // Transitions from start
      if (state == start && inputSignal == `DIT) begin
        state <= E;
      end
      if (state == start && inputSignal == `DAH) begin
        state <= T;
      end

      // Transitions from E
      if (state == E && inputSignal == `DIT) begin
        state <= I;
      end
      if (state == E && inputSignal == `DAH) begin
        state <= A;
      end

      // Transitions from T
      if (state == T && inputSignal == `DIT) begin
        state <= N;
      end
      if (state == T && inputSignal == `DAH) begin
        state <= M;
      end

      // Transitions from I
      if (state == I && inputSignal == `DIT) begin
        state <= S;
      end
      if (state == I && inputSignal == `DAH) begin
        state <= U;
      end

      // Transitions from A
      if (state == A && inputSignal == `DIT) begin
        state <= R;
      end
      if (state == A && inputSignal == `DAH) begin
        state <= W;
      end

      // Transitions from N
      if (state == N && inputSignal == `DIT) begin
        state <= D;
      end
      if (state == N && inputSignal == `DAH) begin
        state <= K;
      end

      // Transitions from M
      if (state == M && inputSignal == `DIT) begin
        state <= G;
      end
      if (state == M && inputSignal == `DAH) begin
        state <= O;
      end

      // Transitions from S
      if (state == S && inputSignal == `DIT) begin
        state <= H;
      end
      if (state == S && inputSignal == `DAH) begin
        state <= V;
      end

      // Transitions from U
      if (state == U && inputSignal == `DIT) begin
        state <= F;
      end

      // Transitions from R
      if (state == R && inputSignal == `DIT) begin
        state <= L;
      end

      // Transitions from W
      if (state == W && inputSignal == `DIT) begin
        state <= P;
      end
      if (state == W && inputSignal == `DAH) begin
        state <= J;
      end

      // Transitions from D
      if (state == D && inputSignal == `DIT) begin
        state <= B;
      end
      if (state == D && inputSignal == `DAH) begin
        state <= Ex;
      end

      // Transitions from K
      if (state == K && inputSignal == `DIT) begin
        state <= C;
      end
      if (state == K && inputSignal == `DAH) begin
        state <= Y;
      end

      // Transitions from G
      if (state == G && inputSignal == `DIT) begin
        state <= Zee;
      end
      if (state == G && inputSignal == `DAH) begin
        state <= Q;
      end

  end
endmodule
