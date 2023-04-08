module register( read_address1, read_address2, write_address, write_enable , data_in, data_out1, data_out2 , pc);

        input [31:0] data_in;
        input write_enable;
        input [4:0]write_address;
        input [4:0]read_address1;
        input [4:0]read_address2;
        input [15:0]pc;
        output [31:0] data_out1;
        output [31:0] data_out2;

        reg [31:0] mem [31:0]; 

        integer i;
        initial begin
            for (i = 0; i<32; i=i+1) begin
                mem[i]=0;
            end
        end

        always @(pc) begin
                if(write_enable) begin
                     mem[write_address]=data_in;
                end
            
        end

        assign data_out1=(read_address1<=23)?mem[read_address1]:0;
        assign data_out2=(read_address2<=23)?mem[read_address2]:0;


    initial begin
          #5    $display("%d", mem[14]);
          #20   $display("%d", mem[14]);
          #20   $display("%d", mem[14]);
          #20   $display("%d", mem[14]);
          #20   $display("%d", mem[14]);
          #20   $display("%d", mem[14]);
    end


endmodule