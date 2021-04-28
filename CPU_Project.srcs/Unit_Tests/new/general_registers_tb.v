`timescale 1ns / 1ps

`include "params.v"

module general_registers_tb;

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
    begin
        if (data1 == data2) begin
            $display("%d == %d", data1, data2);
        end else begin
            $display("%d != %d", data1, data2);
            $display("GENERAL REGISTERS TEST FAILED!");
            $stop();
            $finish;
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
    to_memory = 2;

    write_to_register(to_memory, 0);  
    read_from_register(from_memory, 0);
    compare(to_memory, from_memory);
    $display("GENERAL REGISTERS TEST PASSED!");
    //$finish;
end



endmodule
