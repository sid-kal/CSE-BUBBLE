`include "main.v"

module tb();

    reg clk;

    main uut(clk);
    initial begin
        clk=0;
    end
    initial begin
        forever begin
            #10 clk=~clk;
        end
    end



    initial begin
        #100000 $finish;
        $dumpfile("main_tb.vcd");
        $dumpvars(0, tb);
    end

endmodule