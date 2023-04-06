module data_memory( read_address, write_address, write_enable , data_in, data_out );

        input [31:0] data_in;
        input write_enable;
        input [31:0]write_address;
        input [31:0]read_address;

        output [31:0] data_out;

        reg [31:0] mem [65535:0];

        always @(*) begin
            
            if(write_enable && write_address<=65535) begin
                mem[write_address]=data_in;
            end
            
        end

        assign data_out=(read_address<=65535)?mem[read_address]:0;

endmodule