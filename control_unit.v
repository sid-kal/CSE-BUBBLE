module control_unit(instruction, regin1, regin2, regout, write_enable, aluout1, aluout2, aluin,branch,offset,  data_mem_write_enable, data_mem_base_address, data_mem_offset, data_mem_read_data, data_mem_write_data);

    input [31:0] instruction;
    input [31:0] regin1;
    input [31:0] regin2;
    input [31:0] data_mem_read_data;
    input [31:0] aluin;

    output [31:0] aluout1;
    output [31:0] aluout2;
    output branch;
    output write_enable;
    output [31:0] offset;
    output data_mem_write_enable;
    output [31:0] data_mem_base_address;
    output [31:0] data_mem_offset;
    output [31:0] data_mem_write_data;
    output [31:0] regout;


    wire [5:0]x = instruction[31:26];

    assign aluout1=regin1;
    assign aluout2=(x==4 || x==5 || x==8 || x==9 || x==10 || x==11 || x==24)?instruction[15:0]:regin2;
    assign offset=(x==20 || x==22)?instruction[20:0]:((x==21)?regin1: instruction[10:0]);//note this offset is not suitable for all jump operations
    assign regout=(x==12)?data_mem_read_data: aluin;
    assign data_mem_base_address=(x==12)?regin1:regin2;
    assign data_mem_write_data=regin1;
    assign data_mem_offset=x==12?instruction[15:0]: instruction[10:0];
    assign branch=( x==14 || x==15 || x==16 || x==17 || x==18 || x==19 || x==20 || x==21 || x==22)?1:0;
    assign write_enable=(x==13 || x==14 || x==15 || x==16 || x==17 || x==18 || x==19)?0:1;
    assign data_mem_write_enable=(x==13)?1:0;



endmodule