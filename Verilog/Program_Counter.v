/*Program_Counter.v

Thomas Sowders

Increments a 32-bit value by four on each clock rising edge.
*/



/* 

ProgramCounter
Thomas Sowders

Increments an internally-stored 32-bit value by 4 on each clock rising edge, starting at 0.

Inputs:
clockin - 1-bit clock signal
d - branch target address

Outputs:
value - the 32-bit value of the program counter
*/

module ProgramCounter(input clockin, input wire [31:0] d, output reg [31:0] q);
	
	reg valid;
	
	initial
	begin
		//The counter begins with value 0.
		valid = 0;
		q = 32'b0;
	end
	
	always @ (posedge clockin)
	begin
		if (valid)
			q = d;
		if (!valid)
			begin
			q = 32'b0;
			valid = 1;
			end
		
	end
endmodule
