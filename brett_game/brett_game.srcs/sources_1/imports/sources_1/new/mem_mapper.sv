`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2015 08:30:07 PM
// Design Name: 
// Module Name: mem_mapper
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

module mem_mapper(
    input mem_wr,
    input [31:0] in_addr,
    input [`dmem_Dbits-1:0] dmem_readdata,
    input [`smem_Dbits-1:0] screenmem_readdata,
    input [`kmem_Dbits-1:0] kmem_readdata,
    output [31:0] readdata,
    output screenmem_enable,
    output dmem_enable
    );
    
    
    assign screenmem_enable = (in_addr[18:17] == 2'b10) & mem_wr ? 1'b1 : 1'b0;
    assign dmem_enable = (in_addr[18:17] == 2'b01)& mem_wr ? 1'b1 : 1'b0;
    
    assign readdata = (in_addr[18:17] == 2'b01) ? {{(32-`dmem_Dbits){1'b0}},dmem_readdata} 
                    : (in_addr[18:17] == 2'b10) ? {{(32-`smem_Dbits){1'b0}}, screenmem_readdata}
                    : (in_addr[18:17] == 2'b11) ? {{(32-`kmem_Dbits){1'b0}}, kmem_readdata}
                    : {32{1'b0}};
    
    
endmodule
