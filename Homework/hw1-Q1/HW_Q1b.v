

module HW_Q1b(a,b,c,d,E,F);

    input wire a,b,c,d; //inputs a,b,c,d
    output wire E,F; // outputs E,F

    wire X,Y,Z; // internal nets XYZ

    NOT NOT2(X, a); // inverse a goes into X
    AND AND2(Y, a, b); // Y is a and b
    OR OR2(Z, Y, c); // Z is Y or c
    OR OR1(E, X, Z); // outputE is X or Z
    NAND NAND2(F, Z, D); // output F is Z or D

endmodule