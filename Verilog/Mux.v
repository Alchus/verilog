/*
Mux.v

Thomas Sowders

A 2-to-1 32-bit multiplexer
*/



/* 

Mux
Thomas Sowders

Forwards one of two inputs to output, based on the value of select signal

Inputs:
32-bit inputs in0 and in1
1-bit input "select"

Outputs:
32-bit output "out"
*/


module Mux(in0, in1, sel, out);
	//Declare ports
	input [31:0] in0, in1;
	input sel;
	output reg [31:0] out;
	
	
	//Whenever an input changes,
	//Output the value of in0 if select is 0,
	//Otherwise output the value of in1
	always @ (in0 or in1 or sel)
	begin
	out = (sel) ? in1 : in0;
	end
endmodule
