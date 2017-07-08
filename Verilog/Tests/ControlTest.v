/*
ControlTest.v
By Thomas Sowders
Test bench for Control module
*/


/*
module ControlTest
by Thomas Sowders

Testbench for the Control module.

As this is a top-level module, there are no ports.

*/

module ControlTest();
	
	
	reg [31:0] instr;
	wire [1:0] ALUOp;
	wire [5:0] func;
	wire RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc,RegWrite, LUI, SysEnable;
	
	
	Control control (instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable );

	initial
		begin
			$display ("Testing Control Unit");
			instr = 32'h00000000;
			
			#5 $display ("Testing beq");
			instr = 32'h10000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing bne");
			instr = 32'h14000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing lw");
			instr = 32'h8c000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing sw");
			instr = 32'h94000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing lui");
			instr = 32'h3c000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing ori");
			instr = 32'h34000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing addi");
			instr = 32'h20000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing jal");
			instr = 32'h0c000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing j");
			instr = 32'h08000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing syscall");
			instr = 32'h0000000c;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing NOP");
			instr = 32'h00000000;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing or");
			instr = 32'h0000002a;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing add");
			instr = 32'h00000020;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing sub");
			instr = 32'h00000022;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing mul");
			instr = 32'h00000018;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing div");
			instr = 32'h0000001a;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing jr");
			instr = 32'h00000008;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing mfhi");
			instr = 32'h00000010;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			$display ("Testing mflo");
			instr = 32'h00000012;
			#100 $display ("instr = %h, ALUOp = %b, func = %b, RegDST = %b, BEQ = %b, BNE = %b, JMP = %b, MemRead = %b, MemtoReg = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b, LUI = %b, SysEnable = %b",instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable);
			
			
		end
	
endmodule