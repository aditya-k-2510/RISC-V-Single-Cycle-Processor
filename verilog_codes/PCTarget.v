`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 16:34:55
// Design Name: 
// Module Name: PCTarget
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


module PCTarget(
input[31:0] pc,
input[31:0] ImmExt,
output[31:0] pctarg
    );
    
assign pctarg = pc + ImmExt;
endmodule
