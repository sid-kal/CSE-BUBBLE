module register( read_address1, read_address2, write_address, write_enable , data_in, data_out1, data_out2 );

        input [31:0] data_in;
        input write_enable;
        input [4:0]write_address;
        input [4:0]read_address1;
        input [4:0]read_address2;

        output [31:0] data_out1;
        output [31:0] data_out2;

        reg [31:0] mem [23:0]; 

        initial begin
            mem[0]=2;
            mem[1]=3;
            mem[2]=4;
            mem[3]=5;
            mem[4]=6;
            mem[5]=7;
            mem[6]=8;
            mem[7]=9;
            mem[8]=10;
            mem[9]=11;
            mem[10]=12;
            mem[11]=13;
            mem[12]=14;
            mem[13]=15;
            mem[14]=16;
        end

        always @(*) begin
            
            if(write_enable && write_address<=23) begin
                mem[write_address]=data_in;
            end
            
        end

        assign data_out1=(read_address1<=23)?mem[read_address1]:0;
        assign data_out2=(read_address2<=23)?mem[read_address2]:0;


    // initial begin
    //         #90 $display("2=%d, 5=%d, 8=%d, 11=%d", mem[2], mem[5], mem[8], mem[11]);
    //     //2->5   5-> 1   8->17  11->1 
    // end


endmodule