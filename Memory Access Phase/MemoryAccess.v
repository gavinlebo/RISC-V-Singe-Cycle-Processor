`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 12:40:28 AM
// Design Name: 
// Module Name: MemoryAccess
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


module MemoryAccess(
    input clk,WE,
    input [31:0]Address,WriteData,
    output [31:0]ReadData
    );
    MainMemory MainMemory(
                        .clk(clk),
                        .WE(WE),
                        .WriteData(WriteData),
                        .Address(Address),
                        .ReadData(ReadData)
    );
endmodule
