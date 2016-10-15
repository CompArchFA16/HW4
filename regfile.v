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
output[31:0]	ReadData1,	    // Contents of first register read
output[31:0]	ReadData2,    	// Contents of second register read
input[31:0] 	WriteData,    	// Contents to write to register
input[4:0]	  ReadRegister1,	// Address of first register to read
input[4:0]	  ReadRegister2,	// Address of second register to read
input[4:0]	  WriteRegister,	// Address of register to write
input		      RegWrite,       // Enable writing of register when High
input		      Clk		          // Clock (Positive Edge Triggered)
);

  wire[31:0] res_decoder;
  wire[31:0] res_mux[31:0];

  decoder1to32 dec1to32(res_decoder, RegWrite, WriteRegister);
  
  register32zero reg32zero(res_mux[0], WriteData, res_decoder[0], Clk);

  generate
    genvar index;
    for (index=1; index<32; index=index+1) begin:mux_loop
      register32 reg32(res_mux[index], WriteData, res_decoder[index], Clk);
    end
  endgenerate

  mux32to1by32 mux1(ReadData1, ReadRegister1, res_mux[0], res_mux[1], res_mux[2], res_mux[3], res_mux[4], res_mux[5], res_mux[6], res_mux[7], res_mux[8], res_mux[9], res_mux[10], res_mux[11], res_mux[12], res_mux[13], res_mux[14], res_mux[15], res_mux[16], res_mux[17], res_mux[18], res_mux[19], res_mux[20], res_mux[21], res_mux[22], res_mux[23], res_mux[24], res_mux[25], res_mux[26], res_mux[27], res_mux[28], res_mux[29], res_mux[30], res_mux[31]);

  mux32to1by32 mux2(ReadData2, ReadRegister2, res_mux[0], res_mux[1], res_mux[2], res_mux[3], res_mux[4], res_mux[5], res_mux[6], res_mux[7], res_mux[8], res_mux[9], res_mux[10], res_mux[11], res_mux[12], res_mux[13], res_mux[14], res_mux[15], res_mux[16], res_mux[17], res_mux[18], res_mux[19], res_mux[20], res_mux[21], res_mux[22], res_mux[23], res_mux[24], res_mux[25], res_mux[26], res_mux[27], res_mux[28], res_mux[29], res_mux[30], res_mux[31]);
endmodule
