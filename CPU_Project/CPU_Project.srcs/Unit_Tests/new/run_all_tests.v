`timescale 1ns / 1ps

`include "params.v"

module run_all_tests;

    alu_tb_auto alu_test();
    general_registers_tb_auto general_registers_test();
    control_unit_tb_auto control_unit_test();

endmodule
