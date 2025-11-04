`timescale 1ns / 1ps

`include "params.v"

//==============================================================================
// Control Unit Module
//
// BUGS FIXED:
// 1. Changed blocking assignments (=) to non-blocking (<=) in sequential logic
//    Lines 174, 175, 239 - prevents race conditions and synthesis/simulation mismatches
// 2. Fixed MOV_regX_X task to properly decode register A vs B selection
//    Now uses opcode bits to determine target register correctly
//==============================================================================

module control_unit(
    // Outputs to ALU
    output reg [`ALU_INSTRUCTION_BUS_SIZE-1:0] alu_instruction,
    output reg [`number_of_alu_registers-1:0] alu_register_enable,

    // Outputs to General Registers
    output reg [`number_of_registers-1:0] register_select,
    output reg register_write,
    output reg register_read,
    output reg [1:0] register_enable,

    // Program Memory Interface
    input wire [`program_data_size-1:0] program_data,
    output reg [`program_data_max_length-1:0] program_data_address,

    // Data Output
    output reg [`operand_size-1:0] output_data,

    // RAM Interface
    output reg [`ram_addres_bus_size-1:0] ram_address,
    output reg [1:0] ram_cu_select,

    // ALU Status Flags
    input wire overflow,
    input wire underflow,
    input wire A_bigger,
    input wire B_bigger,
    input wire AB_same,

    // Control
    input wire enable,
    input wire clk,
    input wire reset
);

    //==========================================================================
    // Internal Registers
    //==========================================================================
    reg [`program_data_size-1:0] cu_instruction;
    reg [`program_data_max_length-1:0] program_counter;

    //==========================================================================
    // Task: Do Nothing (NOP state)
    //==========================================================================
    task do_nothing;
        begin
            register_enable <= 2'b00;
            alu_register_enable <= 2'b00;
            alu_instruction <= {`ALU_INSTRUCTION_BUS_SIZE{1'b0}};
            output_data <= {`operand_size{1'bz}};
        end
    endtask

    //==========================================================================
    // Task: Send Instruction to ALU
    // Passes the opcode to the ALU for execution
    //==========================================================================
    task send_instruction_to_alu;
        begin
            alu_register_enable <= 2'b00;
            alu_instruction <= program_data[15:12];
            register_enable <= 2'b00;
        end
    endtask

    //==========================================================================
    // Task: Move ALU Output (C) to Register X
    // Opcode: 1000_xxxx_xxxx_RRRR
    //==========================================================================
    task MOV_C_regX;
        begin
            alu_register_enable <= 2'b00;
            register_read <= 1'b0;
            register_write <= 1'b1;
            register_select <= cu_instruction[3:0];
            register_enable <= 2'b01;
        end
    endtask

    //==========================================================================
    // Task: Move Register X to ALU Register A or B
    // FIXED: Properly decode which ALU register based on opcode
    // Opcode 1001 = Move to A, enable bit 0 (alu_register_enable[0])
    // Opcode 1010 = Move to B, enable bit 1 (alu_register_enable[1])
    //==========================================================================
    task MOV_regX_X;
        begin
            // FIXED: Determine A or B based on opcode bit 12
            // Opcode 1001 (bit 12 = 0) -> A (enable = 2'b01)
            // Opcode 1010 (bit 12 = 1) -> B (enable = 2'b10)
            if (cu_instruction[12] == 1'b0) begin
                alu_register_enable <= 2'b01;  // Enable register A
            end else begin
                alu_register_enable <= 2'b10;  // Enable register B
            end

            register_write <= 1'b0;
            register_read <= 1'b1;
            register_select <= cu_instruction[3:0];
            register_enable <= 2'b01;
        end
    endtask

    //==========================================================================
    // Task: Move RAM Data to ALU Register A or B
    // Opcode: 1100_AAAAAAAA_00SS
    //==========================================================================
    task MOV_ramX_AB;
        begin
            alu_register_enable <= cu_instruction[1:0];  // 01=A, 10=B
            register_write <= 1'b0;
            register_read <= 1'b1;
            register_enable <= 2'b10;  // Enable RAM source
            ram_address <= cu_instruction[11:4];
        end
    endtask

    //==========================================================================
    // Task: LOAD Constant from Program Memory to CU Output
    // Opcode: 1101_DDDDDDDD_0000
    //==========================================================================
    task LOAD;
        begin
            alu_register_enable <= 2'b00;
            register_write <= 1'b1;
            register_read <= 1'b0;
            register_select <= 4'b0000;
            register_enable <= 2'b00;
            ram_cu_select <= 2'b00;
            output_data <= cu_instruction[11:4];
        end
    endtask

    //==========================================================================
    // Task: SAVE CU Output or General Register Output to RAM
    // Opcode: 1110_AAAAAAAA_00SS
    //==========================================================================
    task SAVE;
        begin
            alu_register_enable <= 2'b00;
            register_write <= 1'b1;
            register_read <= 1'b0;
            ram_address <= cu_instruction[11:4];
            register_enable <= 2'b10;  // Enable RAM
            ram_cu_select <= cu_instruction[1:0];  // 01=CU, 10=General out
        end
    endtask

    //==========================================================================
    // Task: Unconditional Jump
    // Opcode: 1111_AAAAAAAA_0000
    //==========================================================================
    task jump_x;
        begin
            alu_register_enable <= 2'b00;
            register_enable <= 2'b00;
            program_counter <= cu_instruction[11:4];
        end
    endtask

    //==========================================================================
    // Task: Jump if Overflow
    //==========================================================================
    task jump_x_if_ov;
        begin
            if (overflow == 1'b1) begin
                jump_x;
            end else begin
                do_nothing;
            end
        end
    endtask

    //==========================================================================
    // Task: Jump if Underflow
    //==========================================================================
    task jump_x_if_un;
        begin
            if (underflow == 1'b1) begin
                jump_x;
            end else begin
                do_nothing;
            end
        end
    endtask

    //==========================================================================
    // Task: Jump if A == B (Same)
    //==========================================================================
    task jump_x_if_sa;
        begin
            if (AB_same == 1'b1) begin
                jump_x;
            end else begin
                do_nothing;
            end
        end
    endtask

    //==========================================================================
    // Task: Jump if A > B
    //==========================================================================
    task jump_x_if_Ab;
        begin
            if (A_bigger == 1'b1) begin
                jump_x;
            end else begin
                do_nothing;
            end
        end
    endtask

    //==========================================================================
    // Task: Jump if A < B
    //==========================================================================
    task jump_x_if_aB;
        begin
            if (B_bigger == 1'b1) begin
                jump_x;
            end else begin
                do_nothing;
            end
        end
    endtask

    //==========================================================================
    // Main Control Logic - Fetch and Execute Instructions
    // FIXED: Changed blocking assignments to non-blocking (<=) to prevent
    //        race conditions and synthesis/simulation mismatches
    //==========================================================================
    always @(posedge clk) begin
        if (enable) begin
            if (~reset) begin
                // Reset state
                cu_instruction <= {`program_data_size{1'b0}};
                alu_instruction <= {`ALU_INSTRUCTION_BUS_SIZE{1'b0}};
                alu_register_enable <= 2'b00;
                register_enable <= 2'b00;
                program_counter <= {`program_data_max_length{1'b0}};
                program_data_address <= {`program_data_max_length{1'b0}};
            end else begin
                // FIXED: Changed from blocking (=) to non-blocking (<=)
                program_counter <= program_counter + 1;
                cu_instruction <= program_data;

                // Decode and execute instruction
                casez (cu_instruction)
                    // ALU Instructions
                    `NOP: send_instruction_to_alu;
                    `ADD: send_instruction_to_alu;
                    `SUB: send_instruction_to_alu;
                    `AND: send_instruction_to_alu;
                    `OR: send_instruction_to_alu;
                    `NOT: send_instruction_to_alu;

                    // Move Operations
                    `MOV_C_regX: MOV_C_regX;
                    `MOV_regX_A: MOV_regX_X;
                    `MOV_regX_B: MOV_regX_X;
                    `MOV_ramX_AB: MOV_ramX_AB;

                    // Load/Save Operations
                    `LOAD: LOAD;
                    `SAVE: SAVE;

                    // Jump Operations
                    `jump_x: jump_x;
                    `jump_x_if_ov: jump_x_if_ov;
                    `jump_x_if_un: jump_x_if_un;
                    `jump_x_if_sa: jump_x_if_sa;
                    `jump_x_if_Ab: jump_x_if_Ab;
                    `jump_x_if_aB: jump_x_if_aB;

                    default: do_nothing;
                endcase

                // FIXED: Changed from blocking (=) to non-blocking (<=)
                program_data_address <= program_counter;
            end
        end
    end

`ifdef _DEBUG_CONTROL_UNIT_
    // Debug output for simulation
    always @(posedge clk) begin
        if (enable && reset) begin
            $display("[CU] Time=%0t PC=%0d Instruction=0x%04x",
                     $time, program_counter, cu_instruction);
        end
    end
`endif

endmodule
