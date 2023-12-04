`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2023 10:56:03 PM
// Design Name: 
// Module Name: Core
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


module Core(
    input clk
    );
    
    wire[31:0] Instruction, Imm, ReadData1, ReadData2, WriteData, ALUResult, MemReadData;
    wire RegWrite,ALUSrc,MemWrite,ResultSrc,Branch;
    wire [1:0]ImmSrc;
    wire[2:0] ALUControl;
    
    //fetch intruction phase
    Fetch fetch(.clk(clk), .Instruction(Instruction));
    
    //decode intruction phase
    Decode decode(.Instruction(Instruction), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .MemWrite(MemWrite), .ResultSrc(ResultSrc), .Branch(Branch), .ImmSrc(ImmSrc), .ALUControl(ALUControl));
    
    //generate immediate
    ImmGen immgen(.Instruction(Instruction), .ImmSrc(ImmSrc[0]), .Imm(Imm));
    
    //execute insstruction phase
    Execute execute(.RD1(ReadData1), .RD2(ReadData2), .ALUControl(ALUControl), .ALUSrc(ALUSrc), .Result(ALUResult));
    
    //Write to memory phase
    MemoryAccess memoryaccess(.clk(clk), .WE(MemWrite), .WriteData(ReadData2), .Address(ALUResult), .ReadData(MemReadData));
    
    //write back to register phase
    WriteBack(.ALUResult(ALUResult), .ReadData(MemReadData), .ResultSrc(ResultSrc), .WriteData(WriteData));

    //register file
    RegisterFile RegisterFile(
                            .clk(clk),
                            .RegWrite(RegWrite),
                            .WriteData(WriteData),
                            .ReadRegister1(Instruction[19:15]),
                            .ReadRegister2(Instruction[24:20]),
                            .WriteRegister(Instruction[11:7]),
                            .ReadData1(ReadData1),
                            .ReadData2(ReadData2)
    );
endmodule
