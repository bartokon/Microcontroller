`timescale 1ns / 1ps

`include "params.v"

//Read only program memory
module program_memory(
program_data_address,
program_data,
clk);
    
    //inputs
    input wire [`program_data_max_length-1:0] program_data_address;
    input wire clk;
    
    //outputs
    output reg [`program_data_size-1:0] program_data;
    
    //Internal memory -> will be programed by axi
    reg [`program_data_size-1:0] internal_program_data [255:0]; // 255 = 8 addr bit
    
    //BYTHE WIDTH!
    initial begin
        internal_program_data[0] = `NOP;
        internal_program_data[1] = `instruction_size'b1101_0000_0001_0000; //LOAD constant 0000_0001 to cu_output
        internal_program_data[2] = `instruction_size'b1110_0000_0000_0001; //Save cu_output to ram addr 0
        internal_program_data[3] = `instruction_size'b1101_0000_0010_0000; //LOAD constant 0000_0010 to cu_output
        internal_program_data[4] = `instruction_size'b1110_0000_0001_0001; //Save cu_output to ram addr 1
        internal_program_data[5] = `instruction_size'b1100_0000_0000_0001; //Move ram addr 0 to A
        internal_program_data[6] = `instruction_size'b1100_0000_0001_0010; //Move ram addr 1 to B
        internal_program_data[7] = `instruction_size'b0001_0000_0000_0000; //ALU add
        internal_program_data[8] = `instruction_size'b1000_0000_0000_0000; //Save ALU out to reg 0
        internal_program_data[9] = `instruction_size'b1000_0000_0000_0001; //Save ALU out to reg 1
        internal_program_data[10] = `instruction_size'b1001_0000_0000_0000; //Mov reg 0 to A
        internal_program_data[11] = `instruction_size'b1010_0000_0000_0000; //Mov reg 0 to B
        internal_program_data[12] = `instruction_size'b1111_0001_0000_0000; //Jump to instruction [16]
        // 1 + 1 + 1 + 1 program
        internal_program_data[16] = `instruction_size'b1101_0000_0000_0000; //LOAD constant 0000_0000 to cu_output
        internal_program_data[17] = `instruction_size'b1110_0000_0000_0001; //Save cu_output to ram addr 0
        internal_program_data[18] = `instruction_size'b1110_0000_0001_0001; //Save cu_output to ram addr 1
        internal_program_data[19] = `instruction_size'b1101_0000_0001_0000; //LOAD constant 0000_0001 to cu_output
        internal_program_data[20] = `instruction_size'b1110_0000_0000_0001; //Save cu_output to ram addr 0
        internal_program_data[21] = `instruction_size'b1100_0000_0000_0001; //Move ram addr 0 to A
        internal_program_data[22] = `instruction_size'b1100_0000_0001_0010; //Move ram addr 1 to B
        internal_program_data[23] = `instruction_size'b0001_0000_0000_0000; //ALU add
        internal_program_data[24] = `instruction_size'b1000_0000_0000_0000; //Save ALU out to reg 0
        internal_program_data[25] = `instruction_size'b1010_0000_0000_0000; //Mov reg 0 to B       
        internal_program_data[26] = `instruction_JUMP_OV(50); //Jump if OV
        internal_program_data[27] = `instruction_size'b1111_0001_0111_0000; //Jump to instruction [23]
        // 2+2+2+2 program defines
        internal_program_data[50] = `instruction_LOAD(0); //LOAD constant 0 to cu_output
        internal_program_data[51] = `instruction_SAVE_CU(0); //Save cu_output to ram addr 0
        internal_program_data[52] = `instruction_SAVE_CU(1); //Save cu_output to ram addr 1
        internal_program_data[53] = `instruction_MOV_ramX_A1orB2(0, 1); //Move ram addr 0 to A
        internal_program_data[54] = `instruction_MOV_ramX_A1orB2(0, 2); //Move ram addr 1 to B
        internal_program_data[55] = `ADD;
        internal_program_data[56] = `instruction_MOV_C_regX(0); //Save alu output to reg0
        internal_program_data[57] = `instruction_MOV_C_regX(1);
        //All cleared
        internal_program_data[58] = `instruction_LOAD(1); //LOAD constant 0 to cu_output
        internal_program_data[59] = `instruction_SAVE_CU(8); //Save cu_output to ram addr 1
        internal_program_data[60] = `instruction_MOV_ramX_A1orB2(8, 1); //Move ram addr 8 to A
        internal_program_data[61] = `instruction_MOV_ramX_A1orB2(8, 2); //Move ram addr 8 to B
        internal_program_data[62] = `ADD;
        internal_program_data[63] = `instruction_MOV_C_regX(0);
        internal_program_data[64] = `instruction_MOV_regX_B(0);      
        internal_program_data[65] = `ADD;
        internal_program_data[66] = `instruction_JUMP_OV(0);
        internal_program_data[67] = `instruction_JUMP(63);
    end

    
    always @(negedge clk)begin      
        program_data = internal_program_data[program_data_address];        
    end
endmodule
