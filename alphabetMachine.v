`ifndef ALPHA
`define ALPHA

// FSM which takes a dot, dash, or gap as an input and tracks through a tree of the alphabet with these signals

// Input signal defines
`define WAIT 3'h0
`define DIT 3'h1
`define DAH 3'h2
`define GAP 3'h3
`define SPACE 3'h4

module alphaFSM
(
  output reg [7:0] letter, // output letter
  output reg done, //
  input [2:0] inputSignal, // Can be dit, dah, gap, space, or wait
  input clk
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
             Zee = 26,
             space = 27;

  // Set initial state to start
  initial begin
      state = start;
      letter = 8'b0;
  end

  // Update the state on the positive clock edge
  always @ ( posedge clk ) begin

      // Go back to start if a gap is reveived to
      // start a new letter
      if (inputSignal == `GAP) begin
        state <= start;
      end

      // If we encounter a space while in the start state go to the space
      // state and then to the start state
     if (state == start && inputSignal == `SPACE) begin
       state <= space;
     end
     if (state != start && inputSignal == `SPACE) begin
       state <= state;
     end
     if (state == space) begin
       state <= start;
     end

      // If a dit, dash, space, or gap has not yet been established,
      // stay in the same state (i.e. don't change leter).
      // Note that space will always go to start on the clock posedge
      // so we don't wait when in this state.
      if (state != space && inputSignal == `WAIT) begin
        state <= state;
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

  always @( state ) begin
      case (state)
        start: begin done = 1; letter = letter; end
        A: begin done = 0; letter = 65; end
        B: begin done = 0; letter = 66; end
        C: begin done = 0; letter = 67; end
        D: begin done = 0; letter = 68; end
        E: begin done = 0; letter = 69; end
        F: begin done = 0; letter = 70; end
        G: begin done = 0; letter = 71; end
        H: begin done = 0; letter = 72; end
        I: begin done = 0; letter = 73; end
        J: begin done = 0; letter = 74; end
        K: begin done = 0; letter = 75; end
        L: begin done = 0; letter = 76; end
        M: begin done = 0; letter = 77; end
        N: begin done = 0; letter = 78; end
        O: begin done = 0; letter = 79; end
        P: begin done = 0; letter = 80; end
        Q: begin done = 0; letter = 81; end
        R: begin done = 0; letter = 82; end
        S: begin done = 0; letter = 83; end
        T: begin done = 0; letter = 84; end
        U: begin done = 0; letter = 85; end
        V: begin done = 0; letter = 86; end
        W: begin done = 0; letter = 87; end
        Ex: begin done = 0; letter = 88; end
        Y: begin done = 0; letter = 89; end
        Zee: begin done = 0; letter = 90; end
        space: begin done = 0; letter = 32; end
      endcase
  end
endmodule
`endif
