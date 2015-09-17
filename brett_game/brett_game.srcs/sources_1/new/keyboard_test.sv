`timescale 1ns / 1ps

// Montek Singh
// April 2015

module keyboard_test(
	input clk,
	input ps2_data,
	input ps2_clk,
	output [7:0] segments,
   	output [7:0] digitselect
   );

	wire [31:0] character;
 
	keyboard keyb(clk, ps2_clk, ps2_data, character);
   
	display8digit disp(character, clk, segments, digitselect);

endmodule