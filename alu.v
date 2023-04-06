module alu(instruction, a, b, c, zero);


    input [31:0] instruction;
    input [31:0] a;
    input [31:0] b;
    output [31:0] c;
    output zero;
    reg zero_temp;
    reg [31:0] c_temp;

    assign c=c_temp;
    assign zero=zero_temp;

    always @* begin

        if(instruction[31:26]==0) c_temp=a+b;
        if(instruction[31:26]==1) c_temp=a-b;
        if(instruction[31:26]==2) c_temp=a+b;
        if(instruction[31:26]==3) c_temp=a-b;
        if(instruction[31:26]==4) c_temp=a+b;
        if(instruction[31:26]==5) c_temp=a+b;

        if(instruction[31:26]==6) c_temp=a & b;
        if(instruction[31:26]==7) c_temp=a | b;
        if(instruction[31:26]==8) c_temp=a & b;
        if(instruction[31:26]==9) c_temp=a | b;
        if(instruction[31:26]==10) c_temp=a << b;
        if(instruction[31:26]==11) c_temp=a >> b;

        if(instruction[31:26]==12) c_temp=1;
        if(instruction[31:26]==13) c_temp=1;

        if(instruction[31:26]==14) c_temp=(a!=b);
        if(instruction[31:26]==15) c_temp= (a == b);
        if(instruction[31:26]==16) c_temp=(a<=b);
        if(instruction[31:26]==17) c_temp=(a<b);
        if(instruction[31:26]==18) c_temp=(a>=b);
        if(instruction[31:26]==19) c_temp=(a>b);

        if(instruction[31:26]==20) c_temp=0;
        if(instruction[31:26]==21) c_temp=0;
        if(instruction[31:26]==22) c_temp=0;

        if(instruction[31:26]==23) c_temp=(a<b)?1:0;
        if(instruction[31:26]==24) c_temp=(a<b)?1:0;

        zero_temp=(c_temp==0)?1:0;
    end


endmodule