`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 17:23:26
// Design Name: 
// Module Name: CPU
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


module CPU(
input clk, 
input rst
);

wire[31:0] PCNext;
wire[31:0] pc_out;
wire[31:0] pcp_out;
wire[31:0] ins_out;
wire[31:0] ImmExt;
wire[31:0] pctarg;
wire[31:0] RD1, RD2;
wire[31:0] Result;
wire[31:0] SrcB;
wire zero;
wire lt;
wire ltu;
wire[31:0] ALUResult;
wire[31:0] ReadData;
wire[1:0] PCSrc;
wire[2:0] ResultSrc;
wire MemWrite;
wire[2:0] ALUControl;
wire[1:0] ALUSrc;
wire[2:0] ImmSrc;
wire RegWrite;
wire[1:0] snb;
wire[31:0] ex_data;

control_unit i0(.snb(snb),
                .op(ins_out[6:0]),
                .funct3(ins_out[14:12]),
                .funct7_5(ins_out[30:30]),
                .zero(zero),
                .lt(lt),
                .ltu(ltu),
                .PCSrc(PCSrc),
                .ResultSrc(ResultSrc),
                .MemWrite(MemWrite),
                .ALUControl(ALUControl),
                .ALUSrc(ALUSrc),
                .ImmSrc(ImmSrc),
                .RegWrite(RegWrite));

pc i1(.PCNext(PCNext), 
      .clk(clk), 
      .rst(rst), 
      .pc_out(pc_out));
      
PCplus4 i2(.pc(pc_out), 
           .pcp4(pcp_out));

ins_mem i3(.A(pc_out), 
           .instr(ins_out));


extend i4(.instr(ins_out[31:7]), 
          .ImmSrc(ImmSrc), 
          .ImmExt(ImmExt));


PCTarget i5(.pc(pc_out), 
            .ImmExt(ImmExt), 
            .pctarg(pctarg));
           

MUX4X1 i6(.I0(pcp_out), 
          .I1(pctarg), 
          .I2(ALUResult),
          .Y(PCNext), 
          .S(PCSrc));
          

reg_file i7(.WE3(RegWrite), 
            .clk(clk), 
            .A1(ins_out[19:15]),
            .A2(ins_out[24:20]),
            .A3(ins_out[11:7]),
            .WD3(Result),
            .RD1(RD1),
            .RD2(RD2));
            

MUX4X1 i8(.I0(RD2), 
          .I1(ImmExt), 
          .I2(pctarg),
          .Y(SrcB), 
          .S(ALUSrc));
           

ALU i9(.SrcA(RD1), 
       .SrcB(SrcB),
       .ALUControl(ALUControl), 
       .zero(zero),
       .lt(lt),
       .ltu(ltu),
       .ALUResult(ALUResult));

data_mem i10(.snb(snb),
             .A(ALUResult), 
             .WD(RD2),
             .clk(clk),
             .WE(MemWrite),
             .RD(ReadData));

data_extend i11(.RD(ReadData),
                .ex(ins_out[14:12]),
                .ex_data(ex_data));
                
MUX8X1 i12(.I0(ALUResult),
           .I1(ex_data),
           .I2(pcp_out),
           .I3(ImmExt),
           .I4(pctarg),
           .S(ResultSrc),
           .Y(Result));
endmodule
