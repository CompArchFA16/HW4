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

  wire[31:0] DecoderOut;
  decoder1to32 WriteDecoder(DecoderOut, RegWrite, WriteRegister);

  wire[31:0] RegOut[31:0];
  register32zero Register0(RegOut[0], WriteData, DecoderOut[0], Clk);
  register32 Register1(RegOut[1], WriteData, DecoderOut[1], Clk);
  register32 Register2(RegOut[2], WriteData, DecoderOut[2], Clk);
  register32 Register3(RegOut[3], WriteData, DecoderOut[3], Clk);
  register32 Register4(RegOut[4], WriteData, DecoderOut[4], Clk);
  register32 Register5(RegOut[5], WriteData, DecoderOut[5], Clk);
  register32 Register6(RegOut[6], WriteData, DecoderOut[6], Clk);
  register32 Register7(RegOut[7], WriteData, DecoderOut[7], Clk);
  register32 Register8(RegOut[8], WriteData, DecoderOut[8], Clk);
  register32 Register9(RegOut[9], WriteData, DecoderOut[9], Clk);
  register32 Register10(RegOut[19], WriteData, DecoderOut[10], Clk);
  register32 Register11(RegOut[11], WriteData, DecoderOut[11], Clk);
  register32 Register12(RegOut[12], WriteData, DecoderOut[12], Clk);
  register32 Register13(RegOut[13], WriteData, DecoderOut[13], Clk);
  register32 Register14(RegOut[14], WriteData, DecoderOut[14], Clk);
  register32 Register15(RegOut[15], WriteData, DecoderOut[15], Clk);
  register32 Register16(RegOut[16], WriteData, DecoderOut[16], Clk);
  register32 Register17(RegOut[17], WriteData, DecoderOut[17], Clk);
  register32 Register18(RegOut[18], WriteData, DecoderOut[18], Clk);
  register32 Register19(RegOut[19], WriteData, DecoderOut[19], Clk);
  register32 Register20(RegOut[20], WriteData, DecoderOut[20], Clk);
  register32 Register21(RegOut[21], WriteData, DecoderOut[21], Clk);
  register32 Register22(RegOut[22], WriteData, DecoderOut[22], Clk);
  register32 Register23(RegOut[23], WriteData, DecoderOut[23], Clk);
  register32 Register24(RegOut[24], WriteData, DecoderOut[24], Clk);
  register32 Register25(RegOut[25], WriteData, DecoderOut[25], Clk);
  register32 Register26(RegOut[26], WriteData, DecoderOut[26], Clk);
  register32 Register27(RegOut[27], WriteData, DecoderOut[27], Clk);
  register32 Register28(RegOut[28], WriteData, DecoderOut[28], Clk);
  register32 Register29(RegOut[29], WriteData, DecoderOut[29], Clk);
  register32 Register30(RegOut[30], WriteData, DecoderOut[30], Clk);
  register32 Register31(RegOut[31], WriteData, DecoderOut[31], Clk);

  mux32to1by32 ReadMultiplexer1(ReadData1, ReadRegister1,
                                RegOut[0], RegOut[1], RegOut[2], RegOut[3], RegOut[4], RegOut[5], RegOut[6], RegOut[7],
                                RegOut[8], RegOut[9], RegOut[10], RegOut[11], RegOut[12], RegOut[13], RegOut[14], RegOut[15],
                                RegOut[16], RegOut[17], RegOut[18], RegOut[19], RegOut[20], RegOut[21], RegOut[22], RegOut[23],
                                RegOut[24], RegOut[25], RegOut[26], RegOut[27], RegOut[28], RegOut[29], RegOut[30], RegOut[31]);
  mux32to1by32 ReadMultiplexer2(ReadData2, ReadRegister2,
                                RegOut[0], RegOut[1], RegOut[2], RegOut[3], RegOut[4], RegOut[5], RegOut[6], RegOut[7],
                                RegOut[8], RegOut[9], RegOut[10], RegOut[11], RegOut[12], RegOut[13], RegOut[14], RegOut[15],
                                RegOut[16], RegOut[17], RegOut[18], RegOut[19], RegOut[20], RegOut[21], RegOut[22], RegOut[23],
                                RegOut[24], RegOut[25], RegOut[26], RegOut[27], RegOut[28], RegOut[29], RegOut[30], RegOut[31]);

endmodule
