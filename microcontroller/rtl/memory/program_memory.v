`timescale 1ns / 1ps

`include "params.v"

//==============================================================================
// Program Memory (Read-Only)
//
// Contains the instruction memory for the microcontroller
// Pre-loaded with test programs for simulation
//==============================================================================

module program_memory(
    input wire [`program_data_max_length-1:0] program_data_address,
    input wire clk,
    output reg [`program_data_size-1:0] program_data
);

    //==========================================================================
    // Internal Program Memory - 256 x 16-bit instructions
    //==========================================================================
    reg [`program_data_size-1:0] internal_program_data [255:0];

    //==========================================================================
    // Program Initialization
    // Pre-load test programs into memory
    //==========================================================================
    initial begin
        // Initialize all locations to NOP
        integer i;
        for (i = 0; i < 256; i = i + 1) begin
            internal_program_data[i] = `NOP;
        end

        //======================================================================
        // Test Program 1: Simple Addition (1 + 2 = 3)
        // Location: 0-12
        //======================================================================
        internal_program_data[0] = `NOP;
        internal_program_data[1] = `instruction_LOAD(1);        // Load 1 to CU output
        internal_program_data[2] = `instruction_SAVE_CU(0);     // Save to RAM[0]
        internal_program_data[3] = `instruction_LOAD(2);        // Load 2 to CU output
        internal_program_data[4] = `instruction_SAVE_CU(1);     // Save to RAM[1]
        internal_program_data[5] = `instruction_MOV_ramX_A1orB2(0, 1); // RAM[0] -> A
        internal_program_data[6] = `instruction_MOV_ramX_A1orB2(1, 2); // RAM[1] -> B
        internal_program_data[7] = `ADD;                         // A + B
        internal_program_data[8] = `instruction_MOV_C_regX(0);  // Save result to reg[0]
        internal_program_data[9] = `instruction_MOV_C_regX(1);  // Save result to reg[1]
        internal_program_data[10] = `instruction_MOV_regX_A(0); // Move reg[0] to A
        internal_program_data[11] = `instruction_MOV_regX_B(0); // Move reg[0] to B
        internal_program_data[12] = `instruction_JUMP(16);      // Jump to program 2

        //======================================================================
        // Test Program 2: Increment Loop with Overflow Detection
        // Location: 16-27
        // Increments a value until overflow occurs
        //======================================================================
        internal_program_data[16] = `instruction_LOAD(0);       // Load 0
        internal_program_data[17] = `instruction_SAVE_CU(0);    // Clear RAM[0]
        internal_program_data[18] = `instruction_SAVE_CU(1);    // Clear RAM[1]
        internal_program_data[19] = `instruction_LOAD(1);       // Load 1
        internal_program_data[20] = `instruction_SAVE_CU(0);    // Save to RAM[0]
        internal_program_data[21] = `instruction_MOV_ramX_A1orB2(0, 1); // RAM[0] -> A
        internal_program_data[22] = `instruction_MOV_ramX_A1orB2(1, 2); // RAM[1] -> B
        internal_program_data[23] = `ADD;                        // Add
        internal_program_data[24] = `instruction_MOV_C_regX(0); // Save to reg[0]
        internal_program_data[25] = `instruction_MOV_regX_B(0); // Move reg[0] to B
        internal_program_data[26] = `instruction_JUMP_OV(50);   // Jump if overflow
        internal_program_data[27] = `instruction_JUMP(23);      // Loop back

        //======================================================================
        // Test Program 3: Double Addition Loop
        // Location: 50-68
        // Performs repeated addition: result = result + 1 + 1
        //======================================================================
        internal_program_data[50] = `instruction_LOAD(0);       // Load 0
        internal_program_data[51] = `instruction_SAVE_CU(0);    // Clear RAM[0]
        internal_program_data[52] = `instruction_SAVE_CU(1);    // Clear RAM[1]
        internal_program_data[53] = `instruction_MOV_ramX_A1orB2(0, 1); // RAM[0] -> A
        internal_program_data[54] = `instruction_MOV_ramX_A1orB2(0, 2); // RAM[0] -> B
        internal_program_data[55] = `ADD;                        // Add (0 + 0)
        internal_program_data[56] = `instruction_MOV_C_regX(0); // Save to reg[0]
        internal_program_data[57] = `instruction_MOV_C_regX(1); // Save to reg[1]

        // Loop: Add 1 twice
        internal_program_data[58] = `instruction_LOAD(1);       // Load 1
        internal_program_data[59] = `instruction_SAVE_CU(8);    // Save to RAM[8]
        internal_program_data[60] = `instruction_MOV_ramX_A1orB2(8, 1); // RAM[8] -> A
        internal_program_data[61] = `instruction_MOV_ramX_A1orB2(8, 2); // RAM[8] -> B
        internal_program_data[62] = `ADD;                        // 1 + 1 = 2
        internal_program_data[63] = `instruction_MOV_C_regX(0); // Save to reg[0]
        internal_program_data[64] = `instruction_MOV_regX_B(0); // Move to B
        internal_program_data[65] = `ADD;                        // Add again
        internal_program_data[66] = `instruction_JUMP_OV(0);    // Jump to 0 if overflow
        internal_program_data[67] = `instruction_JUMP(63);      // Loop back
    end

    //==========================================================================
    // Memory Read Logic
    // Output instruction at addressed location on negative clock edge
    //==========================================================================
    always @(negedge clk) begin
        program_data <= internal_program_data[program_data_address];
    end

endmodule
