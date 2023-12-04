`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2023 11:27:09 PM
// Design Name: 
// Module Name: Decode
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


module Decode(
    input[31:0] Instruction,
    output RegWrite,ALUSrc,MemWrite,ResultSrc,Branch,
    output [1:0]ImmSrc,
    output[2:0] ALUControl
    );
    
    wire[6:0] Op = Instruction[6:0];
    wire[6:0] funct7 = Instruction[31:25];
    wire[3:0] funct3 = Instruction[14:12];
    
    assign RegWrite = (Op == 7'b0000011 | Op == 7'b0110011) ? 1'b1 : 1'b0 ;
    
    assign ImmSrc = (Op == 7'b0100011) ? 2'b01 : (Op == 7'b1100011) ? 2'b10 :  2'b00 ;
    
    assign ALUSrc = (Op == 7'b0000011 | Op == 7'b0100011) ? 1'b1 : 1'b0 ;
    
    assign MemWrite = (Op == 7'b0100011) ? 1'b1 :1'b0 ;
    
    assign ResultSrc = (Op == 7'b0000011) ? 1'b1 : 1'b0 ;
    
    assign Branch = (Op == 7'b1100011) ? 1'b1 : 1'b0 ;
                                         
                                         
                                         
    wire ALUOp = (Op == 7'b0110011) ? 2'b10 : (Op == 7'b1100011) ? 2'b01 : 2'b00 ;
                                        
    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 :
                        (ALUOp == 2'b01) ? 3'b001 :
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({Op[5],funct7[5]} == 2'b11)) ? 3'b001 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({Op[5],funct7[5]} != 2'b11)) ? 3'b000 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 : 
                                                                  3'b000 ;
endmodule
