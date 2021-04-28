`timescale 1ns / 1ps

`include "params.v"

module control_unit(
    alu_instruction,
    alu_register_enable,
    register_enable,
    register_write,
    register_read,
    register_select,
    program_data,
    program_data_address,
    output_data,
    ram_address,
    overflow,
    underflow,
    A_bigger,
    B_bigger,
    AB_same,
    ram_cu_select,
    enable, clk, reset);

 //Inputs
 input wire [`program_data_size-1:0] program_data;
 input wire enable, clk, reset;
 input wire overflow, underflow, A_bigger, B_bigger, AB_same;
 
 //Outputs
 output reg [`program_data_max_length-1:0] program_data_address;
 output reg [`operand_size-1:0] output_data;
 output reg [`ram_addres_bus_size-1:0] ram_address;
 output reg [`ALU_INSTRUCTION_BUS_SIZE-1:0] alu_instruction;
 output reg [`number_of_alu_registers-1:0] alu_register_enable; 
 output reg [`number_of_registers-1:0] register_select;
 output reg register_write;
 output reg register_read;
 output reg [1:0] register_enable;
 output reg [1:0] ram_cu_select; //01 -> cu save 10 -> general save
 
 
 //Internal regs
 reg [`program_data_size-1: 0] cu_instruction;
 reg [`program_data_max_length-1:0] program_counter;
 
 task do_nothing;
    begin
        register_enable = 0;
        alu_register_enable = 2'b00;
        alu_instruction = {`ALU_INSTRUCTION_BUS_SIZE-1{1'b0}};
        output_data = {`operand_size{1'bz}};
    end
endtask
 
 
 //General task for parsing alu instructions
 task send_instruction_to_alu;   
    begin
        alu_register_enable = 2'b00;
        alu_instruction = program_data[15:12];
        register_enable = 2'b00;     
    end
 endtask
 
 //Move C to register
 task MOV_C_regX;  
    begin
        alu_register_enable = 2'b00;
        register_read = 0;
        register_write = 1;            
        register_select = cu_instruction[3:0];
        register_enable = 2'b01;   
    end
 endtask
 
 //move register X to A or B
 task MOV_regX_X;   
    begin;
        alu_register_enable = cu_instruction[13:12];   //Hot one    
        register_write = 0;  
        register_read = 1;
        register_select = cu_instruction[3:0]; 
        register_enable = 2'b01;        
    end
 endtask
 
//Mov ram data to register A or B
task MOV_ramX_AB;
    begin
        alu_register_enable = cu_instruction[1:0];   //Hot one 
        register_write = 0;  
        register_read = 1; 
        register_enable = 2'b10; // ram or cu general output    
        ram_address = cu_instruction[11:4];         
    end
endtask

//LOAD constant from program memory to CU output
task LOAD;
    begin
        alu_register_enable = 2'b00;   //Hot one
        register_write = 1;  
        register_read = 0;
        register_select = 4'b0000; 
        register_enable = 2'b00; // ram or cu general output
        ram_cu_select = 2'b00;    
        output_data = cu_instruction[11:4];
    end
endtask

//Same CU output to ram
task SAVE;
    begin
        alu_register_enable = 2'b00;   //Hot one
        register_write = 1;  
        register_read = 0;
        ram_address = cu_instruction[11:4]; 
        register_enable = 2'b10; // ram or genreg enable
        ram_cu_select = cu_instruction[1:0]; //01 -> cu save 10 -> general output
        
    end
endtask 

task jump_x;
    begin
        alu_register_enable = 2'b00;   //Hot one ; 
        register_enable = 2'b00; // ram or cu
        program_counter = cu_instruction[11:4];     
    end
endtask

task jump_x_if_ov;
    begin
        if(overflow == 1) jump_x; else do_nothing;
    end 
endtask
  
task jump_x_if_un;
    begin
        if(underflow == 1) jump_x; else do_nothing;
    end
endtask
 
task jump_x_if_sa;
    begin
        if(AB_same == 1) jump_x; else do_nothing;
    end
endtask

task jump_x_if_Ab;
    begin
        if(A_bigger == 1) jump_x; else do_nothing;
    end
endtask

task jump_x_if_aB;
    begin
        if(B_bigger == 1) jump_x; else do_nothing;
    end
endtask
 
 
 //Get next instruction from program memory
always @(posedge clk) begin
    if (enable) begin
        if (~reset) begin
            cu_instruction <= 0;
            alu_instruction <= 0;
            alu_register_enable <= 0;
            register_enable <= 0;
            program_counter <= 0;
            program_data_address <= 0;
        end else begin
            program_counter = program_counter + 1;      
            cu_instruction = program_data;                                
            casez (cu_instruction)       
                //Alu instructions
                `NOP: begin
                    send_instruction_to_alu;
                end              
                `ADD: begin
                    send_instruction_to_alu;
                end 
                `SUB: begin
                    send_instruction_to_alu;
                end
                `AND: begin
                    send_instruction_to_alu;
                end
                `OR: begin
                    send_instruction_to_alu;
                end
                `NOT: begin
                    send_instruction_to_alu;
                end        
                //MOV operations
                `MOV_C_regX: begin
                    MOV_C_regX;
                end                    
                `MOV_regX_A: begin
                    MOV_regX_X;                 
                end                      
                `MOV_regX_B: begin
                    MOV_regX_X;                 
                end           
                `MOV_ramX_AB: begin
                    MOV_ramX_AB;
                end
                //Load, Save to ram          
                `LOAD: begin
                    LOAD;
                end      
                `SAVE: begin
                    SAVE;
                end
                //Jump operations
                `jump_x: begin
                    jump_x;
                end
                `jump_x_if_ov: begin
                    jump_x_if_ov;
                end
                `jump_x_if_un: begin
                    jump_x_if_un;
                end
                `jump_x_if_sa: begin
                    jump_x_if_sa;               
                end
                `jump_x_if_Ab: begin
                    jump_x_if_Ab;              
                end
                `jump_x_if_aB: begin
                    jump_x_if_aB;
                end                                 
                default: begin
                    do_nothing;
                end             
            endcase
            program_data_address = program_counter;                                            
        end           
     end
end

//always @(negedge clk) begin
//    program_data_address = program_counter;
//end
  
  
endmodule
