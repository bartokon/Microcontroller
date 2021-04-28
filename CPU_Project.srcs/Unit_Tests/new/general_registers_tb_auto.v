`timescale 1ns / 1ps

`include "params.v"

//random_data_count => number of random number to be send to mem and recieved
module general_registers_tb_auto#(parameter random_data_count = 32);

//Inputs
reg [`operand_size-1:0] data_in; 
reg [`number_of_registers-1:0] select_reg;

//Outputs
wire [`operand_size-1:0] data_out;

//Control signals
reg enable;
reg read;
reg write;
reg clk;
reg reset;

//Helper variables
reg signed [`operand_size-1:0] to_memory;
reg signed [`operand_size-1:0] from_memory;

general_registers general_registers_DUT(
     data_in,
     data_out,
     read,
     write,
     select_reg,
     enable,
     clk,
     reset);

task write_to_register;
    input [`operand_size-1:0] data;
    input [`number_of_registers-1:0] register_number;
    begin
        @(posedge clk) begin //Data is ready from alu
            data_in = data;
            select_reg = register_number;
            read = 0;
            write = 1;
        end                 
    end
endtask

task read_from_register;
    output [`operand_size-1:0] data;
    input [`number_of_registers-1:0] register_number;
    begin
        @(posedge clk) begin //Control unit sends new command
            write = 0;
            read = 1;
            select_reg = register_number;
        end
        @(posedge clk) begin //Alu register read new data
            data = data_out;
        end                                      
    end
endtask

task compare;
    input [`operand_size-1:0] data1;
    input [`operand_size-1:0] data2;
    input [`number_of_registers-1:0] register; 
    begin
        if (data1 == data2) begin
            `ifdef _DEBUG_GENERAL_REGISTERS_
                $display("%d == %d", data1, data2);
            `endif            
        end else begin
            $display("TEST FAILED!");
            $display("Register nb: %d, FAILED", register);
            $display("%d != %d", data1, data2);
            $stop();
            $finish();
        end
    end
endtask

//Setup clock signal    
initial clk = 0;
always #1 clk = ~clk;
//Setup reset
initial reset = 0; //Reset alu at first clock cycle
//Enable module
initial enable = 1;

initial begin
    #8 reset = 1;

    
    for (integer i = 0; i < random_data_count; i = i + 1) begin
        for (integer register = 0; register < `number_of_registers; register = register + 1) begin
            to_memory = i;
            write_to_register(to_memory, register);  
            read_from_register(from_memory, register);
            compare(to_memory, from_memory, register);
        end
    end
    
    $display("GENERAL REGISTERS TEST PASSED!");
    //$finish;
end



endmodule

