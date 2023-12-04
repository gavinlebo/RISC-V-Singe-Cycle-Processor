`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 12:41:04 AM
// Design Name: 
// Module Name: MainMemory
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


module MainMemory(
    input clk,WE,
    input [31:0]Address,WriteData,
    output [31:0]ReadData
    );
    reg [31:0] mem [1023:0];

    always @ (posedge clk)
    begin
        if(WE)
            mem[Address] <= WriteData;
    end

    assign ReadData = mem[Address];

    initial begin
        mem[32] = 32'h00000010;
    end
endmodule
