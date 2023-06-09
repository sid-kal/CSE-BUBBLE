//Siddharth Kalra(211032) and Chitwan Goel 210295
module data_memory( read_address, write_address, write_enable , data_in, data_out, pc );

        input [31:0] data_in;
        input write_enable;
        input [31:0]write_address;
        input [31:0]read_address;

        output [31:0] data_out;
        input [15:0] pc;
        reg [31:0] mem [65535:0];
        integer i;
        initial begin

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

        always @(pc) begin
            
            if(write_enable && write_address<=65535) begin
                mem[write_address]=data_in;
            end
            
        end

        assign data_out=(read_address<=65535)?mem[read_address]:0;
        initial begin
	#1990000 
            $display("n = %d", mem[1]);
	$display("Sorted array is: ");
            for(i=2;i<mem[1]+2;i=i+1) $display("%d", mem[i]);
        end

endmodule