`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2025 20:31:13
// Design Name: 
// Module Name: MUX4X1
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


module MUX4X1(
input[31:0] I0,
input[31:0] I1,
input[31:0] I2,
input[31:0] I3,
input[1:0] S,
output reg[31:0] result
    );
    
always@(*) begin
    case(S)
        2'b00: result = I0;
        2'b01: result = I1;
        2'b10: result = I2;
        2'b11: result = I3;
    endcase
end

endmodule
