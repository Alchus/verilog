/*
ALUControlTest.v
By Thomas Sowders
Test bench for ALUControl module
*/


/*
module ALUControlTest
by Thomas Sowders

Testbench for the ALUControl module.
Uses the output of a Control module to parse instructions.

As this is a top-level module, there are no ports.

*/



module ALUControlTest();
	
	//Attach a Control unit
	reg [31:0] instr;
	wire [1:0] ALUOp;
	wire [5:0] func;
	wire RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc,RegWrite, LUI, SysEnable;
	Control control (instr, ALUOp, func, RegDST, BEQ, BNE, JMP, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI, SysEnable );
	
	//Attach an ALUControl unit
	wire [2:0] ALUCtl;
	ALUControl alu(func , ALUOp, ALUCtl);
	initial
		begin
			$display ("Testing ALU Control Unit");
			
			$display ("Testing beq");
			instr = 32'h10000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			
			$display ("Testing bne");
			instr = 32'h14000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing lw");
			instr = 32'h8c000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing sw");
			instr = 32'h94000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing lui");
			instr = 32'h3c000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing ori");
			instr = 32'h34000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing addi");
			instr = 32'h20000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing jal");
			instr = 32'h0c000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing j");
			instr = 32'h08000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing syscall");
			instr = 32'h0000000c;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing NOP");
			instr = 32'h00000000;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing or");
			instr = 32'h0000002a;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing add");
			instr = 32'h00000020;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing sub");
			instr = 32'h00000022;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing mul");
			instr = 32'h00000018;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing div");
			instr = 32'h0000001a;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing jr");
			instr = 32'h00000008;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing mfhi");
			instr = 32'h00000010;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			$display ("Testing mflo");
			instr = 32'h00000012;
			#10 $display ("instr= %h, ALUOp= %b, func= %b, ALUCtl= %b", instr, ALUOp, func, ALUCtl);
			
			
		end
	
endmodule