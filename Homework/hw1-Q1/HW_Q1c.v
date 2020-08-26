

module HW_Q1c(a,b,c,d,E,F);

    input wire a,b,c,d; //inputs a,b,c,d
    output wire E,F; // outputs E,F

    wire X, Y, Z; // internal nets XYZ

    X = ~a;
    Y = a && b;
    Z = Y || C;

    assign E = X || Z;
    assign F = ~(Z && d);

endmodule