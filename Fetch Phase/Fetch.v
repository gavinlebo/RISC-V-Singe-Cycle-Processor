`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2023 11:19:44 PM
// Design Name: 
// Module Name: Fetch
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


module Fetch(
    input clk,
    output [31:0] Instruction
    );
    reg[31:0] PC;
    
    always @(posedge clk)
    begin
        PC <= PC + 4;
    end
    
    InstructionMemory mem (.Address(PC), .Instruction(Instruction));
endmodule
