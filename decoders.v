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

/* This decoder (1 to 32, with a 5 bit address), has the output assigned
according to a bit shifter. The enable has the data to be shifted to the left,
and the address contains the number of single bit shift operations to be
performed. Therefore the output has the enable shifted by the amount specified
in the address. This allows the output only be in powers of two, like:
00000000000000000000000000000100 (address 3), 00000000000000000000000010000000
(address 8) etc. but it selects only one register file at a time.
*/
