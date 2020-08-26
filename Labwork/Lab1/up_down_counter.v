

module up_down_counter(
                  out,
                  reset,
                  enable,
                  clock,
                  up,
                  down
                  );
                  
    output wire [3:0] out;
    input wire reset, enable, clock, up, down;
    
    reg [3:0] outreg;
    
    always @(posedge clock & enable & (up | down))
    begin

    
    if(reset || out == 4'b1111 && !down)
        outreg <= 4'b0000;
    else if(up)
        outreg <= outreg + 1;
    else if(down)
        outreg <= outreg - 1;
    else
        outreg <= outreg;
    end
    
    assign out[3:0] = outreg[3:0];
    
    
endmodule
        
        