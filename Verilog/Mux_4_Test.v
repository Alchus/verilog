/*
Mux_4_Test.v

Thomas Sowders

Testbench for Mux_4 unit
*/



/* 

Mux_4_Test_Test
Thomas Sowders
Testbench for Mux_4 (Four-to-one 32-bit multiplexer) unit

No inputs

Outputs only to simulator console.
*/
module Mux_4_Test();
//instanciate a mux_4 and connect it to test logic
	reg [31:0] a, b, c, d;
	reg [1:0] select;
	wire [31:0] from_mux;
	Mux_4 mux (a, b, c, d, select, from_mux);

initial
	begin
	$display("Testing Mux4 with some selected test cases.");
	
	//Test that the multiplexer correctly intializes
	a = 32'haaaaaaaa;
	b = 32'hbbbbbbbb;
	c = 32'hcccccccc;
	d = 32'hdddddddd;
	select = 0;
	#5 $display("In A: %h | Input B: %h |In C: %h | Input D: %h | \nSelect : %d |Output : %h\n", a, b, c,d,select,from_mux);
	
	// test that the multiplexer responds to changes in the selected channel
	
	a = 32'habcdefff;
	#5 $display("In A: %h | Input B: %h |In C: %h | Input D: %h | \nSelect : %d |Output : %h\n", a, b, c,d,select,from_mux);
	
	// Test that the multiplexer can output each of the four input signals
	
	select = 1;
	#5 $display("In A: %h | Input B: %h |In C: %h | Input D: %h | \nSelect : %d |Output : %h\n", a, b, c,d,select,from_mux);
	select = 2;
	#5 $display("In A: %h | Input B: %h |In C: %h | Input D: %h | \nSelect : %d |Output : %h\n", a, b, c,d,select,from_mux);
	select = 3;
	#5 $display("In A: %h | Input B: %h |In C: %h | Input D: %h | \nSelect : %d |Output : %h", a, b, c,d,select,from_mux);
	
	
	end
endmodule		
		
