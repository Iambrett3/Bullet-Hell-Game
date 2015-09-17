`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2015 02:13:17 PM
// Design Name: 
// Module Name: vgadisplaydriver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "NoMoreMagicNumbers.sv"

module vgadisplaydriver #(
  parameter bitmap_init
)(
    input clk,
    input [`smem_Dbits-1 : 0] charactercode,
    output [`bmem_Dbits-1 : 0] RGB,
    output hsync,
    output vsync,
    output [`smem_Abits-1:0] screenaddr
    );
    
    wire [`xbits-1:0] x;
    wire [`ybits-1:0] y;
    wire activevideo;
    wire [`bmem_Abits-1:0] bmem_addr;
    wire [`bmem_Dbits-1:0] bmem_color;
    
    assign screenaddr = x[`xbits-1:1] + (y[`ybits-1:1] << 8) + (y[`ybits-1:1] << 6) ; //brett game
    //assign screenaddr = x[`xbits-1:4] + (y[`ybits-1:4] * 40); //screen test
                      
    assign bmem_addr = {charactercode, y[0], x[0]}; //brett game
    //assign bmem_addr = {charactercode, y[3:0], x[3:0]}; //screen test
    
    assign RGB = (activevideo) ? bmem_color : 12'b000000000000;
    
    vgatimer myvgatimer(clk, hsync, vsync, activevideo, x, y);
    
   // screenmemory screen_mem(screenaddr, charactercode);
    bitmapmemory #(`bmem_Abits, `bmem_Dbits, `bmem_Nloc, bitmap_init) bitmap_mem(bmem_addr, bmem_color);
    
endmodule
