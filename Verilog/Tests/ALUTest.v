/*
Thomas Sowders
ALUTest.v

Tests the functions of the ALU unit.

Module ALUTest:

No inputs
Outputs to simulator console

*/


module ALUTest();
	
	reg signed [31:0] in1;
	reg signed [31:0] in2;
	reg [2:0] ALUControl;
	reg clock;
	wire signed [31:0] result;
	wire zero;
	
	ALU alu (in1, in2, ALUControl, clock, result, zero);
	
	initial
		begin
			$display("Testing ALU");
			in1 = 5;
			in2 = 17;
			
			
			
			ALUControl = 0; //Nop
			#5 $display("in1 = %d, in2 = %d, ALUop = %b, result = %d, zero = %b", in1, in2, ALUControl, result, zero);
			ALUControl = 1; //OR
			#5 $display("in1 = %d, in2 = %d, ALUop = %b, result = %d, zero = %b", in1, in2, ALUControl, result, zero);
			ALUControl = 2; //Add
			#5 $display("in1 = %d, in2 = %d, ALUop = %b, result = %d, zero = %b", in1, in2, ALUControl, result, zero);
			ALUControl = 6; //Sub
			#5 $display("in1 = %d, in2 = %d, ALUop = %b, result = %d, zero = %b", in1, in2, ALUControl, result, zero);
			
			$display("Multiplying 0x3AAA1111 by 0x00002000");
			
			//Test multiplication
			
			//execute multiply
			#2 clock = 1;
			#2 in1 = 32'h3AAA1111;
			in2 = 32'h00002000;
			ALUControl = 5;
			#2 clock = 0;
			
			//mfhi and print result
			#2 ALUControl = 3;
			#2 $display("MFHI = %h", result);
			//mflo and print
			#2 ALUControl = 4;
			#2 $display("MFLO = %h", result);
			
			//Test division
			
			//execute division
			$display("Dividing -101 by 3");
			#2 clock = 1;
			#2 in1 = -101;
			in2 = 3;
			ALUControl = 7;
			#2 clock = 0;
			
			//mfhi and print
			#2 ALUControl = 3;
			#2 $display("MFHI = 0x%h", result);
			//mflo and print
			#2 ALUControl = 4;
			#2 $display("MFLO = %d", result);
			
			
			
		end
	
	
	
endmodule