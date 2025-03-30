`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 00:23:37
// Design Name: 
// Module Name: TESTBENCH
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

module CPU_tb;

    reg clk, reset;
    wire [15:0] result;

    // Instantiate CPU
    CPU uut (
        .clk(clk),
        .reset(reset),
        .result(result)
    );

    // Clock Generation (50 MHz -> 20 ns period)
    always #10 clk = ~clk; 

    initial begin
        // Initialize
        clk = 0;
        reset = 1;

        // Hold reset for a few cycles
        #50;
        reset = 0;

        // Let the CPU run for some cycles
        #500;

        // Stop simulation
        $stop;
    end
endmodule

