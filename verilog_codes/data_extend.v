`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 21:22:26
// Design Name: 
// Module Name: data_extend
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


module data_extend(
input[31:0] RD,
input[2:0] ex,
output reg[31:0] ex_data
    );
always@(*)
begin
case(ex)
    3'b000: begin
            ex_data = {{24{RD[7:7]}}, RD[7:0]};
    end
    
    3'b001: begin   
            ex_data = {{16{RD[15:15]}}, RD[15:0]};
    end
    
    3'b010: begin
            ex_data = RD;
    end
    
    3'b100: begin   
            ex_data = {24'b0, RD[7:0]};
    end
    
    3'b101: begin
            ex_data = {16'b0, RD[15:0]};
    end
endcase
end
endmodule
