`timescale 1ns / 1ps
`include "NoMoreMagicNumbers.sv"
//////////////////////////////////////////////////////////////////////////////////
//
// Montek Singh
// 4/6/2015 
//
//////////////////////////////////////////////////////////////////////////////////

module top #(
    parameter imem_init="gamesimpimem.txt",
    parameter dmem_init="brett_game_data_mem.txt",
    parameter smem_init="brett_game_screen_mem.txt",		// text file to initialize screen memory
    parameter bitmap_init="brett_game_bitmap_mem.txt"			// text file to initialize bitmap memory
)(
    input clk, reset, ps2_clk, ps2_data,
    output [7:0] segments,
    output [7:0] digitselect,
    output [`bmem_Dbits-1:0] RGB,
    output hsync, vsync
);
   
   wire [31:0] pc, instr, mem_readdata, mem_writedata, mem_addr;
   wire [`kmem_Dbits-1:0] keyb_writedata;
   wire [`smem_Abits-1:0] smem_addr;
   wire [`smem_Dbits-1:0] charcode;
   wire [3:0] red, green, blue;
   wire mem_wr;
   
   assign RGB = {red, green, blue};
   

   // Uncomment *only* one of the following two lines:
   //    when synthesizing, use the first line
   //    when simulating, get rid of the clock divider, and use the second line
   //
   clockdivider_Nexys4 clkdv(clk, clk100, clk50, clk25, clk12);
   //assign clk100=clk; assign clk50=clk; assign clk25=clk; assign clk12=clk;

   // For synthesis:  use an appropriate clock frequency(ies) below
   //   clk100 will work for only the most efficient designs (hardly anyone)
   //   clk50 or clk 25 should work for the vast majority
   //   clk12 should work for everyone!
   //
   // Use the same clock frequency for the MIPS and data memory/memIO modules
   // The vgadisplaydriver should keep the 100 MHz clock.
   // For example:

   mips mips(clk12, reset, instr, mem_readdata, pc, mem_wr, mem_addr, mem_writedata);
   imem #(`imem_Abits, `imem_Dbits, `imem_Nloc, imem_init) imem(pc, instr);
   memIO #(dmem_init, smem_init) memIO(clk12, mem_wr, mem_addr, mem_writedata, keyb_writedata, smem_addr, charcode, mem_readdata);
   vgadisplaydriver #(bitmap_init) display(clk100, charcode, {red, green, blue}, hsync, vsync, smem_addr);
   keyboard keyboard(clk100, ps2_clk, ps2_data, keyb_writedata);
   display8digit disp({{(32-`kmem_Dbits){1'b0}},keyb_writedata}, clk100, segments, digitselect);
 
endmodule
