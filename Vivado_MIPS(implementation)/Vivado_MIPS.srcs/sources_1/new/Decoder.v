`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 22:38:55
// Design Name: 
// Module Name: Decoder
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


module Decoder(
        input [4:0] opcode,
        output reg [2:0]alu_op// 3-bit control signal for ALU
    );
    
    always @(*) begin
        case(opcode)
            5'b00001 : alu_op = 3'b001;//add
            5'b00010 : alu_op = 3'b010;//sub
            5'b00011 : alu_op = 3'b100;//compare
            default : alu_op = 3'b000;
        endcase
    end    
endmodule
