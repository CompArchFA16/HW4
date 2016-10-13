// 32 bit decoder with enable signal
//   enable=0: all output bits are 0
//   enable=1: out[address] is 1, all other outputs are 0
module decoder1to32
(
output[31:0]	out,
input		enable,
input[4:0]	address
);

    assign out = enable<<address;

endmodule

/* This decoder (1 to 32, with a 5 bit address), has the output assigned to the


Shift operators require two operands. The operand before the operator contains
data to be shifted and the operand after the operator contains the number of
single bit shift operations to be performed. 0 is being used to fill the blank
 positions.

*/
