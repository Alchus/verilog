module Syscalls(input sysEnable);

reg [31:0] data [0:1];

reg [7:0] char;
reg [10:0] index;

always @(posedge sysEnable)
	begin
	case (Processor.myRegisters.registers[2])
	1:
		begin
			$display("%d",Processor.myRegisters.registers[4]);
		end
	4:
		begin
			
			index = Processor.myRegisters.registers[4][10:0];
			//Account for endian-ness
			if (index[1:0] == 2'b00)
				char = Processor.myMemory.memory[index[10:2]][7:0];
			if (index[1:0] == 2'b01)
				char = Processor.myMemory.memory[index[10:2]][15:8];
			if (index[1:0] == 2'b10)
				char = Processor.myMemory.memory[index[10:2]][23:16];
			if (index[1:0] == 2'b11)
				char = Processor.myMemory.memory[index[10:2]][31:24];

			while (char != 0)
			begin
				$write("%c", char);
				index = index + 1;
				if (index[1:0] == 2'b00)
				char = Processor.myMemory.memory[index[10:2]][7:0];
				if (index[1:0] == 2'b01)
				char = Processor.myMemory.memory[index[10:2]][15:8];
				if (index[1:0] == 2'b10)
				char = Processor.myMemory.memory[index[10:2]][23:16];
				if (index[1:0] == 2'b11)
				char = Processor.myMemory.memory[index[10:2]][31:24];
			

			end
			


		end
	
	5: 
		begin
			$readmemh("input.txt", data);
			Processor.myRegisters.registers[2] = data[0];
			$display("Read input value %d", data[0]);
		end
	10:
		begin
			$finish;
		end
	
	endcase
	end




endmodule
