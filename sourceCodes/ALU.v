`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 22:03:28
// Design Name: 
// Module Name: ALU
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

module ALU(
        input [15:0] a,b,
        input [2:0] alu_op,
        output reg [15:0] result
    );
    always @(*) begin//asychronous 
        case (alu_op)
            3'b001: result = a + b;
            3'b001: result = a - b;
            3'b001: result = (a>=b)? 16'hFFFF : 16'h0000;//intead or 1 and 0 this is better for if bitwise operation done.
            default: result = 16'h0000;
         endcase
    end
endmodule

