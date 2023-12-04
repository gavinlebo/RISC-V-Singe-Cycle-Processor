`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2023 11:16:09 PM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input [1023:0] Address,
    output [31:0] Instruction
    );
    reg [31:0] memory [1023:0];
    assign Instruction = memory[Address];
    
    initial begin
        // Example program:
        memory[0] = 32'h00100093; // addi x1 x0 1
        
    end
endmodule
