//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "decoders.v" // Import all the modules I have written for this lab
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

wire[31:0] decoder_out; // instantiate a variable for the decoder output
wire[31:0] register0, register1, register2, register3, register4, register5, register6, register7, register8, register9, register10, register11, register12, register13, register14, register15, register16, register17, register18, register19, register20, register21, register22, register23, register24, register25, register26, register27, register28, register29, register30, register31; // instantiate variables for the values held by each register

  decoder1to32 decoder (decoder_out, RegWrite, WriteRegister); // decoder module with inputs from the regfile module

  register32zero reg0(register0, WriteData, decoder_out[0], Clk); // set firstregister to 0
  register32 reg1(register1, WriteData, decoder_out[1], Clk); // set the enabled register to the 32bit value of WriteData
  register32 reg2(register2, WriteData, decoder_out[2], Clk);
  register32 reg3(register3, WriteData, decoder_out[3], Clk);
  register32 reg4(register4, WriteData, decoder_out[4], Clk);
  register32 reg5(register5, WriteData, decoder_out[5], Clk);
  register32 reg6(register6, WriteData, decoder_out[6], Clk);
  register32 reg7(register7, WriteData, decoder_out[7], Clk);
  register32 reg8(register8, WriteData, decoder_out[8], Clk);
  register32 reg9(register9, WriteData, decoder_out[9], Clk);
  register32 reg10(register10, WriteData, decoder_out[10], Clk);
  register32 reg11(register11, WriteData, decoder_out[11], Clk);
  register32 reg12(register12, WriteData, decoder_out[12], Clk);
  register32 reg13(register13, WriteData, decoder_out[13], Clk);
  register32 reg14(register14, WriteData, decoder_out[14], Clk);
  register32 reg15(register15, WriteData, decoder_out[15], Clk);
  register32 reg16(register16, WriteData, decoder_out[16], Clk);
  register32 reg17(register17, WriteData, decoder_out[17], Clk);
  register32 reg18(register18, WriteData, decoder_out[18], Clk);
  register32 reg19(register19, WriteData, decoder_out[19], Clk);
  register32 reg20(register20, WriteData, decoder_out[20], Clk);
  register32 reg21(register21, WriteData, decoder_out[21], Clk);
  register32 reg22(register22, WriteData, decoder_out[22], Clk);
  register32 reg23(register23, WriteData, decoder_out[23], Clk);
  register32 reg24(register24, WriteData, decoder_out[24], Clk);
  register32 reg25(register25, WriteData, decoder_out[25], Clk);
  register32 reg26(register26, WriteData, decoder_out[26], Clk);
  register32 reg27(register27, WriteData, decoder_out[27], Clk);
  register32 reg28(register28, WriteData, decoder_out[28], Clk);
  register32 reg29(register29, WriteData, decoder_out[29], Clk);
  register32 reg30(register30, WriteData, decoder_out[30], Clk);
  register32 reg31(register31, WriteData, decoder_out[31], Clk);
  
  mux32to1by32 mux1(ReadData1, ReadRegister1, register0, register1, register2, register3, register4, register5, register6, register7, register8, register9, register10, register11, register12, register13, register14, register15, register16, register17, register18, register19, register20, register21, register22, register23, register24, register25, register26, register27, register28, register29, register30, register31);

  mux32to1by32 mux2(ReadData2, ReadRegister2, register0, register1, register2, register3, register4, register5, register6, register7, register8, register9, register10, register11, register12, register13, register14, register15, register16, register17, register18, register19, register20, register21, register22, register23, register24, register25, register26, register27, register28, register29, register30, register31);

endmodule
