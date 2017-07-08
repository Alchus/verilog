/*
Mux_Test.v

Thomas Sowders

Testbench for Mux unit
*/



/* 

Mux_Test
Thomas Sowders
Testbench for Mux (two-to-one 32-bit multiplexer) unit

No inputs

Outputs only to simulator console.
*/
module MuxTest();
	//Create a mux unit and connect it to test wires.
	reg [31:0] out0, out1;
    reg	select;
	wire [31:0] muxout;
	reg [3:0] testvals;
	Mux mux (out0,out1,select,muxout);
	
	
	initial
	begin
	
	$display("Testing 2-to-1 Mux:");
	
	testvals = 0;
	out0 = 32'b0;
	out1 = 32'b0;
	
	/*
	Iteratively test each combination of values for input and select.
	The loop counter "testvals" tracks the iteration
	*/
	
	for (testvals = 0; testvals < 8; testvals = testvals +1) 
		begin
		{out0[0],out1[1],select} = testvals[2:0];
		#5 $display("in0 = %d, in1 = %d, select  = %b. Output = %d", out0, out1, select, muxout);
		end
	end
		

endmodule
