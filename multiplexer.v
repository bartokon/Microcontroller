`timescale 1ns / 1ps

`include "params.v"

module multiplexer(
    sel,
    in1,
    in2,
    outpt,
    );
    
    input wire [1:0] sel;
    input wire [`operand_size-1:0] in1;
    input wire [`operand_size-1:0] in2;
    output reg [`operand_size-1:0] outpt;
    always @(*) begin
        case (sel)
            2'b00: outpt <= 0;           
            2'b01: outpt <= in1;
            2'b10: outpt <= in2;
            2'b11: outpt <= {`operand_size{1'b1}};
        endcase    
    end
    
endmodule
