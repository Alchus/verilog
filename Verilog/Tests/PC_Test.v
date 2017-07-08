/*
PC_Test.v

Thomas Sowders

Testbench for Program Counter unit
*/



/* 

PC_Test
Thomas Sowders
Testbench for 32-bit program counter unit.

No inputs

Outputs only to simulator console.
*/

module PC_Test();
//Create a clock, and connect it to a program counter to test it.
wire clock_signal;
wire [31:0] pc_val;
Clock clk (clock_signal);
ProgramCounter pc (clock_signal, pc_val);

/*
The clock begins low, and changes value every 100 ticks.
On the clock's high ecge, the program counter increments by four.
The simulator prints each change in value of the PC's output.
*/

initial
	begin
		$display("Testing Program Counter. Monitoring output of PC for 10 clock cycles.");
		$monitor("At time: ",$time,"  |  ","PC = %b", pc_val);
		//After 2000 ticks (10 clock cycles), end simulation.
		#2000 $finish;
	end




endmodule