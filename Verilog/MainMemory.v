/*
MainMemory.v
Thomas Sowders

Contains a 256-word memory bank.
*/


/*
module MainMemory.v
Thomas Sowders

Stores and retreives data from 256-word memory file.

INPUTS:
addr: which address to read from or write to.
clock: low edge triggers memory write (if write is enabled)
write : enables writing behavior
writeData: 32-bit value to store.

OUTPUTS:
out: value read from the memory bank.

*/


module MainMemory (input [31:0] addr, input write, input clock, input [31:0] writeData, output reg [31:0] out);
	//backing memory array
	reg [31:0] memory[0:512];
	
	initial
		begin
			//Initialize memory from text file
			$readmemh("MIPSdata.txt", memory);
		end
	
	always@ (addr or clock)
		begin
			//output the requested value from memory
			out = memory[addr[9:2]];
		end
	
	always @(negedge clock)//negative edge triggers write, if enabled
		begin
			if (write)
				//Write the input data to memory array
				begin
				memory[addr[9:2]] <= writeData;
				out <= writeData;
				end
		end
	
endmodule