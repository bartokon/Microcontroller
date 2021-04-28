`timescale 1ns / 1ps

`include "params.v"

module cu_ram(address, 
data_out,
data_in,
write,
read,
enable,
clk,
reset
    );
    
    //inputs
    input wire [`ram_addres_bus_size-1:0] address;
    input wire write, read, clk, reset;
    input wire [`operand_size-1:0] data_in;
    input wire enable;
    //outputs
    output reg [`operand_size-1:0] data_out;
    
    //internal memory
    reg [`operand_size-1:0] internal_memory [`ram_addres_bus_size-1:0];
   
function integer get_ram_size;
            input integer address_size;      
            begin
                get_ram_size = 2^(address_size-1);  
            end 
endfunction

    //Clear memory
    always @(posedge clk) begin      
        if (~reset) begin: clear_regs
            integer i;            
            for (i = 0; i < get_ram_size(`ram_addres_bus_size); i = i + 1) begin
                internal_memory[i] = {`operand_size{1'b0}};               
            end     
        end 
    end

    always @(negedge clk) begin
        if (enable) begin 
                if(read & ~write) begin
                    data_out = internal_memory[address];      
                end else if (write & ~read) begin
                    internal_memory[address] = data_in;
                end else begin
                    data_out = {`operand_size{1'bz}};   
                end
        end   
    end
    
endmodule
