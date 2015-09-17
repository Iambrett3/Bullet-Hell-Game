`timescale 1ns / 1ps

// Montek Singh
// April 2015

module keyboard_test(
	input clock,
	input ps2_data,
	input ps2_clk,
	output [7:0] segments,
   	output [7:0] digitselect
   );

	wire [31:0] char;
 
	keyboard keyb(clk, ps2_clk, ps2_data, char);
   
	display8digit disp(char, clk, segments, digitselect);

endmodule