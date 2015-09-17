`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2015 02:17:49 PM
// Design Name: 
// Module Name: screenmemory
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


module screenmemory #(
    parameter Abits = 17,
    parameter Dbits = 4,
    parameter Nloc = 76800,
    parameter smem_init
    )(
    input clock,
    input wr,
    input [Dbits-1 : 0] writedata,
    input [16 : 0] memmapaddr,
    input [16 : 0] vgaaddr,
    output [Dbits-1 : 0] vga_readdata,
    output [Dbits-1 : 0] memmap_readdata
    );
    
    reg [Dbits-1:0] rf[Nloc-1:0];
    
    always_ff @(posedge clock)                               // Memory write: only when wr==1, and only at posedge clock
          if(wr)
             rf[memmapaddr] <= writedata;
    
    initial $readmemh(smem_init, rf, 0, Nloc-1);
    
    assign vga_readdata = rf[vgaaddr];
    assign memmap_readdata = rf[memmapaddr];
endmodule
