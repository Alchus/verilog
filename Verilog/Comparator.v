/*
Comparator.v

Thomas Sowders

Comparator: evaluates whether two signals are equal.
*/



/* 

Comparator
Thomas Sowders

Compares two signals, and outputs whether they are equal in all bit positions.

Inputs:
in0, in1 -- Each is a 32-bit unsigned integer value

Outputs:
equal -- High if the inputs are equal in all bit positions, low otherwise.
*/

module Comparator (in0, in1, equal);
	//Declare ports
	input [31:0] in0, in1;
	output equal;
	
	//Output high if the inputs are equal in all bit positions, low otherwise
	assign equal = (in0 == in1)? 1 : 0;
	
endmodule