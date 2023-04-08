`include "instruction_mem.v"
`include "data_mem.v"
`include "adder.v"
`include "mux.v"
`include "register.v"
`include "control_unit.v"
`include "alu.v"
`include "instruction_splitter.v"

module main(clk);

    //wires instruction, rs1, rs2, r_dest, d1, d2, write_enable, write_data, data_mem_to_control_data, control_to_data_mem_data, control_to_adder_base, control_to_adder_offset, data_mem_adder_output, data_mem_write_enable, alu_to_control, control_to_alu1, control_to_alu2, alu_zero, control_branch_flag, control_pc_offset, branch_mux_select, if_branch_result, if_not_branch_result, branch_mux_result

    input clk;

    reg [15:0] pc=0;

    wire [31:0]instruction;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] r_dest;
    wire [31:0] d1;
    wire [31:0] d2;
    wire write_enable;
    wire [31:0] write_data;
    wire [31:0] data_mem_to_control_data;
    wire [31:0] control_to_data_mem_data;
    wire [31:0] control_to_adder_base;
    wire [31:0] control_to_adder_offset;
    wire [31:0] data_mem_adder_output;
    wire data_mem_write_enable;
    wire [31:0] alu_to_control;
    wire [31:0] control_to_alu1;
    wire [31:0] control_to_alu2;

    wire alu_zero;
    wire control_branch_flag;
    wire [31:0] control_pc_offset;
    wire branch_mux_select;
    wire [31:0] if_branch_result;
    wire [31:0] if_not_branch_result;
    wire [31:0] branch_mux_result;


    instruction_memory uut1(pc, instruction);

    instruction_split uut2(instruction, rs1, rs2, r_dest);

    register uut3(rs1, rs2, r_dest, write_enable , write_data, d1, d2, pc);

    control_unit uut4(instruction, d1, d2, write_data, write_enable, control_to_alu1, control_to_alu2, alu_to_control,control_branch_flag,control_pc_offset,  data_mem_write_enable, control_to_adder_base, control_to_adder_offset, data_mem_to_control_data, control_to_data_mem_data);

    adder uut5_data_mem(control_to_adder_offset, control_to_adder_base, data_mem_adder_output);

    data_memory uut6(data_mem_adder_output, data_mem_adder_output, data_mem_write_enable , control_to_data_mem_data, data_mem_to_control_data);

    alu uut7(instruction, control_to_alu1, control_to_alu2, alu_to_control, alu_zero);

    and uut8(branch_mux_select,control_branch_flag, alu_zero );

    adder uut9_jump(if_not_branch_result, control_pc_offset , if_branch_result);

    wire [31:0] one;
    assign one=32'b1;
    wire [31:0] pc_32_bit;
    assign pc_32_bit={16'b0,pc};

    adder uut10_not_jump(one, pc_32_bit , if_not_branch_result);

    mux  uut11(if_not_branch_result, control_pc_offset, branch_mux_select, branch_mux_result);
    
    // initial begin
    //     forever #10 $display("%d\n", instruction);
    // end


    always @(posedge clk) begin
        pc=branch_mux_result;
    end

    // initial begin
    //     #4;
    //     forever begin
    //          $display( "pc: %d",pc);
    //         #20;
    //     end
    // end
    // initial begin
    //     #100 $finish;
    // end

endmodule
