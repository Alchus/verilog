/*
Registers.v
Thomas Sowders

Contains a 32-word register file.
*/


/*
module Registers
Thomas Sowders

Stores and retreives data from 32-word register file.

INPUTS:
ReadReg1 and ReadReg2:  Which registers to read from.
writeReg: which register to write to.
clock: low edge triggers memory write (if write is enabled)
write : enables writing behavior
writeData: 32-bit value to store.

OUTPUTS:
out1 and out2: values read from the register memory.

*/

module Registers (input [4:0] ReadReg1,
				  input [4:0] ReadReg2,
				  input [4:0] writeReg,
				  input clock,
				  input [31:0] writeData, 
				  output reg [31:0] out1, 
				  output reg [31:0] out2,
				  input write);
	//Backing memory array
	reg [31:0] registers[0:31];
	
	initial
		begin
			//register 0 is always 0.
			registers[0] = 0;
		end
	
	always@ (ReadReg1 or clock)
		begin
			//output the value requested in first read register
			out1 = registers[ReadReg1];
		end
	
	always@ (ReadReg2 or clock)
		begin
			//Output value requested in second read register
			out2 = registers[ReadReg2];
		end
	
	
	always @(negedge clock)//Negative clock edge triggers writing, if enabled
		begin
			if (write && writeReg)//Write only if write flag enabled and target is not register 0.
				begin
					//Store input data to 
					registers[writeReg] <= writeData;
				end
		end
	
endmodule