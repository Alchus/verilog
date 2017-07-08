/*
Comparator_Test.v

Thomas Sowders

Testbench for Comparator unit
*/



/* 
Comparator_Test
Thomas Sowders

Testbench for Comparator unit.
Evaluates if two inputs are equal.

No inputs

Outputs only text to simulator console.
*/

module Comparator_Test();
	//Create a Comparator and connect it to test bench
	reg [31:0] a, b;
	wire from_comp;
	Comparator comparator (a,b, from_comp);

initial
	begin
	$display("Testing Comparator with some selected test cases.");
	/*
	 Send various inputs to the comparator, then display its status. 
	*/
	
	a = 32'h00000000;
	b = 32'h00000000;
	#5 $display("Input A: %h | Input B: %h | Output : %b", a, b, from_comp);
	
	a = 32'h00008000;
	b = 32'h00000000;
	#5 $display("Input A: %h | Input B: %h | Output : %b", a, b, from_comp);
	
	a = 32'haaaaaaaa;
	b = 32'haaaaaaaa;
	#5 $display("Input A: %h | Input B: %h | Output : %b", a, b, from_comp);
	
	a = 32'hf0000000;
	b = 32'he0000000;
	#5 $display("Input A: %h | Input B: %h | Output : %b", a, b, from_comp);
	
	a = 32'h11111111;
	b = 32'h11111111;
	#5 $display("Input A: %h | Input B: %h | Output : %b", a, b, from_comp);
	
	a = 32'h11111111;
	b = 32'h11111110;
	#5 $display("Input A: %h | Input B: %h | Output : %b", a, b, from_comp);
	
	end
endmodule		
		
