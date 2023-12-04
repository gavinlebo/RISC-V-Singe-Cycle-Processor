`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 12:39:50 AM
// Design Name: 
// Module Name: Execute
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


module Execute(
    input [31:0]RD1,RD2,Imm,
    input [2:0]ALUControl,
    input ALUSrc,
    output [31:0]Result
    );
    wire Cout;
    wire [31:0]Sum, B;
    wire [31:0]A = RD1;
    
    Mux  mux(.a(RD2), .b(Imm), .s(ALUSrc), .c(B));
    
    assign Sum = (ALUControl[0] == 1'b0) ? A + B : (A + ((~B)+1)) ;
    
    assign {Cout,Result} = (ALUControl == 3'b000) ? Sum :
                           (ALUControl == 3'b001) ? Sum :
                           (ALUControl == 3'b010) ? A & B :
                           (ALUControl == 3'b011) ? A | B :
                           (ALUControl == 3'b101) ? {{32{1'b0}},(Sum[31])} :
                           {33{1'b0}};
                           
    
endmodule
