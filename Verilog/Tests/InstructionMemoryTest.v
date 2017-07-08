/*
RegistersTest.v
Thomas Sowders

Tests the register file
*/


/*
module RegistersTest
Thomas Sowders

Tests the register file

INPUTS:
None

OUTPUTS:
Outputs the test results to the console
*/

module InstructionMemoryTest();

	reg [31:0] addr;
	wire [31:0] data;
	
	InstructionMemory mem(addr, data);
	
	initial
		begin
			addr = 0;
			#2 $display("At address %d, value is: %h",addr,data);
			#2 addr = 1;
			#2 $display("At address %d, value is: %h",addr,data);
			#2 addr = 2;
			#2 $display("At address %d, value is: %h",addr,data);
			#2 addr = 3;
			#2 $display("At address %d, value is: %h",addr,data);
			#2 addr = 7;
			#2 $display("At address %d, value is: %h",addr,data);
			#2 addr = 15;
			#2 $display("At address %d, value is: %h",addr,data);
			#2 addr = 31;
			#2 $display("At address %d, value is: %h",addr,data);
			
			
			
		end

endmodule
