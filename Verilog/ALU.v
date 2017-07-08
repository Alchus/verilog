/*
Thomas Sowders
ALU.v

Contains the combinational logic of arithmetic and logic operations,
as well as a Hi-Lo register for multiplication/division results

module ALU:
Thomas Sowders

INPUTS:
in1: input data from the first register
in2: input data from the second register or sign-extended immediate.
ALUControl: Which operation to execute on the inputs
Clock: ALU stores HiLo values on low edge

OUTPUTS:
result: Result of the ALU calculation
zero: high if the ALU result is zero.

*/


module ALU (input signed [31:0] in1,
			input signed [31:0] in2,
			input [2:0] ALUControl,
			input clock,
			output reg signed [31:0] result,
			output zero);
	
	
	reg signed [63:0] HiLo;
	assign zero = (result == 0);
	//Initialize internal register
	
	initial
		begin
			HiLo = 0;
		end
	//Calculate combinational operations: Forward, Or, add, sub, and MFHI/LO
	always @(in1 or in2 or ALUControl)
		begin
			casex (ALUControl)
				0:  //No ALU operation, forward input 1
					result = in1;
				1:  //Bitwise OR
					result = in1 | in2;
				2:  //Add
					result = in1 + in2;
				3:  //MFHI
					result = HiLo[63:32];
				4:  //MFLO
					result = HiLo[31:0];
				6:  //Subtract
					result = in1 - in2;
			endcase
			
		end
	//Multiply and divide results are only stored at clock falling edge.
	always @(negedge clock)
		begin
			if(ALUControl == 5) //Multiply
				HiLo = in1 * in2;
			if(ALUControl == 7) 
				begin//Divide
					HiLo[31:0] = in1 / in2;
					HiLo[63:32] = in1 % in2;
				end
				
		end
endmodule