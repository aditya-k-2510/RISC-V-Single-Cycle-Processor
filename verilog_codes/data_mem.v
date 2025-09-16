`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 17:04:42
// Design Name: 
// Module Name: data_mem
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


module data_mem(
input[1:0] snb,
input clk,
input WE, 
input[31:0] A,
input[31:0] WD,
output[31:0] RD
    );
    
reg[7:0] dmem[255:0];
initial begin
    $readmemh("E:/verilog_projects/RISC-V single cycle processor/data_mem.txt", dmem, 0, 3);
end
always@(posedge clk)
begin
    if(WE) begin
        case(snb)
        2'b10: begin 
               dmem[A] = WD[7:0];
               dmem[A+1] = WD[15:8];
               dmem[A+2] = WD[23:16];
               dmem[A+3] = WD[31:24];
         end
         
        2'b01: begin
               dmem[A] = WD[7:0];
               dmem[A+1] = WD[15:8];
        end
        
        2'b00: begin
               dmem[A] = WD[7:0];
        end
        endcase                  
    end
end

assign RD[7:0] = dmem[A];
assign RD[15:8] = dmem[A+1];
assign RD[23:16] = dmem[A+2];
assign RD[31:24] = dmem[A+3];

endmodule
