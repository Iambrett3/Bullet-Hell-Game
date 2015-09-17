`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2015 01:18:54 PM
// Design Name: 
// Module Name: memIO_test
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


module memIO_test();
    //INPUTS
    reg clk, mem_wr;
    reg [31:0] data_addr, writedata;
    reg [10:0] vga_addr;
    
    //OUTPUTS
    wire [1:0] vga_readdata;
    wire [31:0] memmap_readdata;
    
    memIO #(32, 32, 32, "screentest_dmem.hex", "screentest_smem.txt")  uut (clk, mem_wr, data_addr, writedata, vga_addr, vga_readdata, memmap_readdata);
    
    initial begin
       #0.5 clk = 0;
       forever
           #0.5 clk = ~clk;
    end
    
    initial begin
       #5 mem_wr = 0; data_addr = 32'b00000000000000000010000000110100; 
          writedata = 32'b00000000000000000000000000000000; vga_addr = 0;
    end

    
    initial begin
          #50 $finish;
    end

endmodule
