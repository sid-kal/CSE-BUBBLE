module data_memory( read_address, write_address, write_enable , data_in, data_out );

        input [31:0] data_in;
        input write_enable;
        input [31:0]write_address;
        input [31:0]read_address;

        output [31:0] data_out;

        reg [31:0] mem [65535:0];

        initial begin
            // mem[0]=32'b000000_00000_00000_00000_00000_000010;
            // mem[1]=32'b000000_00000_00000_00000_00000_100001;
            // mem[2]=32'b000000_00000_00000_00000_00000_000001;

            // mem[0]=32'b000000_00010_00001_00000_00000_000000;
            // mem[1]=32'b010100_00000_00000_00000_00000_000010;
            // mem[4]=32'b000001_00101_00100_00011_00000_000000;
            // mem[5]=32'b000010_01000_00111_00110_00000_000000;
            // mem[6]=32'b000011_01011_01010_01001_00000_000000;

            mem[0]=0;
            mem[2]=2;
            mem[3]=7;
            mem[4]=9;
            mem[5]=8;
            mem[6]=6;
            mem[7]=4;
            mem[8]=5;
            mem[9]=1;
            mem[10]=10;
            mem[11]=3;



            // mem[2]=2;
            // mem[3]=8;
            // mem[4]=4;
            // mem[5]=3;
            // mem[6]=1;

            // mem[0]=0;
            // mem[2]=2;
            // mem[3]=3;
            // mem[4]=1;
        end

        always @(*) begin
            
            if(write_enable && write_address<=65535) begin
                mem[write_address]=data_in;
            end
            
        end

        assign data_out=(read_address<=65535)?mem[read_address]:0;

        initial begin
            
            $display("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d", mem[2], mem[3], mem[4], mem[5],mem[6], mem[7], mem[8], mem[9], mem[10], mem[11]);
            #50000 $display("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d", mem[2], mem[3], mem[4], mem[5],mem[6], mem[7], mem[8], mem[9], mem[10], mem[11]);
        end

endmodule