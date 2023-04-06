// module control_unit(instruction, regin1, regin2, regout, write_enable, aluout1, aluout2, aluin,branch,offset,  
// data_mem_write_enable, data_mem_base_address, data_mem_offset, data_mem_read_data, data_mem_write_data);

//     input instruction[31:0];
    
//     always @* begin
//         write_enable=0;
//         data_mem_write_enable=0;
//         if(instruction[31:25]==0) begin
//         aluout1=regin1;
//         aluout2=regin2;
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==1) begin
//             aluout1=regin1;
//             aluout2=regin2;
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==2) begin
//             aluout1=regin1;
//             aluout2=regin2;
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==3) begin
//             aluout1=regin1;
//             aluout2=regin2;
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==4) begin
//             aluout1=regin1;
//             aluout2=instruction[15:0];
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==5) begin
//             aluout1=regin1;
//             aluout2=instruction[15:0];
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==6) begin
//             aluout1=regin1;
//             aluout2=regin2;
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==7) begin
//             aluout1=regin1;
//             aluout2=regin2;
//             regout=aluin;   
//             branch=0;        
//             write_enable=1; 
//         end
//         if(instruction[31:25]==8) begin
//             aluout1=regin1;
//             aluout2=instruction[15:0];
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==9) begin
//             aluout1=regin1;
//             aluout2=instruction[15:0];
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==10) begin
//             aluout1=regin1;
//             aluout2=instruction[15:0];
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==11) begin
//             aluout1=regin1;
//             aluout2=instruction[15:0];
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         if(instruction[31:25]==12) begin
//             data_mem_base_address=regin1;
//             data_mem_offset=instruction[15:0];
//             regout=data_mem_read_data;
//             write_enable=1;
//         end
//         if(instruction[31:25]==13) begin
//             data_mem_write_data=regin1;
//             data_mem_base_address=regin2;
//             data_mem_offset={instruction[19:15],instruction[10:0]};
//             data_mem_write_enable=1;

//         end
//         if(instruction[31:25]==14) begin
//             aluout1=regin1;
//             aluout2=regin2;
//             branch=1;
//             offset={instruction[24:20], instruction[15:0]};
//         end
//         if(instruction[31:25]==15) begin
//             aluout1=regin1;
//             aluout2=regin2;  
//             branch=1; 
//             offset={instruction[24:20], instruction[15:0]};
//         end
//         if(instruction[31:25]==16) begin
//             aluout1=regin1;
//             aluout2=regin2;  
//             branch=1;    
//             offset={instruction[24:20], instruction[15:0]};
//         end
//         if(instruction[31:25]==17) begin
//             aluout1=regin1;
//             aluout2=regin2; 
//             branch=1;  
//             offset={instruction[24:20], instruction[15:0]};     
//         end
//         if(instruction[31:25]==18) begin
//             aluout1=regin1;
//             aluout2=regin2;
//             branch=1;   
//             offset={instruction[24:20], instruction[15:0]};
//         end
//         if(instruction[31:25]==19) begin
//             aluout1=regin1;
//             aluout2=regin2   
//             branch=1;   
//             offset={instruction[24:20], instruction[15:0]}; 
//         end
//         if(instruction[31:25]==20) begin
//             branch=1;
//             offset=instruction[25:0];
//         end
//         // else if(instruction[31:25]==21) begin
//         //     branch=1;
//         //     offset=instruction[25:0];
//         // end
//         // else if(instruction[31:25]==22) begin
//         //     branch=1;
//         // end
//         if(instruction[31:25]==23) begin
//             aluout1=regin1;
//             aluout2=regin2;
//             regout=aluin;
//             branch=0;
//             write_enable=1;
//         end
//         // if(instruction[31:25]==24) begin
//         //     branch=0;
//         // end
//         write_enable=0;
//         data_mem_write_enable=0;
//     end

// endmodule


module control_unit(instruction, regin1, regin2, regout, write_enable, aluout1, aluout2, aluin,branch,offset,  data_mem_write_enable, data_mem_base_address, data_mem_offset, data_mem_read_data, data_mem_write_data);

    input [31:0] instruction;
    input [31:0] regin1;
    input [31:0] regin2;
    output [31:0] regout;
    output write_enable;
    output [31:0] aluout1;
    output [31:0] aluout2;
    input [31:0] aluin;
    output branch;
    output [31:0] offset;
    output data_mem_write_enable;
    output [31:0] data_mem_base_address;
    output [31:0] data_mem_offset;
    output [31:0] data_mem_write_data;
    input [31:0] data_mem_read_data;


    wire [5:0]x = instruction[31:26];


    assign data_mem_write_enable=0;
    assign aluout1=regin1;
    assign aluout2=(x==4 || x==5 || x==8 || x==9 || x==10 || x==11 || x==24)?instruction[15:0]:regin2;
    assign offset=(x==20 || x==22)?instruction[25:0]:((x==21)?regin1:{instruction[25:21], instruction[15:0]});//note this offset is not suitable for all jump operations
    assign regout=(x==12)?data_mem_read_data: aluin;
    assign data_mem_base_address=regin1;
    assign data_mem_write_data=regin2;
    assign data_mem_offset=instruction[15:0];
    assign branch=( x==14 || x==15 || x==16 || x==17 || x==18 || x==19 || x==20 || x==21 || x==22)?1:0;
    assign write_enable=(x==13 || x==14 || x==15 || x==16 || x==17 || x==18 || x==19)?0:1;
    assign data_mem_write_enable=(x==13)?1:0;

    // always @* begin

        // if(instruction[31:25]==0) begin
        // end
        // if(instruction[31:25]==1) begin
        // end
        // if(instruction[31:25]==2) begin
        // end
        // if(instruction[31:25]==3) begin
        // end
        // if(instruction[31:25]==4) begin
        // end
        // if(instruction[31:25]==5) begin
        // end
        // if(instruction[31:25]==6) begin
        // end
        // if(instruction[31:25]==7) begin
        // end
        // if(instruction[31:25]==8) begin
        // end
        // if(instruction[31:25]==9) begin
        // end
        // if(instruction[31:25]==10) begin
        // end
        // if(instruction[31:25]==11) begin
        // end
        // if(instruction[31:25]==12) begin
        // end
        // if(instruction[31:25]==13) begin
        // end
        // if(instruction[31:25]==14) begin
        // end
        // if(instruction[31:25]==15) begin
        // end
        // if(instruction[31:25]==16) begin
        // end
        // if(instruction[31:25]==17) begin
        // end
        // if(instruction[31:25]==18) begin
        // end
        // if(instruction[31:25]==19) begin
        // end
        // if(instruction[31:25]==20) begin
        //     branch=1;
        //     offset=instruction[25:0];
        // end
        // else if(instruction[31:25]==21) begin
        //     branch=1;
        //     offset={instruction[25:21]+instruction[15:0]};
        // end
        // else if(instruction[31:25]==22) begin
        //     branch=1;
        // end
        // if(instruction[31:25]==23) begin
        // end
        // // if(instruction[31:25]==24) begin
        // //     branch=0;
        // // end

    // end


endmodule