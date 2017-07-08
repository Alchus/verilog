/*
Clock_Test.v

Thomas Sowders

Testbench for the clock module
*/



/* 

Clock_Test
Thomas Sowders

Testbench for Clock Module

No input ports

Outputs only text to simulator console
*/

module Clock_Test;
	//Declare a clock and connect it to testbench
	wire clock;
	Clock c0( clock );
	
	//Monitor the clock value for 1000 ticks, printong to the console whenever the value changes.
	initial
		begin
			$monitor( $time,,"clock = %b", clock );
			#1000 $finish;
		end

endmodule
