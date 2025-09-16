`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 16:47:08
// Design Name: 
// Module Name: MUX8X1
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


module MUX8X1(
input[31:0] I0,
input[31:0] I1,
input[31:0] I2,
input[31:0] I3,
input[31:0] I4,
input[31:0] I5,
input[31:0] I6,
input[31:0] I7,
input[2:0] S,
output reg[31:0] result
    );
    
always@(*) begin
    case(S)
        3'b000: result = I0;
        3'b001: result = I1;
        3'b010: result = I2;
        3'b011: result = I3;
        3'b100: result = I4;
        3'b101: result = I5;
        3'b110: result = I6;
        3'b111: result = I7;
    endcase
end

endmodule
