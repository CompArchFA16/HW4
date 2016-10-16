//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "register.v"
`include "decoders.v"

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

  // These two lines are clearly wrong.  They are included to showcase how the 
  // test harness works. Delete them after you understand the testing process, 
  // and replace them with your actual code.
  //assign ReadData1 = 42;
  //assign ReadData2 = 42;

  wire[31:0] decout;
  
  //decoder1to32 dec1(ReadData1, RegWrite, WriteRegister);
  decoder1to32 dec(decout, RegWrite, WriteRegister);

  // I am only writing these all separately and not in a loop,
  // because this is necessary to interface with the mux module
  	wire[31:0] regout0;
	wire[31:0] regout1;
	wire[31:0] regout2;
	wire[31:0] regout3;
	wire[31:0] regout4;
	wire[31:0] regout5;
	wire[31:0] regout6;
	wire[31:0] regout7;
	wire[31:0] regout8;
	wire[31:0] regout9;
	wire[31:0] regout10;
	wire[31:0] regout11;
	wire[31:0] regout12;
	wire[31:0] regout13;
	wire[31:0] regout14;
	wire[31:0] regout15;
	wire[31:0] regout16;
	wire[31:0] regout17;
	wire[31:0] regout18;
	wire[31:0] regout19;
	wire[31:0] regout20;
	wire[31:0] regout21;
	wire[31:0] regout22;
	wire[31:0] regout23;
	wire[31:0] regout24;
	wire[31:0] regout25;
	wire[31:0] regout26;
	wire[31:0] regout27;
	wire[31:0] regout28;
	wire[31:0] regout29;
	wire[31:0] regout30;
	wire[31:0] regout31;

	register32zero reg0(regout0, WriteData, decout[0], Clk);
	register32 reg1(regout1, WriteData, decout[1], Clk);
	register32 reg2(regout2, WriteData, decout[2], Clk);
	register32 reg3(regout3, WriteData, decout[3], Clk);
	register32 reg4(regout4, WriteData, decout[4], Clk);
	register32 reg5(regout5, WriteData, decout[5], Clk);
	register32 reg6(regout6, WriteData, decout[6], Clk);
	register32 reg7(regout7, WriteData, decout[7], Clk);
	register32 reg8(regout8, WriteData, decout[8], Clk);
	register32 reg9(regout9, WriteData, decout[9], Clk);
	register32 reg10(regout10, WriteData, decout[10], Clk);
	register32 reg11(regout11, WriteData, decout[11], Clk);
	register32 reg12(regout12, WriteData, decout[12], Clk);
	register32 reg13(regout13, WriteData, decout[13], Clk);
	register32 reg14(regout14, WriteData, decout[14], Clk);
	register32 reg15(regout15, WriteData, decout[15], Clk);
	register32 reg16(regout16, WriteData, decout[16], Clk);
	register32 reg17(regout17, WriteData, decout[17], Clk);
	register32 reg18(regout18, WriteData, decout[18], Clk);
	register32 reg19(regout19, WriteData, decout[19], Clk);
	register32 reg20(regout20, WriteData, decout[20], Clk);
	register32 reg21(regout21, WriteData, decout[21], Clk);
	register32 reg22(regout22, WriteData, decout[22], Clk);
	register32 reg23(regout23, WriteData, decout[23], Clk);
	register32 reg24(regout24, WriteData, decout[24], Clk);
	register32 reg25(regout25, WriteData, decout[25], Clk);
	register32 reg26(regout26, WriteData, decout[26], Clk);
	register32 reg27(regout27, WriteData, decout[27], Clk);
	register32 reg28(regout28, WriteData, decout[28], Clk);
	register32 reg29(regout29, WriteData, decout[29], Clk);
	register32 reg30(regout30, WriteData, decout[30], Clk);
	register32 reg31(regout31, WriteData, decout[31], Clk);


	mux32to1by32 mux1(ReadData1, ReadRegister1, regout0, regout1, regout2, regout3, regout4, regout5, regout6, regout7, regout8, regout9, regout10, regout11, regout12, regout13, regout14, regout15, regout16, regout17, regout18, regout19, regout20, regout21, regout22, regout23, regout24, regout25, regout26, regout27, regout28, regout29, regout30, regout31);

	mux32to1by32 mux2(ReadData2, ReadRegister2, regout0, regout1, regout2, regout3, regout4, regout5, regout6, regout7, regout8, regout9, regout10, regout11, regout12, regout13, regout14, regout15, regout16, regout17, regout18, regout19, regout20, regout21, regout22, regout23, regout24, regout25, regout26, regout27, regout28, regout29, regout30, regout31);





endmodule