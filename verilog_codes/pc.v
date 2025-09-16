`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 14:44:10
// Design Name: 
// Module Name: pc
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


module pc(
input clk, rst,
input[31:0] PCNext,
output reg[31:0] pc_out
    );

always@(posedge clk or negedge rst)
begin
    if(~rst) begin
        pc_out <= 32'b0;
    end
    
    else begin
        pc_out <= PCNext;
    end
end

endmodule
