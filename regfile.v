`include "decoders.v"
`include "register.v"
`include "multiplexers.v"

//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

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
  
  wire[31:0] RegEnable;
  decoder1to32 decoder(RegEnable, RegWrite, WriteRegister);

  wire[31:0] RegOut[31:0];
  register32zero reg0(RegOut[0], WriteData, RegEnable[0], Clk);
  register32 reg1(RegOut[1], WriteData, RegEnable[1], Clk);
  register32 reg2(RegOut[2], WriteData, RegEnable[2], Clk);
  register32 reg3(RegOut[3], WriteData, RegEnable[3], Clk);
  register32 reg4(RegOut[4], WriteData, RegEnable[4], Clk);
  register32 reg5(RegOut[5], WriteData, RegEnable[5], Clk);
  register32 reg6(RegOut[6], WriteData, RegEnable[6], Clk);
  register32 reg7(RegOut[7], WriteData, RegEnable[7], Clk);
  register32 reg8(RegOut[8], WriteData, RegEnable[8], Clk);
  register32 reg9(RegOut[9], WriteData, RegEnable[9], Clk);
  register32 reg10(RegOut[10], WriteData, RegEnable[10], Clk);
  register32 reg11(RegOut[11], WriteData, RegEnable[11], Clk);
  register32 reg12(RegOut[12], WriteData, RegEnable[12], Clk);
  register32 reg13(RegOut[13], WriteData, RegEnable[13], Clk);
  register32 reg14(RegOut[14], WriteData, RegEnable[14], Clk);
  register32 reg15(RegOut[15], WriteData, RegEnable[15], Clk);
  register32 reg16(RegOut[16], WriteData, RegEnable[16], Clk);
  register32 reg17(RegOut[17], WriteData, RegEnable[17], Clk);
  register32 reg18(RegOut[18], WriteData, RegEnable[18], Clk);
  register32 reg19(RegOut[19], WriteData, RegEnable[19], Clk);
  register32 reg20(RegOut[20], WriteData, RegEnable[20], Clk);
  register32 reg21(RegOut[21], WriteData, RegEnable[21], Clk);
  register32 reg22(RegOut[22], WriteData, RegEnable[22], Clk);
  register32 reg23(RegOut[23], WriteData, RegEnable[23], Clk);
  register32 reg24(RegOut[24], WriteData, RegEnable[24], Clk);
  register32 reg25(RegOut[25], WriteData, RegEnable[25], Clk);
  register32 reg26(RegOut[26], WriteData, RegEnable[26], Clk);
  register32 reg27(RegOut[27], WriteData, RegEnable[27], Clk);
  register32 reg28(RegOut[28], WriteData, RegEnable[28], Clk);
  register32 reg29(RegOut[29], WriteData, RegEnable[29], Clk);
  register32 reg30(RegOut[30], WriteData, RegEnable[30], Clk);
  register32 reg31(RegOut[31], WriteData, RegEnable[31], Clk);

  mux32to1by32 mux1(ReadData1, ReadRegister1, RegOut[0], RegOut[1], RegOut[2], 
  					RegOut[3], RegOut[4], RegOut[5], RegOut[6], RegOut[7], RegOut[8], 
  					RegOut[9], RegOut[10], RegOut[11], RegOut[12], RegOut[13], RegOut[14], 
  					RegOut[15], RegOut[16], RegOut[17], RegOut[18], RegOut[19], RegOut[20], 
  					RegOut[21], RegOut[22], RegOut[23], RegOut[24], RegOut[25], RegOut[26], 
  					RegOut[27], RegOut[28], RegOut[29], RegOut[30], RegOut[31]);
  mux32to1by32 mux2(ReadData2, ReadRegister2, RegOut[0], RegOut[1], RegOut[2], 
  					RegOut[3], RegOut[4], RegOut[5], RegOut[6], RegOut[7], RegOut[8], 
  					RegOut[9], RegOut[10], RegOut[11], RegOut[12], RegOut[13], RegOut[14], 
  					RegOut[15], RegOut[16], RegOut[17], RegOut[18], RegOut[19], RegOut[20], 
  					RegOut[21], RegOut[22], RegOut[23], RegOut[24], RegOut[25], RegOut[26], 
  					RegOut[27], RegOut[28], RegOut[29], RegOut[30], RegOut[31]);

endmodule