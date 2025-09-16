`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 14:54:34
// Design Name: 
// Module Name: ins_mem
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


module ins_mem(
input[31:0] A,
output[31:0] instr
    );

reg[31:0] imem[255:0];
initial begin
$readmemh("E:/verilog_projects/RISC-V single cycle processor/ins_mem.txt", imem, 0, 3);
end

assign instr = imem[A];
endmodule
