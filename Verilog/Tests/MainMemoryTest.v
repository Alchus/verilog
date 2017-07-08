/*
MainMemoryTest.v
Thomas Sowders

Tests the memory file
*/


/*
module RegistersTest
Thomas Sowders

Tests the memory file

INPUTS:
None

OUTPUTS:
Outputs the test results to the console
*/



module InstructionMemoryTest();

	reg [31:0] addr;
	wire [31:0] data;
	reg clock;
	reg write;
	reg [31:0] writeData;
	
	
	MainMemory mem(addr, write, clock, writeData, data);
	
	initial
		begin
			clock = 1;
			addr = 18;
			#2 $display("At address %d, value is: %h",addr,data);
			#2 addr = 20;
			#2 $display("At address %d, value is: %h",addr,data);
			write = 1;
			writeData = 32'habcd1234;
			clock = 0; // Write is confirmed on low clock edge.
			#2 $display("Writing 'abcd1234' to address 20.");
			clock = 1;
			addr = 23;
			#2 $display("At address %d, value is: %h",addr,data);
			addr = 20;
			#2 $display("Reading written data:");
			#2 $display("At address %d, value is: %h",addr,data);
			
			
		end

endmodule
