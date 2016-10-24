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

  wire [31:0] q [31:0]; //32-by-32 bit q
  wire [31:0] WrEn;		//32-bit WriteEnable 

  decoder1to32 decode1(WrEn, RegWrite, WriteRegister);  //Outputs 32-bit WriteEnable, should be all zeros except for selected register. 
  register32zero regzero(q[0],WriteData,WrEn[0],Clk);   //Outputs zero register- so, 32-bits of zeros.
  genvar i;
  generate
  //ands all 32 bits
    for (i = 1; i < 32; i = i+1)
    begin : genreg
      register32 regi(q[i],WriteData,WrEn[i],Clk); //Runs the rest of the registers, outputting each of the 31 remaining qs. 
    end
  endgenerate

  //Selects the correct q from all the qs based on the chosen register.
  mux32to1by32 regtest1(ReadData1, ReadRegister1, q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31]);
  mux32to1by32 regtest2(ReadData2, ReadRegister2,  q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31]);



endmodule