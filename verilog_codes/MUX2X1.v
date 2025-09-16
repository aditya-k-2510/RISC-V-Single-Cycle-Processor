`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 13:28:50
// Design Name: 
// Module Name: MUX2X1
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


module MUX2X1(
input[31:0] I0, I1,
output reg[31:0] Y,
input S
    );
 
always@(*)
begin
    case(S)
        1'b0: Y = I0;
        1'b1: Y = I1;
    endcase
end

endmodule
