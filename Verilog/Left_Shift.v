/*
Left_Shift.v

Thomas Sowders

Shifts a 32-bit value left two places.
*/



/* 

Left_Shift
Thomas Sowders

Shifts a 32-bit value left two places, padding with zeroes.

Input:
in -- a 32-bit integer

Outputs:
out -- A 32-bit integer that is equivalent to the input, but shifted left 2 places. */

module Left_Shift(in, out);
//Declare ports
input wire [31:0] in;
output wire [31:0] out;
//Output the shifted value.
assign out = {in[29:0], 2'b0};


endmodule