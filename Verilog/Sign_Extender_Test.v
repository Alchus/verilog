/*
Sign_Extender_Test.v

Thomas Sowders

Testbench for Sign extender unit
*/



/* 

Sign_Extender_Test
Thomas Sowders

Testbench for Sign_Extender unit.
Converts a 16-bit signed integer to a 32-bit signed integer.

No inputs

Outputs only text to simulator console.
*/

module Sign_Extender_Test();
	//Connect testbench to a Sign_Extender unit
	reg [15:0] to_se;
	wire [31:0] from_se;
	Sign_Extender extender (to_se, from_se);

initial
	begin
	$display("Testing Sign Extending with some selected test cases.");
	
	/*
	Test the sign extender at various boundary cases, and display the results
	*/
	
	to_se = 16'hffff;
	#5 $display("Before Extending: %d | After Extending: %d", $signed(to_se), $signed (from_se));
	
	to_se = 16'h0000;
	#5 $display("Before Extending: %d | After Extending: %d", $signed(to_se), $signed (from_se));
	
	to_se = 16'h8000;
	#5 $display("Before Extending: %d | After Extending: %d", $signed(to_se), $signed (from_se));
	
	to_se = 16'h0001;
	#5 $display("Before Extending: %d | After Extending: %d", $signed(to_se), $signed (from_se));
	
	to_se = 16'h7777;
	#5 $display("Before Extending: %d | After Extending: %d", $signed(to_se), $signed (from_se));
	
	to_se = 16'h7fff;
	#5 $display("Before Extending: %d | After Extending: %d", $signed(to_se), $signed (from_se));
	
	end
endmodule		
		
