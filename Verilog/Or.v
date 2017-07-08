/*Or.v
Thomas Sowders
Or: Calculates a 32-bitwise OR.
*/

/*
module Or
Thomas Sowders

Calculates a 32-bit bitwise or.

inputs in0, in1: The 32-bit operands.
output: out - the result of the bitwise-or.

*/

module Or (input[31:0] in0, input[31:0] in1, output[31:0] out);
	assign out = (in0 | in1);
endmodule
