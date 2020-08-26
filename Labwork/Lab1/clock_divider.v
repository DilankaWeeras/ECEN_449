`timescale 1ns / 1ps
`default_nettype none


module clock_divider(ClkOut, ClkIn);

    output wire ClkOut; // declare ouptut variables
    input wire ClkIn; // declare input variables
    
    //parameter n = 25; // declare timing
    
    reg [27:0] count;
    reg out;
    
    always@(posedge ClkIn)
    begin// change in pos clock
        count <= count + 1000;
        if(count == 0) begin
          out <= 0;
        end
        /*if(count == 31250000) begin
          out <= 1;
        end*/
        if(count == 62500000) begin
          out <= 1;
        end
        /*if(count == 93750000) begin
          out <= 1;
        end*/       
    end
    
    assign ClkOut = out;
    
    
    
    // 28 bit register that counts from 0 to 125M
    // at 62.5M it will enter a up state
    // at 125M it will go back to zero
    // at 0 it will enter down state
    
endmodule