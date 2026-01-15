module tb;

    reg  [15:0] X, Y;
    reg  cin;
    wire [15:0] S;
    wire cout, Sign, Zero, Parity, Overflow;

    cla16 DUT(X, Y, cin, S, cout, Sign, Zero, Parity, Overflow);

    initial begin
        $dumpfile("cla16.vcd");
        $dumpvars(0, tb);

        X = 0; Y = 0; cin = 0;
        #10 X = 16'd10;    Y = 16'd5;
        #10 X = 16'h7FFF; Y = 16'd1;
        #10 X = 16'hFFFF; Y = 16'd1;
        #10 $finish;
    end

endmodule
