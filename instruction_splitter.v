module instruction_split(instruction, rs1, rs2, rd);

    input [31:0] instruction;

    output[4:0] rs1;
    output[4:0] rs2;
    output[4:0] rd;

    
   assign rd=instruction[25:21];
   assign rs1=instruction[20:16];
   assign rs2=instruction[15:11];


endmodule