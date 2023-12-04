`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 12:41:16 AM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input clk,RegWrite,
    input [4:0]ReadRegister1,ReadRegister2,WriteRegister,
    input [31:0]WriteData,
    output [31:0]ReadData1,ReadData2
    );
    reg [31:0] Register [31:0];
    
    always @ (posedge clk)
    begin
        if(RegWrite)
            Register[WriteRegister] <= WriteData;
    end

    assign ReadData1 = Register[ReadRegister1];
    assign ReadData2 = Register[ReadRegister2];

endmodule
