

module jackpot(
               out,
               reset,
               slowClock,
               trigger
 
);

output wire [3:0] out;
input wire [3:0] trigger;
input wire slowClock, reset;

parameter first = 4'b0001, second = 4'b0010, third = 4'b0100, fourth = 4'b1000, win = 4'b1111, off = 4'b0000;

reg [3:0] state, nextState, prevTrigger;

always @(posedge slowClock or posedge reset)
begin
    if(reset == 1)
        state <= first;
    else if(state == win)
        state <= win;
    else if(state == trigger)
        state <= win;
    else
        state <= nextState;
end

always @(state)
begin
if(trigger == 0)
begin
    case(state)
        first: 
        begin  
        nextState = second;
        prevTrigger = trigger;
        end
        
        second:
        begin
        nextState = third;
        prevTrigger = trigger;
        end
        
        third:
        begin
        nextState = fourth;
        prevTrigger = trigger;
        end
        
        fourth: 
        begin
        nextState = first;
        prevTrigger = trigger;
        end
        
        win:    nextState = win;
        default:nextState = first;

    endcase
end
    prevTrigger = trigger;
end

assign out = state;  

/*
Change to where it only corresponds to switch being input at the correct time with edge detection
at positive edge of the clock check if the switch is already turned on and if it is do not register the input as in.
*/
endmodule
