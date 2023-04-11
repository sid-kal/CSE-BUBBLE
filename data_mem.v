module data_memory( read_address, write_address, write_enable , data_in, data_out );

        input [31:0] data_in;
        input write_enable;
        input [31:0]write_address;
        input [31:0]read_address;

        output [31:0] data_out;

        reg [31:0] mem [65535:0];
        integer i;
        initial begin
            // mem[0]=0;//sstores 0
            // mem[1]=11;//stores n
            // mem[2]=11;//array sytarts from here
            // mem[3]=2;
            // mem[4]=7;
            // mem[5]=9;
            // mem[6]=8;
            // mem[7]=6;
            // mem[8]=4;
            // mem[9]=5;
            // mem[10]=1;
            // mem[11]=10;
            // mem[12]=3;
            mem[0]=0;//sstores 0
            mem[1]=25;//stores n
        
        mem[2]=14;
        mem[3]= 23;
        mem[4]= 8;
        mem[5]= 12;
        mem[6]= 2;
        mem[7]= 16;
        mem[8]= 9;
        mem[9]= 1;
        mem[10]= 6;
        mem[11]= 19;
        mem[12]= 22;
        mem[13]= 20;
        mem[14]= 17;
        mem[15]= 13;
        mem[16]= 24;
        mem[17]= 7;
        mem[18]= 5;
        mem[19]= 10;
        mem[20]= 25;
        mem[21]= 4;
        mem[22]= 11;
        mem[23]= 18;
        mem[24]= 3;
        mem[25]= 21;
        mem[26]= 15;


        end

        always @(*) begin
            
            if(write_enable && write_address<=65535) begin
                mem[write_address]=data_in;
            end
            
        end

        assign data_out=(read_address<=65535)?mem[read_address]:0;

        initial begin
            
            #90000 
            for(i=0;i<25;i=i+1) $display("%d", mem[i+2]);
        end

endmodule