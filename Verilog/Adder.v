/*
Adder.v

Thomas Sowders

Adder: Adds two signed numbers
*/



/* 

Adder
Thomas Sowders

Adds two 32-bit signed integer values

Inputs:
in0, in1 -- Each is a 32-bit signed integer value.

Outputs:
sum -- A 32-bit signed integer; the sum of in0 and in1.
*/

module Adder (in0, in1, sum);
	//Declare ports
	 input [31:0] in0, in1;
	 output [31:0] sum;
	
	//Output the sum of the two inputs
	
	assign sum = in0 + in1;
	
endmodule