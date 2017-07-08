/*Sign_Extender.v

Thomas Sowders

Convers a 16-bit value to a sign-extended 32-bit value.
*/



/* 
Sign_Extender
Thomas Sowders


Converts a 16-bit value to a sign-extended 32-bit value.
The most-significant bit of input is replicated to pad the upper bits.

Inputs:
in - a 16-bit signed integer.

Outputs:
out - a 32-bit signed integer.
*/




module Sign_Extender(in, out);
//declare ports

input wire [15:0] in;
output wire [31:0] out;
//replicate the sign bit of input into the high 16 bits of output.
assign out = {{16{in[15]}}, in[15:0]};

endmodule