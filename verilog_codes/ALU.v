`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 17:19:23
// Design Name: 
// Module Name: ALU
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


module ALU(
input[31:0] SrcA,
input[31:0] SrcB,
output reg[31:0] ALUResult,
input[3:0] ALUControl, 
output reg zero,
output reg lt,
output reg ltu
);

always@(*)
begin
    case(ALUControl)
        4'b0000: begin 
                 ALUResult = SrcA+SrcB;
                 lt = 1'bx;
                 ltu = 1'bx;
                 zero = 1'bx;
                 end
        
        4'b0001: begin 
                 ALUResult = SrcA-SrcB;  
                 zero = ((SrcA-SrcB)==0);
                 lt = 1'bx;
                 ltu = 1'bx;
                 end
   
        4'b0010: begin
                 ALUResult = SrcA&SrcB;
                 lt = 1'bx;
                 ltu = 1'bx;
                 zero = 1'bx;
                 end
        
        4'b0011: begin 
                 ALUResult = SrcA|SrcB;
                 lt = 1'bx;
                 ltu = 1'bx;
                 zero = 1'bx;
                 end
        
        4'b0100: begin
                 ALUResult = SrcA<<SrcB[4:0];
                 lt = 1'bx;
                 ltu = 1'bx;
                 zero = 1'bx;
                 end
        
        4'b0101: begin 
                 ltu = 1'bx;
                 zero = 1'bx;
                 if(SrcA[31:31] == 1'b1&&SrcA[31:31]==1'b1) begin
                    ALUResult = SrcA>SrcB; 
                    lt = SrcA>SrcB;
                 end
                      
                 else if(SrcA[31:31] == 1'b1) 
                 begin
                    ALUResult = 32'b1; 
                    lt = 1'b1;
                 end
                        
                 else if(SrcB[31:31] == 1'b1) 
                 begin
                    ALUResult = 32'b0; 
                    lt = 1'b0;
                 end
                      
                 else begin
                    ALUResult = SrcA<SrcB; 
                    lt = SrcA<SrcB;
                 end
          end
          
          4'b0110: begin
                   ALUResult = SrcA<SrcB;
                   ltu = SrcA<SrcB;
                   lt = 1'bx;
                   zero = 1'bx;
          end
         
          4'b0111: begin
                   lt = 1'bx;
                   ltu = 1'bx;
                   zero = 1'bx;
                   ALUResult = SrcA^SrcB;
          end
          
          4'b1000: begin
                   lt = 1'bx;
                   ltu = 1'bx;
                   zero = 1'bx;
                   ALUResult = SrcA>>SrcB[4:0];
          end
          
          4'b1001: begin
                   lt = 1'bx;
                   ltu = 1'bx;
                   zero = 1'bx;
                   ALUResult = $signed(SrcA)>>>SrcB[4:0];
          end
     endcase
end
endmodule
