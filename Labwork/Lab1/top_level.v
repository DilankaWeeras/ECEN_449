

module top_level(LEDs, Sw, BTNs, Clock);

    output wire [3:0] LEDs; // counter is on the led
    input wire Sw; // enables the counting up
    input wire [2:0] BTNs; // 
    input wire Clock;
    
    wire SlowClock;
    
    up_down_counter count1(LEDs[3:0], BTNs[2], Sw, SlowClock, BTNs[1], BTNs[0]);
    clock_divider slow(SlowClock, Clock);
    
    
endmodule