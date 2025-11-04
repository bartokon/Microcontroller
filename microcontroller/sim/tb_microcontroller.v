`timescale 1ns / 1ps

`include "params.v"

//==============================================================================
// Microcontroller Testbench
//
// Tests the complete microcontroller by running test programs from program
// memory and observing the results
//==============================================================================

module tb_microcontroller;

    //==========================================================================
    // Testbench Signals
    //==========================================================================
    reg clk;
    reg reset;
    reg enable;
    wire [`operand_size-1:0] debug_output;

    //==========================================================================
    // Device Under Test (DUT) - Microcontroller
    //==========================================================================
    microcontroller_top dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .debug_output(debug_output)
    );

    //==========================================================================
    // Clock Generation - 2ns period (500 MHz)
    //==========================================================================
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    //==========================================================================
    // Test Stimulus
    //==========================================================================
    initial begin
        // Initialize signals
        reset = 0;
        enable = 0;

        // Display test banner
        $display("========================================");
        $display("Microcontroller Testbench Starting");
        $display("========================================");
        $display("Time: %0t", $time);

        // Apply reset for a few clock cycles
        #4 reset = 1;
        enable = 1;

        $display("[%0t] Reset released, microcontroller enabled", $time);

        // Run for sufficient time to execute test programs
        #500;

        // Display final state
        $display("\n========================================");
        $display("Simulation Complete at time: %0t", $time);
        $display("========================================");

        // Finish simulation
        $finish;
    end

    //==========================================================================
    // Monitor Key Signals
    //==========================================================================
    initial begin
        $monitor("[%0t] PC=%0d Debug_Out=0x%02x",
                 $time,
                 dut.program_data_address,
                 debug_output);
    end

    //==========================================================================
    // Waveform Dumping for Post-Simulation Analysis
    //==========================================================================
    initial begin
        $dumpfile("microcontroller_tb.vcd");
        $dumpvars(0, tb_microcontroller);

        // Dump specific internal signals for debugging
        $dumpvars(1, dut.cu_inst);
        $dumpvars(1, dut.alu_inst);
        $dumpvars(1, dut.gen_regs_inst);
        $dumpvars(1, dut.ram_inst);
    end

    //==========================================================================
    // Timeout Watchdog
    //==========================================================================
    initial begin
        #10000;
        $display("\n[ERROR] Simulation timeout at %0t", $time);
        $finish;
    end

endmodule
