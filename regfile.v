//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register.v"

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);


//data in the register
wire[31:0] data[31:0];

//choose register, decoder
wire[31:0] ChosenRegister;
decoder1to32 mydecoder (ChosenRegister, RegWrite, WriteRegister);

//set first reg to 0
register32zero zeroregister (data[0], WriteData, ChosenRegister[0], Clk);

//write in the rest of the data
genvar i;
generate
  for (i=1; i <32; i = i+1)
  begin : gen1
    register32 myregister (data[i], WriteData, ChosenRegister[i], Clk);
  end
endgenerate

//read all of the data...
mux32to1by32 mux0(ReadData1, ReadRegister1, data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31]);
mux32to1by32 mux1(ReadData2, ReadRegister2, data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31]);


endmodule
