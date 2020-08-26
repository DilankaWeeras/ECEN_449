

module HW_Q1d(a,b,c,d,E,F);

    input wire a,b,c,d; //inputs a,b,c,d
    output wire E,F; // outputs E,F)

    reg Esub, Fsub;

    always @(posedge a,b,c,d)
    begin

        wire X, Y, Z; // internal nets XYZ

        X <= ~a; // wire x is NOT a
        Y <= a && b; // wire Y is a and b
        Z <= Y || c; // wire Z is Y or c

        Esub <= X || Z; // reg E to be X or Z
        Fsub <= ~(Z && d); // reg F to be nand Z and d

    end

    assign E = Esub; // assign Esub to E
    assign F = Fsub; // assign Fsub to F

endmodule