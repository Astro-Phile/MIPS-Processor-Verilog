`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 22:55:21
// Design Name: 
// Module Name: CPU
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


module CPU(
    input clk,reset,
    output [15:0] result
    );
    
    reg [15:0] pc;
    wire [15:0] next_pc, instruction, alu_result, reg_out1, reg_out2;
    wire [2:0] alu_op;
    
    IMEM imem(
        .pc(pc),
        .instruction(instruction)
    );
    
    Decoder decod(
        .opcode(instruction[15:11]),
        .alu_op(alu_op)
    );
    
    RegFile registers(
        .clk(clk),
        .readReg1(instruction[10:8]),
        .readReg2(instruction[7:5]),
        .writeReg(instruction[4:2]),
        .write_data(alu_result),
        .reg_write(1'b1),//always on for simple cpu
        .read_data1(reg_out1),
        .read_data2(reg_out2)
    );
    
    ALU alu(
        .a(reg_out1),
        .b(reg_out2),
        .alu_op(alu_op),//
        .result(alu_result)
    );
       // PC Adder
    PC_adder pc_add (
        .pc(pc),
        .next_pc(next_pc)
    );
    always @(posedge clk or posedge reset) begin
        if(reset)
            pc <= 16'b0;
        else
            pc <= next_pc;
    end
endmodule
