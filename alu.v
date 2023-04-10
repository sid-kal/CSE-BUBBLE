module alu(instruction, a, b, c, zero);


    input [31:0] instruction;
    input [31:0] a;
    input [31:0] b;
    output [31:0] c;
    output zero;

    wire [31:0] values[24:0];

        assign values[0]= a+b;
        assign values[1]= a-b;
        assign values[2]= a+b;
        assign values[3]= a-b;
        assign values[4]= a+b;
        assign values[5]= a+b;

        assign values[6]= a & b;
        assign values[7]= a | b;
        assign values[8]= a & b;
        assign values[9]= a | b;
        assign values[10]=a << b;
        assign values[11]=a >> b;

        assign values[12]=1;
        assign values[13]=1;

        assign values[14]=(a!=b);
        assign values[15]= (a == b);
        assign values[16]=(a<=b);
        assign values[17]=(a<b);
        assign values[18]=(a>=b);
        assign values[19]=(a>b);

        assign values[20]=0;
        assign values[21]=0;
        assign values[22]=0;

        assign values[23]=(a<b)?1:0;
        assign values[24]=(a<b)?1:0;

        assign zero=(values[instruction[31:26]]==0)?1:0;

        assign c=values[instruction[31:26]];


endmodule