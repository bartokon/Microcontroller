`timescale 1ns / 1ps

`include "params.v"

module program_memory_tb;
    
//inputs
reg [`program_data_max_length-1:0] program_data_address;
reg clk;

//outputs
wire [`program_data_size-1:0] program_data;

//Helper variables
reg [`program_data_size-1:0] returned_data;
    
program_memory program_memory_DUT(
program_data_address,
program_data,
clk);
    
task change_address;
    input [`program_data_max_length-1:0] address;
    begin
        @(posedge clk) begin
            program_data_address = address;
        end
    end
endtask  
  
task read_data;
    output [`program_data_size-1:0] data;
    @(negedge clk) begin
        data = program_data;
    end
endtask  
    
    //Setup clock signal    
initial clk = 0;
always #1 clk = ~clk;

initial begin
    change_address(0);
    read_data(returned_data);
    change_address(1);
    read_data(returned_data);
    change_address(2);
    read_data(returned_data);
    #4 //wait some time
    $finish();
end

endmodule
