/*
Mux_4.v

Thomas Sowders

A 4-to-1 32-bit multiplexer
*/



/* 

Mux_4
Thomas Sowders

Forwards one of four inputs to output, based on the value of select signal

Inputs:
32-bit inputs in0, in1, in2, and in3.
2-bit input "select"

Outputs:
32-bit output "out"
*/

module Mux_4(in0, in1, in2, in3, select, out);
//Declare ports
input [31:0] in0, in1, in2, in3;
input[1:0] select;
output reg [31:0] out;


	//Whenever an input or select changes,
	//Choose the value of the appropriate input
	//and output it.
always @ (in0 or in1 or in2 or in3 or select)
begin
   if( select == 0)
      out = in0;

   if( select == 1)
      out = in1;

   if( select == 2)
      out = in2;

   if( select == 3)
      out = in3;
end

endmodule