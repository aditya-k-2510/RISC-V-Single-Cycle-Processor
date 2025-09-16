`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 15:09:47
// Design Name: 
// Module Name: reg_file
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


module reg_file(
input WE3,
input clk,
input[4:0] A1,
input[4:0] A2,
input[4:0] A3,
output[31:0] RD1,
output[31:0] RD2,
input[31:0] WD3
    );
 
reg[31:0] rf[31:0];
always@(posedge clk)
begin
    if(WE3) begin
        rf[A3] <= WD3;
    end
end

assign RD1 = rf[A1];
assign RD2 = rf[A2];
endmodule
