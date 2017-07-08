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




module RegisterTest();

	reg [4:0] ReadReg1;
	reg [4:0] ReadReg2;
	reg [4:0] writeReg;
	reg clock;
	reg [31:0] writeData;
	wire [31:0] out1;
	wire [31:0] out2;
	reg write;
	
	
	Registers registers(ReadReg1, ReadReg2, writeReg, clock, writeData, out1, out2 ,write);
	
	initial
		begin
			$display("--Testing Register Module--");
			
			clock = 1;
			write = 1;
			writeReg = 1;
			writeData = 32'haaaaaaaa;
			#2 clock = 0;
			
			#2 $display("Writing %h to register %d.", writeData, writeReg);
			
			
			
			clock = 1;
			writeReg = 11;
			writeData = 32'hbbbbbbbb;
			#2 clock = 0;
			
			#2 $display("Writing %h to register %d.", writeData, writeReg);
			
			clock = 1;
			writeReg = 31;
			writeData = 32'hcccccccc;
			#2clock = 0;
			
			#2 $display("Writing %h to register %d.", writeData, writeReg);
			
			clock = 1;
			writeReg = 0;
			writeData = 32'hdddddddd;
			#2 clock = 0;
			
			#2 $display("Writing %h to register %d. This should have no effect.", writeData, writeReg);
			
			#2 write = 0;
			
			
			ReadReg1 = 1;
			ReadReg2 = 11;
			#2 $display("Testing reads:");
			#2 $display("Content of register %d is: %h", ReadReg1 , out1);
			#2 $display("Content of register %d is: %h", ReadReg2 , out2);
			
			#2 ReadReg1 = 31;
			#2 ReadReg2 = 0;
			#2 $display("Content of register %d is: %h", ReadReg1 , out1);
			#2 $display("Content of register %d is: %h", ReadReg2 , out2);
			
		end

endmodule
