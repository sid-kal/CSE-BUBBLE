`include "main.v"

module tb();

    reg clk;
    wire [31:0] instruction;
    wire [15:0] pc;
    main uut(clk, pc, instruction);
    initial begin
        clk=0;
    end
    initial begin
        forever begin
            #10 clk=~clk;
        end
    end



    initial begin
        $dumpfile("main_tb.vcd");
        $dumpvars(0, tb);
        #2000000 $finish;
    end

endmodule