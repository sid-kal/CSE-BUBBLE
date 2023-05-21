# CSE-BUBBLE
How to run the code: 
1. How to input the array to be sorted 

We store data, i.e., number of elements in the array to be sorted in “data_mem.v”, where mem[1] will store the number of elements in the array to be sorted and mem[2] onwards stores the array. Currently, we have stored a random array of 25 integers from 1 to 25 and set the number of elements as 25. 

2. How to sort the array using the code 

main.v is the complete processor verilog file, that is, the overall/top module. Thus, to sort the array, we need to run main_tb.v file using the commands: 

iverilog -o main_tb.vvp main_tb.v 

vvp main_tb.vvp 

This will print the sorted array on the console. 
