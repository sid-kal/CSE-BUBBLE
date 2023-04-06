module mux(input_1, input_2, select, output_value);

parameter  N=32;

input [N-1:0] input_1;
input [N-1:0] input_2;
input select;
output [N-1:0] output_value;

assign output_value=(select)? input_2: input_1;

endmodule