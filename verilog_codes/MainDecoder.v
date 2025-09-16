`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 14:07:38
// Design Name: 
// Module Name: MainDecoder
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


module MainDecoder(
input[6:0] op,
output reg Branch, 
output reg Jump,
output reg JumpI,
output reg[2:0] ResultSrc, 
output reg MemWrite, 
output reg[1:0] ALUSrc, 
output reg[2:0] ImmSrc,
output reg RegWrite, 
output reg[1:0] ALUOp
    );
parameter ITypeL = 7'b0000011, 
          SType = 7'b0100011, 
          Rtype = 7'b0110011, 
          BType = 7'b1100011,
          ITypeALU = 7'b0010011,
          JType = 7'b1101111,
          ITypeJ = 7'b1100111,
          UTypeL = 7'b0110111,
          UTypeALU = 7'b0010111;
        
always@(*)
begin   
    case(op)    
        ITypeL: begin
                RegWrite = 1'b1;
                ImmSrc = 3'b000;
                ALUSrc = 2'b01;
                MemWrite = 1'b0;
                ResultSrc = 3'b001;
                Branch = 1'b0;
                ALUOp = 2'b00;
                Jump = 1'b0; 
                JumpI = 1'b0;
        end
        
        SType: begin
               RegWrite = 1'b0;
               ImmSrc = 3'b001;
               ALUSrc = 2'b01;
               MemWrite = 1'b1;
               ResultSrc = 3'bx;
               Branch = 1'b0;
               ALUOp = 2'b00;
               Jump = 1'b0;
               JumpI = 1'b0;
        end
        
        Rtype: begin
               RegWrite = 1'b1;
               ImmSrc = 3'bx;
               ALUSrc = 2'b00;
               MemWrite = 1'b0;
               ResultSrc = 3'b000;
               Branch = 1'b0;
               ALUOp = 2'b10;
               Jump = 1'b0;
               JumpI = 1'b0;
        end
        
        BType: begin
               RegWrite = 1'b0;
               ImmSrc = 3'b010;
               ALUSrc = 2'b00;
               MemWrite = 1'b0;
               ResultSrc = 3'bx;
               Branch = 1'b1;
               ALUOp = 2'b01;
               Jump = 1'b0;
               JumpI = 1'b0;
        end
        
        ITypeALU: begin
                  RegWrite = 1'b1;
                  ImmSrc = 3'b000;
                  ALUSrc = 2'b01;
                  MemWrite = 1'b0;
                  ResultSrc = 3'b000;
                  Branch = 1'b0;
                  ALUOp = 2'b10;
                  Jump = 1'b0;
                  JumpI = 1'b0;
        end
        
        JType: begin
               RegWrite = 1'b1;
               ImmSrc = 3'b011;
               ALUSrc = 2'bx;
               MemWrite = 1'b0;
               Branch = 1'b0;
               ResultSrc = 3'b010;
               ALUOp = 2'bx;
               Jump = 1'b1;
               JumpI = 1'b0;
        end
        
        ITypeJ: begin
                RegWrite = 1'b1;
                ImmSrc = 3'b000;
                ALUSrc = 2'b01;
                MemWrite = 1'b0;
                Branch = 1'b0;
                ResultSrc = 3'b010;
                ALUOp = 2'b00;
                Jump = 1'b0;
                JumpI = 1'b1;  
        end
                
        UTypeL: begin
                RegWrite = 1'b1;
                ImmSrc = 3'b100;
                ALUSrc = 2'bx;
                MemWrite = 1'b0; 
                Branch = 1'b0;
                ResultSrc = 3'b011;
                ALUOp = 2'bx;
                Jump = 1'b0;
                JumpI = 1'b0;
        end       
        
        UTypeALU: begin
                  RegWrite = 1'b1;
                  ImmSrc = 3'b100;
                  ALUSrc = 2'b10;
                  MemWrite = 1'b0; 
                  Branch = 1'b0;
                  ResultSrc = 3'b100;
                  ALUOp = 2'b00;
                  Jump = 1'b0;
                  JumpI = 1'b0;
        end       
    endcase
end

endmodule
