`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 13:34:45
// Design Name: 
// Module Name: control_unit
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


module control_unit(
output[1:0] snb,
input[6:0] op,
input[2:0] funct3,
input funct7_5,
input zero,
input lt,
input ltu,
output[1:0] PCSrc, 
output[2:0] ResultSrc,
output MemWrite,
output[2:0] ALUControl,
output[1:0] ALUSrc,
output[2:0] ImmSrc,
output RegWrite
);

wire Jump, JumpI;
wire Branch;
wire[1:0] ALUOp;
assign PCSrc[0:0] = (Branch & ((zero^funct3[0:0])|(lt^funct3[0:0])|(ltu^funct3[0:0])))|Jump;
assign PCSrc[1:1] = JumpI;
assign snb = funct3[1:0];
ALUDecoder ad(.op5(op[5:5]), 
              .funct3(funct3), 
              .ALUOp(ALUOp), 
              .funct7_5(funct7_5),
              .ALUControl(ALUControl));
              
MainDecoder md(.op(op), 
               .Jump(Jump),
               .JumpI(JumpI),
               .Branch(Branch),
               .ResultSrc(ResultSrc), 
               .MemWrite(MemWrite), 
               .ALUSrc(ALUSrc),
               .ImmSrc(ImmSrc), 
               .RegWrite(RegWrite),
               .ALUOp(ALUOp));
endmodule
