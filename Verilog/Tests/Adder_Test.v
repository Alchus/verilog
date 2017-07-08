/*
Adder_Test.v

Thomas Sowders

Testbench for Adder unit
*/



/* 
Adder_Test
Thomas Sowders

Testbench for Adder unit.
Computes the sum of two numbers

No inputs

Outputs only text to simulator console.
*/

module Comparator_Test();
	//Create a Comparator and connect it to test bench
	 reg [31:0] a, b;
	 wire [31:0] sum;
	Adder adder (a,b, sum);

initial
	begin
	$display("Testing Comparator with some selected test cases.");
	
	/*
	Test the adder at various boundary cases, and display the results
	*/
	
	a = 1;
	b = 2;
	#5 $display("A: %d | B: %d | Sum: %d", $signed(a), $signed(b), $signed(sum));

	a = 0;
	b = -1;
	#5 $display("A: %d | B: %d | Sum: %d", $signed(a), $signed(b), $signed(sum));

	a = -100000;
	b =  100000;
	#5 $display("A: %d | B: %d | Sum: %d", $signed(a), $signed(b), $signed(sum));

	a = 2147483647;
	b =  2;
	#5 $display("A: %d | B: %d | Sum: %d", $signed(a), $signed(b), $signed(sum));

	a =  2147483647;
	b = -2147483647;
	#5 $display("A: %d | B: %d | Sum: %d", $signed(a), $signed(b), $signed(sum));

	
	end
endmodule		
		
