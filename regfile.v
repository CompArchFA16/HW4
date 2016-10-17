`include "decoders.v"
`include "register.v"

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
   wire[31:0] RegOut[31:0];

   decoder1to32 decoder_132(DecoderOut, RegWrite, WriteRegister);
   register32zero register_320(RegOut[0], WriteData, DecoderOut[0], Clk);

   // for loop constructed with help from Kathryn Hite
   generate
   genvar i;
   for (i=1; i<32; i=i+1) begin: loop
      register32 register_32(RegOut[i], WriteData, DecoderOut[i], Clk);
   end
   endgenerate

   mux32to1by32 mux1(ReadData1, ReadRegister1, RegOut[0],  RegOut[1],  RegOut[2],  RegOut[3],
		                               RegOut[4],  RegOut[5],  RegOut[6],  RegOut[7],
		                               RegOut[8],  RegOut[9],  RegOut[10], RegOut[11],
		                               RegOut[12], RegOut[13], RegOut[14], RegOut[15],
		                               RegOut[16], RegOut[17], RegOut[18], RegOut[19],
		                               RegOut[20], RegOut[21], RegOut[22], RegOut[23],
		                               RegOut[24], RegOut[25], RegOut[26], RegOut[27],
		                               RegOut[28], RegOut[29], RegOut[30], RegOut[31]);

   mux32to1by32 mux2(ReadData2, ReadRegister2, RegOut[0],  RegOut[1],  RegOut[2],  RegOut[3],
		                               RegOut[4],  RegOut[5],  RegOut[6],  RegOut[7],
		                               RegOut[8],  RegOut[9],  RegOut[10], RegOut[11],
		                               RegOut[12], RegOut[13], RegOut[14], RegOut[15],
		                               RegOut[16], RegOut[17], RegOut[18], RegOut[19],
		                               RegOut[20], RegOut[21], RegOut[22], RegOut[23],
		                               RegOut[24], RegOut[25], RegOut[26], RegOut[27],
		                               RegOut[28], RegOut[29], RegOut[30], RegOut[31]);   

  // These two lines are clearly wrong.  They are included to showcase how the 
  // test harness works. Delete them after you understand the testing process, 
  // and replace them with your actual code.
  // assign ReadData1 = 42;
  // assign ReadData2 = 42;

endmodule
