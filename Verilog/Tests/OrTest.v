/*
OrTest.v
By Thomas Sowders
Test bench for OR module
*/


/*
module OrTest
by Thomas Sowders

Testbench for the Or module
calculates the bitwise-or of two 32-bit values.

As this is a top-level module, there are no ports.

*/


module OrTest();
	reg [31:0] a , b;
	wire [31:0] y;
	//instanciate the Or module
	Or myOr(a,b,y);
	
	initial
		begin
			$display ("Testing or module.");
			a = 32'b00001111000011110000000000000000;
			b = 32'b00111100001000100010101010000001;
			#5 $display("a= %b\nb= %b\ny= %b", a, b, y);
		end
endmodule