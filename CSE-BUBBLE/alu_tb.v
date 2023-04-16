`include "alu.v"

module tb();


    reg [31:0] instruction, a, b;
    wire[31:0] c;
    wire zero;
    alu uut(instruction, a, b, c, zero);

    initial begin
        a=2;
        b=1;
        instruction=32'b000000_00000000000000000000000000;
    
    end
    initial begin
        $monitor("%d, %d, %d, %d", a, b, instruction, c);
        #1000 $finish;
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, tb);
    end
endmodule