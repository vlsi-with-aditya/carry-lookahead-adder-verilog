module cla16(
    input  [15:0] X, Y,
    input  cin,
    output [15:0] S,
    output cout,
    output Sign, Zero, Parity, Overflow
);

    wire [3:0] P, G;
    wire c1, c2, c3;

    cla4 A0(X[3:0],   Y[3:0],   cin, S[3:0],   , P[0], G[0]);
    cla4 A1(X[7:4],   Y[7:4],   c1,  S[7:4],   , P[1], G[1]);
    cla4 A2(X[11:8],  Y[11:8],  c2,  S[11:8],  , P[2], G[2]);
    cla4 A3(X[15:12], Y[15:12], c3,  S[15:12], cout, P[3], G[3]);

    assign c1 = G[0] | (P[0] & cin);
    assign c2 = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
    assign c3 = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) |
                (P[2] & P[1] & P[0] & cin);

    assign Sign     = S[15];
    assign Zero     = ~|S;
    assign Parity   = ^S;
    assign Overflow = (X[15] & Y[15] & ~S[15]) | (~X[15] & ~Y[15] & S[15]);

endmodule
