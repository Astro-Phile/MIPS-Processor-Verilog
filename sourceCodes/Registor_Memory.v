`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 22:12:06
// Design Name: 
// Module Name: Reg
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
module RegFile(
        input clk,
        input [2:0] readReg1, [2:0] readReg2, [2:0] writeReg, 
        input [15:0] write_data,
        input reg_write,//writing signal
        output [15:0] read_data1,
        output [15:0] read_data2
    );
    reg [15:0] registers [0:7];
    
    assign read_data1 = registers[readReg1];
    assign read_data2 = registers[readReg2];//asynchronous readeing
    
    //Changes happen only on the clock edge (rising or falling).
    always @(posedge clk) begin  //Example: A teacher takes attendance only when class starts (clock edge).
        if(reg_write)
         registers[writeReg]<= write_data;//cant use assign as that is combinational logic and registers require sequensial
    end
endmodule

