module cla4(
    input  [3:0] X, Y,
    input  cin,
    output [3:0] S,
    output cout,
    output P, G
);

    wire [3:0] p, g;
    wire c1, c2, c3;

    cla_bit b0(X[0], Y[0], cin, S[0], p[0], g[0]);
    cla_bit b1(X[1], Y[1], c1,  S[1], p[1], g[1]);
    cla_bit b2(X[2], Y[2], c2,  S[2], p[2], g[2]);
    cla_bit b3(X[3], Y[3], c3,  S[3], p[3], g[3]);

    assign c1 = g[0] | (p[0] & cin);
    assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) |
                (p[2] & p[1] & p[0] & cin);

    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) |
                  (p[3] & p[2] & p[1] & g[0]) |
                  (p[3] & p[2] & p[1] & p[0] & cin);

    assign P = &p;
    assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) |
               (p[3] & p[2] & p[1] & g[0]);

endmodule
