`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 14:42:18
// Design Name: 
// Module Name: ALUDecoder
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


module ALUDecoder(
input op5,
input[1:0] ALUOp,
input[2:0] funct3,
input funct7_5, 
output reg[3:0] ALUControl
);

parameter add = 4'b0000, 
          sub = 4'b0001, 
          _and = 4'b0010,
          _or = 4'b0011, 
          sll = 4'b0100, 
          slt = 4'b0101,
          sltu = 4'b0110,
          _xor = 4'b0111,
          srl = 4'b1000,
          sra = 4'b1001;
          
always@(*)
begin
    case(ALUOp)
        2'b00: ALUControl = add;
        2'b01: case(funct3)
                    3'b000: ALUControl = sub;
                    3'b001: ALUControl = sub;
                    3'b100: ALUControl = slt;
                    3'b101: ALUControl = slt;
                    3'b110: ALUControl = sltu;
                    3'b111: ALUControl = sltu;
               endcase
        2'b10: case(funct3)
                    3'b000: begin
                        if({op5, funct7_5}==2'b11) begin
                            ALUControl = sub;
                        end
                        else begin
                            ALUControl = add;   
                        end
                    end
                    
                    3'b001: begin
                            ALUControl = sll;
                    end
                       
                    3'b010: begin
                            ALUControl = slt;
                    end
                    
                    3'b011: begin
                            ALUControl = sltu;
                    end
                    
                    3'b100: begin
                            ALUControl = _xor;
                    end
                    
                    3'b101: begin
                            if(funct7_5==1'b0) begin
                                ALUControl = srl;
                            end
                            else begin
                                ALUControl = sra;
                            end
                    end
                    
                    3'b110: begin
                            ALUControl = _or;
                    end
                    
                    3'b111: begin
                        ALUControl = _and;
                    end
               endcase
    endcase
end
endmodule
