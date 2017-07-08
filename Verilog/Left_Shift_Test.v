/*
Left_Shift_Test.v

Thomas Sowders

Testbench for Shift-Left-2 unit
*/



/* 

Left_Shift_Test
Thomas Sowders

Testbench for the shift-left-2 unit

No inputs

Outputs only to simulator console.
*/

module Left_Shift_Test();

	// Connect the testbench to a Left Shift 2 unit.
	reg [31:0] to_ls;
	wire [31:0] from_ls;
	Left_Shift shifter (to_ls, from_ls);

initial
	begin
	$display("Testing Shift-Left-2 with some selected test cases.");
	
	//Test various edge cases of the shift unit
	to_ls = 32'hffffffff;
	#5 $display("Before Shift: %h | After Shift: %h", to_ls, from_ls);
	
	to_ls = 32'h00000000;
	#5 $display("Before Shift: %h | After Shift: %h", to_ls, from_ls);
	
	to_ls = 32'hf0f0f0f0;
	#5 $display("Before Shift: %h | After Shift: %h", to_ls, from_ls);
	
	to_ls = 32'haaaaaaaa;
	#5 $display("Before Shift: %h | After Shift: %h", to_ls, from_ls);
	
	to_ls = 32'h00000001;
	#5 $display("Before Shift: %h | After Shift: %h", to_ls, from_ls);
	
	to_ls = 32'h20000000;
	#5 $display("Before Shift: %h | After Shift: %h", to_ls, from_ls);
	
	end
endmodule		
		
