/*
ALUControl.v
Thomas Sowders

ALUControl: Tells the ALU which function to execute.
*/



/*
Module ALUControl
By Thomas Sowders

Interprets the ALUOp signal from Control, and the Function field of the instruction.
Tells the ALU which function to execute.

Ports:
input [5:0] Funct; //The function field from an R-type instruction
input [1:0] ALUOp; //Signal from Control on branch and memory instructions.
output reg [2:0] ALUCtl; //Output to the ALU: which function to execute.
*/



module ALUControl (Funct, ALUOp, ALUCtl);
	input [5:0] Funct;
	input [1:0] ALUOp;
	output reg [2:0] ALUCtl;
	
//Operations understood by the ALU:
	localparam FORWARD=3'b000;
	localparam OR     =3'b001;
	localparam ADD    =3'b010;
	localparam MFHI   =3'b011;
	localparam MFLO   =3'b100;
	localparam MUL    =3'b101;
	localparam SUB    =3'b110;
	localparam DIV    =3'b111;
	
	
	
	always @ (*)
		begin
			//If executing a branch instruction, subtract (to find if zero).
			if (ALUOp == 2'b01) ALUCtl = SUB;
			
			//If executing a memory access, add (to calculate address).
			if (ALUOp == 2'b00) ALUCtl = ADD;
			
			//Otherwise, use the funct field to determine ALU operation.
			if (ALUOp == 2'b10)
				begin
					casex (Funct)
						//or, ori
						6'b101010: ALUCtl = OR;
						//add, addi
						6'b100000: ALUCtl = ADD;
						//nop
						6'b000000: ALUCtl = FORWARD;
						//sub
						6'b100010: ALUCtl = SUB;
						//mul
						6'b011000: ALUCtl = MUL;
						//div
						6'b011010: ALUCtl = DIV;
						//mfhi
						6'b010000: ALUCtl = MFHI;
						//mflo
						6'b010010: ALUCtl = MFLO;
						//jr
						6'b001000: ALUCtl = FORWARD;
					endcase
				end
		end
	
endmodule