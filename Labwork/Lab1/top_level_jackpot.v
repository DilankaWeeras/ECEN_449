


module top_level_jackpot(LEDs, Switch, Button, Clock);

    output wire [3:0] LEDs; // counter is on the led
    input wire [3:0] Switch; // enables the counting up
    input wire Button; // 
    input wire Clock;
    
    wire SlowClock;
    
    jackpot win1(LEDs, Button, SlowClock, Switch);
    clock_divider slow(SlowClock, Clock);
    
endmodule