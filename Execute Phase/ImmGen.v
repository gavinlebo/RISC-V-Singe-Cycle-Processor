`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 10:00:33 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
    input [31:0]Instruction,
    input ImmSrc,
    output [31:0]Imm
    );
    
    assign Imm = (ImmSrc) ? ({{20{Instruction[31]}},Instruction[31:25],Instruction[11:7]}) : {{20{Instruction[31]}},Instruction[31:20]};




endmodule
