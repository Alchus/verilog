/*
InstructionMemory.v
Thomas Sowders

Contains a read-only instruction memory file.
*/


/*
module InstructionMemory
Thomas Sowders

Retreives data from 256-word instruction memory file.

INPUTS:
addr : which address to read from
mIPSinst.txt : text file containing initial memory contents.

OUTPUTS:
instr : output the requested instruction
*/


module InstructionMemory (input [31:0] addr, output reg [31:0] instr);
	//Backing storage array
	reg [31:0] memory[0:255];
	
	initial
		begin
			//Initialize memory contents from text file
			$readmemh("MIPSinst.txt", memory);
		end
	
	always@ (addr)
		begin
			//Output the requested memory word
			instr = memory[addr[9:2]];
		end
	
endmodule