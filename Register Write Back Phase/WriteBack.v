`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 12:40:43 AM
// Design Name: 
// Module Name: WriteBack
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


module WriteBack(
    input [31:0]ALUResult, ReadData,
    input ResultSrc,
    output [31:0]WriteData
    );
    Mux Mux_DataMemory_to_Register(.a(ALUResult), .b(ReadData), .s(ResultSrc), .c(WriteData));
endmodule
