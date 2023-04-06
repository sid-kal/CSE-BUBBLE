module instruction_memory( address , instruction );

    input [15:0] address;
    output [31:0] instruction;
    reg [31:0] mem [65535:0];
    initial begin
        mem[0]=32'b000000_00010_00001_00000_00000_000000;
        mem[1]=32'b010100_00000_00000_00000_00000_000010;
        mem[4]=32'b000001_00101_00100_00011_00000_000000;
        mem[5]=32'b000010_01000_00111_00110_00000_000000;
        mem[6]=32'b000011_01011_01010_01001_00000_000000;
    end
    assign instruction=(address<=65535)?mem[address]:0;

endmodule