`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 22:07:37
// Design Name: 
// Module Name: I
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

module IMEM(
        input [15:0]pc,
        output reg [15:0]instruction // reg for procedral as simply output will not catch save the procedure
    );
    parameter Mem_size=256;//variable & scalable size memory
 
    reg [15:0] mem [0:Mem_size-1];// 256 instrution store memory each 16 bit
    
     initial begin
        // Example: Load some instructions
        mem[0] = 16'b0000000000000001; // Example instruction
        mem[1] = 16'b0000000000000010;
     end
    
//    initial begin
//     $readmemh("Instruction.hex",mem);//load from the hexadecimal file
//    end
    
    //The pc >> 1 ensures word-aligned access (divides by 2 since each instruction is 16 bits).
    always @(*) begin
         instruction = mem[pc >> 1];
    end
endmodule
