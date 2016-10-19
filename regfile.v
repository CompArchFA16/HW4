//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "register.v"
`include "decoders.v"
`include "multiplexer32.v"

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

    //decoder input
    wire [31:0] decout;

  //instantiate regfile32
  wire [31:0] reg0 ;
  wire [31:0] reg1 ;
  wire [31:0] reg2 ;
  wire [31:0] reg3;
  wire [31:0] reg4;
  wire [31:0] reg5;
  wire [31:0] reg6;
  wire [31:0] reg7;
  wire [31:0] reg8;
  wire [31:0] reg9;
  wire [31:0] reg10;
  wire [31:0] reg11;
  wire [31:0] reg12;
  wire [31:0] reg13;
  wire [31:0] reg14;
  wire [31:0] reg15;
  wire [31:0] reg16;
  wire [31:0] reg17;
  wire [31:0] reg18;
  wire [31:0] reg19;
  wire [31:0] reg20;
  wire [31:0] reg21;
  wire [31:0] reg22;
  wire [31:0] reg23;
  wire [31:0] reg24;
  wire [31:0] reg25;
  wire [31:0] reg26;
  wire [31:0] reg27;
  wire [31:0] reg28;
  wire [31:0] reg29;
  wire [31:0] reg30;
  wire [31:0] reg31;

  decoder1to32 decoder(decout, RegWrite, WriteRegister); //out, enable, address

  register32zero zeroreg(WriteData, reg0, RegWrite, Clk); //zero register takes sets output to zero always.
  register32 onereg (WriteData, reg1, RegWrite, Clk);
  register32 tworeg (WriteData, reg2, RegWrite, Clk);
  register32 threereg (WriteData, reg3, RegWrite, Clk);
  register32 fourreg (WriteData, reg4, RegWrite, Clk);
  register32 fivereg (WriteData, reg5, RegWrite, Clk);
  register32 sixreg (WriteData, reg6, RegWrite, Clk);
  register32 sevenreg (WriteData, reg7, RegWrite, Clk);
  register32 eightreg (WriteData, reg8, RegWrite, Clk);
  register32 ninereg (WriteData, reg9, RegWrite, Clk);
  register32 tenreg (WriteData, reg10, RegWrite, Clk);
  register32 elevenreg (WriteData, reg11, RegWrite, Clk);
  register32 twelvereg (WriteData, reg12, RegWrite, Clk);
  register32 thirteenreg (WriteData, reg13, RegWrite, Clk);
  register32 fourteenreg (WriteData, reg14, RegWrite, Clk);
  register32 fifteenreg (WriteData, reg15, RegWrite, Clk);
  register32 sixteenreg (WriteData, reg16, RegWrite, Clk);
  register32 seventeenreg (WriteData, reg17, RegWrite, Clk);
  register32 eighteenreg (WriteData, reg18, RegWrite, Clk);
  register32 nineteenreg (WriteData, reg19, RegWrite, Clk);
  register32 twentyreg (WriteData, reg20, RegWrite, Clk);
  register32 twentyonereg (WriteData, reg21, RegWrite, Clk);
  register32 twentytwoereg (WriteData, reg22, RegWrite, Clk);
  register32 twentythreereg (WriteData, reg23, RegWrite, Clk);
  register32 twentyfourreg (WriteData, reg24, RegWrite, Clk);
  register32 twentyfivereg (WriteData, reg25, RegWrite, Clk);
  register32 twentysixreg (WriteData, reg26, RegWrite, Clk);
  register32 twentysevenreg (WriteData, reg27, RegWrite, Clk);
  register32 twentyeightreg (WriteData, reg28, RegWrite, Clk);
  register32 twentyninereg (WriteData, reg29, RegWrite, Clk);
  register32 thirtyreg (WriteData, reg30, RegWrite, Clk);
  register32 thirtyonereg (WriteData, reg31, RegWrite, Clk);

  //to read from register on read data 1
  // calling Multiplexer, then setting output, address, and inputs
  mux32to1by32 mux1(ReadData1, ReadRegister1, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31);   //pick which register to read

  //to read from register on read data 2
  // calling Multiplexer, then setting output, address, and inputs
  mux32to1by32 mux2(ReadData2, ReadRegister2, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31); //pick which register to read

  //

endmodule
