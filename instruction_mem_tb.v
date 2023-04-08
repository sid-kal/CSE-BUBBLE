`include "instruction_mem.v"
module tb();

    reg [15:0]address;
    wire [31:0] instruction;

    instruction_memory uut(address, instruction);

    initial begin
        address=0;
    end

    initial begin
        #10
        address=1;
        #10
        address=2;
        #10
        address=3;
        #10
        address=4;

    end

    initial begin
        $monitor("%d %d", address, instruction);
        #100 $finish;
        $dumpfile("instruction_mem.vcd");
        $dumpvars(0, tb);
    end

endmodule