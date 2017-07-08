/*
Control.v
Thomas Sowders

Contains the Control unit, which deciphers opcodes and signals many other components
*/



/*
module Control
by Thomas Sowders

Deciphers the opcode and sets switches to control many other datapath elements.

Ports:

INPUTS:
instr - The 32-bit instruction to execute

OUTPUTS:
ALUOp [1:0] - Signals the ALU to preform special functions on a branch or memory access instruction
Func [5:0] - Which operation should the ALU execute on an R-type instruction?
RegDST - If the instruction is R-type, select rd from the instruction
BEQ, Is the instruction BEQ?
BNE, Is the instruction BNE?
JMP, Is the instruction JMP?
MemRead - Signals the memory unit to read.
MemtoReg - Pass Memory Read result to write-back
MemWrite - Signal the memory unit to write.
ALUSrc - Should the ALU operate on an immediate value?
RegWrite - Does the instruction write a result to a register?
LUI - Is the instruction LUI
SysEnable - Is the instruction a syscall?

*/


module Control (instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable, JAL, JR );

	input [31:0] instr;
	output reg [1:0] ALUOp;
	output reg [5:0] func;
	output wire RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc,RegWrite, LUI, SysEnable, JAL, JR;
	
	
	
	//Test if the instruction exactly matches the syscall operation.
	assign SysEnable = (instr == 32'h0000000C);
	
	//Assign the ALUOp and ALU Function outputs
	always @(instr or SysEnable)
		begin
			//All Register-Format instructions use this pattern (except syscall, it's weird)
			if ((SysEnable == 0'b0) && (instr[31:26] == 6'b000000))
				begin
					func = instr[5:0];
					ALUOp = 2'b10;
				end
			
			//BEQ and BNE
			if ((instr[31:26] == 6'b000100) || (instr[31:26] == 6'b000101) )
				begin
					ALUOp = 2'b01;
				end
			
			//LW and SW
			if ((instr[31:26] == 6'b100011) || (instr[31:26] == 6'b101011))
				begin
					
					
					ALUOp = 2'b00;
				end
			
			//Generate function codes for immediate instructions
			//ori:
			if (instr[31:26] == 6'b001101) 
				begin
					ALUOp = 2'b10;
					func =6'b101010; 
				end
			//addi
			if (instr[31:26] == 6'b001000) 
				begin
					ALUOp = 2'b10;
					func =6'b100000;
				end
		end
	
	//RegDST: This flag indicates if the instruction is in R-format.
	//If so, use rd for writeback.
	assign RegDST = (instr[31:26] == 6'b000000);
	
	//BEQ: This flag indicates if the instruction is BEQ.
	//It is used to determine the next instruction to execute.
	assign BEQ = (instr[31:26] == 6'b000100);

	//BNE: This flag indicates if the instruction is BNE.
	//It is used to determine the next instruction to execute.
	assign BNE = (instr[31:26] == 6'b000101);
	
	//JMP: This flag indicates if the instruction is JMP or JAL.
	//It is used to determine the next instruction to execute.
	assign JMP = (instr[31:27] == 6'b00001); //Ignoring the last bit of opcode.
	
	//JAL: This flag indicates if the instruction is JAL.
	//If so, store return address in $31.
	assign JAL = (instr[31:26] == 6'b000011);
	
	//JR: Signal to branch control unit.
	assign JR = ((instr[31:26] == 6'b000000) && (instr[5:0] == 6'b001000));
	

	//MemRead: This flag indicates if the instruction is lw.
	//It tells the memory module to read.
	//Also on a lw instruction, the register write-back data comes from memory (rather than the ALU).
	assign MemRead = (instr[31:26] == 6'b100011);
	assign MemtoReg = (instr[31:26] == 6'b100011);
	
	//MemWrite: This flag indicates if the instruction is sw.
	//It tells the memory module to write.
	assign MemWrite = (instr[31:26] == 6'b101011);

	//LUI: This flag indicates if the instruction is lui.
	//If so, the lui datapath is enabled.
	assign LUI = (instr[31:26] == 6'b001111);
	
	//ALUSrc: This flag indicates if the ALU should use the immediate input.
	//It is set on the following instructions: addi, ori, sw, lw
	assign ALUSrc = ((instr[31:26] == 6'b100011) || //lw
					 (instr[31:26] == 6'b101011) || //sw
					 (instr[31:26] == 6'b001101) || //ori
					 (instr[31:26] == 6'b001000)    //addi
					);
	
	//RegWrite: Thould the registers save a value at the end of the tick?
	//It is set on the following instructions:
	// lw, lui, ori, addi, jal, and R-format instructions that aren't syscall or jr
	assign RegWrite = ((instr[31:26] == 6'b100011) || //lw
					   (instr[31:26] == 6'b001111) || //lui
					   (instr[31:26] == 6'b001101) || //ori
					   (instr[31:26] == 6'b001000) || //addi
					   (instr[31:26] == 6'b000011) || //jal
					   ((instr[31:26] == 6'b000000) && !SysEnable && !JR) //R-type, not syscall or JR
					  );
	
endmodule