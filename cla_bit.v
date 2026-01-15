module cla_bit(
    input  a,
    input  b,
    input  cin,
    output sum,
    output p,
    output g
);

    assign p   = a ^ b;      
    assign g   = a & b;      
    assign sum = p ^ cin;    

endmodule
