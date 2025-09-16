`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 16:59:29
// Design Name: 
// Module Name: PCplus4
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


module PCplus4(
input[31:0] pc,
output[31:0] pcp4
    );

assign pcp4 = pc+32'b100;
endmodule
