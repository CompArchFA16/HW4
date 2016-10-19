//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "decoders.v"
`include "mux32to1by1.v"
`include "mux32to1by32.v" 
`include "register.v"
`include "register32.v"
`include "register32zero.v" 

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

wire[31:0] decoder_out;
wire[31:0] register_out;

  decoder1to32 decoder (decoder_out, RegWrite, WriteRegister);
  register32(register_out, WriteData, decoder_out, Clk);

  assign ReadData1 = 42;
  assign ReadData2 = 42;

endmodule
