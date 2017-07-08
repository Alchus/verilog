
/*
Clock.v

Thomas Sowders

Clock: A simple clock that alternates in value periodically
*/



/* 

Clock
Thomas Sowders

A Clock that alternates in value periodically.
Output is initially 0.

No inputs

Outputs:
clock - a 1-bit signal that alternates values.
*/

module Clock(clock);
//Declare ports
output reg clock;
initial
//The clock begins high
clock = 0;

always
begin
//Every 50 ticks, flip the value of the clock signal 
#50	clock = ~clock; //Low Duration
#50	clock = ~clock; //High Duration
end
endmodule