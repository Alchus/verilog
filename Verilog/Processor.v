
module Processor();

//CLOCK
wire clock;
Clock myClock(clock);

//PROGRAM COUNTER
wire [31:0] to_pc;
wire [31:0] from_pc;
ProgramCounter myPC (clock, to_pc, from_pc);

wire [31:0] pcPlus4;

Adder pcAdder({32'h00000004}, from_pc, pcPlus4);


//INSTRUCTION MEMORY

wire [31:0] instruction;
InstructionMemory myInstructionMemory (from_pc, instruction);

//CONTROL
wire [1:0] ALUOP;// - Signals the ALU to preform special functions on a branch or memory access instruction
wire [5:0] FUNC;// Which operation should the ALU execute on an R-type instruction?
wire REGDST;//If the instruction is R-type, select rd from the instruction
wire BEQ;//, Is the instruction BEQ?
wire BNE;//Is the instruction BNE?
wire JMP;//, Is the instruction JMP?
wire MEMREAD;// - Signals the memory unit to read.
wire MEMTOREG;// - Pass Memory Read result to write-back
wire MEMWRITE;// - Signal the memory unit to write.
wire ALUSRC;// - Should the ALU operate on an immediate value?
wire CTL_REGWRITE;// - Does the instruction write a result to a register?
wire LUI;// - Is the instruction LUI
wire SYSENABLE;// - Is the instruction a syscall?
wire JAL;
wire JR;

Control myControl (instruction, ALUOP, FUNC, REGDST, BEQ, BNE, JMP, MEMREAD, MEMTOREG, MEMWRITE, ALUSRC, CTL_REGWRITE, LUI, SYSENABLE, JAL, JR);


//SYCALLS

Syscalls mySyscalls(SYSENABLE);

wire SYS_REGWRITE; //asserted on syscall 5. 
wire [31:0] SYSDATA; //integer to store in v0

wire SYSMEM; //enable syscall memory access for syscall 4.
wire [31:0] SYSADDR;//Syscall memory address


//TODO: Syscall Module, modify registers to output a0.

assign SYS_REGWRITE = 0;
assign SYSMEM = 0;
assign SYSDATA = 32'hz;
assign SYSADDR = 32'hz;

wire REGWRITE= CTL_REGWRITE || SYS_REGWRITE;
//REGISTERS

wire [4:0] writeReg_case0;
wire [31:0] toWriteReg;
wire [31:0] toWriteData;
wire [31:0] from_LUIMux;
wire [31:0] memToRegData;

Mux5 regDstMux (instruction[20:16], instruction[15:11], REGDST, writeReg_case0);

Mux_4 writeRegMux ({27'h0,writeReg_case0}, {32'h0000001f}, {32'h00000002}, 32'hzzzzzzzz, {SYS_REGWRITE, JAL}, toWriteReg);

Mux_4 writeDataMux (from_LUIMux, pcPlus4, SYSDATA, 32'hzzzzzzzz, {SYS_REGWRITE, JAL}, toWriteData);

Mux LUIMux (memToRegData, {instruction[15:0], 16'b0}, LUI, from_LUIMux);

wire [31:0] data1;
wire [31:0] data2;

Registers myRegisters (instruction[25:21], instruction[20:16], toWriteReg[4:0], clock, toWriteData, data1, data2, REGWRITE);
//SIGN EXTENDER
wire [31:0] signExtImm;
Sign_Extender mySignExtender (instruction[15:0], signExtImm);

//ALU CONTROL
wire [2:0] ALUCtl;
ALUControl myALUControl(FUNC, ALUOP, ALUCtl);

//ALU
wire [31:0] ALU_in2;
Mux ALUSrcMux (data2, signExtImm, ALUSRC, ALU_in2);

wire [31:0] ALUResult;
wire ZERO;
ALU myALU(data1, ALU_in2, ALUCtl, clock, ALUResult, ZERO);

//DATA MEMORY
wire [31:0] memAddress;
Mux addressMux(ALUResult, SYSADDR, SYSMEM, memAddress);

wire [31:0] memData;
MainMemory myMemory(memAddress, MEMWRITE, clock, data2, memData);

Mux memToRegMux (ALUResult, memData, MEMTOREG, memToRegData);

//BRANCH CONTROL
BranchControl myBranchControl (pcPlus4, signExtImm, ZERO, ALUResult, BEQ, BNE, JR, JMP, to_pc);


endmodule