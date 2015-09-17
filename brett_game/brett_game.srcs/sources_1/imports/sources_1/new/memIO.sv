`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2015 08:14:14 PM
// Design Name: 
// Module Name: memIO
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

module memIO#(
//   parameter Abits = 32,          // Number of bits in address
//   parameter Dbits = 32,         // Number of bits in data
//   parameter Nloc = 8,           // Number of memory locations
   parameter dmem_init,
   parameter smem_init
)(
    input clk,
    input mem_wr,
    input [31:0] mips_addr,
    input [31:0] writedata,
    input [`kmem_Dbits-1:0] keyb_writedata,
    input [`smem_Abits-1:0] vga_addr,
    output [`smem_Dbits-1:0] vga_readdata,
    output [31:0] memmap_readdata 
    );
    
    wire [31:0] dmem_readdata;
    wire [`smem_Dbits-1:0] smem_readdata;
    wire smem_wr, dmem_wr;
    
    mem_mapper memmap(mem_wr, mips_addr, dmem_readdata, smem_readdata, keyb_writedata, memmap_readdata, smem_wr, dmem_wr);
    
    screenmemory #(`smem_Abits, `smem_Dbits, `smem_Nloc, smem_init) screenmem(clk, smem_wr, writedata, mips_addr[16:0], vga_addr, vga_readdata, smem_readdata);
    
    dmem #(`dmem_Abits, `dmem_Dbits, `dmem_Nloc, dmem_init) dmem(clk, dmem_wr, mips_addr[16:0], writedata, dmem_readdata);
    

endmodule
