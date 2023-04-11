module instruction_memory( address , instruction );

    input [15:0] address;
    output [31:0] instruction;
    reg [31:0] mem [65535:0];
    initial begin
//s0 is n, s1 is the base address of the array , s2 stores i, s3 stores j, s4 stores temp

        mem[0]=32'b001100_10000_00000_00000_00000_000000;//loads data stored in address located at t0 and stores the data in s0
        mem[1]=32'b000001_00001_10000_00000_00000_000000;//subtracts one from s0 and stores in t1
        mem[2]=32'b001110_11111_00001_10010_00000_010100;//if value stored in t1 and s2 are equal, the jumps to location 19, ie, the end
        mem[3]=32'b000001_00010_10000_10010_00000_000000;//subtracts s2 from s0 and stores in t2
        mem[4]=32'b000001_00011_00010_00000_00000_000001;//subtracts one from t2 and stores in t3
        mem[5]=32'b001100_10011_01010_00000_00000_000000;//loads data stored in address located at t10 and stores the data in s3
        mem[6]=32'b001110_11111_10011_00011_00000_010010;//if value stored in s3 and t3 are equal, then jumps to instruction 17
        mem[7]=32'b000100_00100_10011_00000_00000_000000;//moves the value of s3 to t4
        mem[8]=32'b000000_00100_00100_10001_00000_000000;//adds value of t4 and s1 and stores the result in t4
        mem[9]=32'b000100_00101_00100_00000_00000_000001;//adds 1 to t4 and stores the result in t5
        mem[10]=32'b001100_00110_00100_00000_00000_000000;//loads the value stored in address located in t4 and stores the result in t6
        mem[11]=32'b001100_00111_00101_00000_00000_000000;//loads the value stored in address located in t5 and stores the result in t7
        mem[12]=32'b010011_11111_00110_00111_00000_010000;//jumps to instruction 15 if the value stored in t6 is less than or equal to the value stored in t7
        mem[13]=32'b000100_10100_00110_00000_00000_000000;//moves t6 to s4
        mem[14]=32'b001101_11111_00111_00100_00000_000000;//stores data stored in register t7 in memory with address in register t4
        mem[15]=32'b001101_11111_10100_00101_00000_000000;//stores data stored in register s4 in memory with address stored in register t5
        mem[16]=32'b000100_10011_10011_00000_00000_000001;//adds one to register s3
        mem[17]=32'b010100_11111_00000_00000_00000_000110;//jumps to ikstruction 5
        mem[18]=32'b000100_10010_10010_00000_00000_000001;//adds one to s2
        mem[19]=32'b010100_11111_00000_00000_00000_000010;//jumps to instruction 1
        mem[20]=32'b010100_11111_00000_00000_00000_010100;//jumps to instruction 20



    end
    assign instruction=(address<=65535)?mem[address]:0;



endmodule