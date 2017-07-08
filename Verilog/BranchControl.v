module BranchControl (input [31:0] PCp4, input [31:0] immediate, input zero, input [31:0] ALUresult, input BEQ, input BNE, input JR, input JUMP, output [31:0] toPC);
	
	wire branch;
	assign branch = ((zero && BEQ) || (!zero && BNE));
	
	wire [31:0] branchTar;
	assign branchTar = PCp4 + {immediate[29:0], 2'b00};
	
	wire [31:0] branchMuxed;
	assign branchMuxed = (branch) ? branchTar : PCp4;
	
	wire [31:0] JRMuxed;
	assign JRMuxed = (JR) ? ALUresult : branchMuxed;
	
	assign toPC = (JUMP) ? {PCp4[31:28], immediate [25:0], 2'b00} : JRMuxed;
		
	
endmodule