module adder(input_1, input_2 , output_value);

parameter  N=32;

input [N-1:0] input_1;
input [N-1:0] input_2;
output [N-1:0] output_value;

assign  output_value= input_1 + input_2;

endmodule