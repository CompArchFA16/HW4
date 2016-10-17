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

	// Set up wires
 	wire[31:0] decoder;
  	wire[31:0] mux[31:0];

  	// Create decoder and register
 	decoder1to32 decoder132(decoder, RegWrite, WriteRegister);
  	register32zero register320(mux[0], WriteData, decoder[0], Clk);

  	// Had to figure out for loop from online resources, i++ is apparently not a thing
	generate
    	genvar i;
    	for (i=1; i<32; i=i+1) begin: loop
      		register32 reg32(mux[i], WriteData, decoder[i], Clk);
    	end
  	endgenerate

  	// Create mux0 and mux1 - Not able to find simpler way to list mux indices
    mux32to1by32 mux0(ReadData1, ReadRegister1, mux[0], mux[1], mux[2], mux[3], mux[4], mux[5], mux[6], mux[7], mux[8],
    											mux[9], mux[10], mux[11], mux[12], mux[13], mux[14], mux[15], mux[16], 
    											mux[17], mux[18], mux[19], mux[20], mux[21], mux[22], mux[23], mux[24], 
    											mux[25], mux[26], mux[27], mux[28], mux[29], mux[30], mux[31]);
	mux32to1by32 mux1(ReadData2, ReadRegister2, mux[0], mux[1], mux[2], mux[3], mux[4], mux[5], mux[6], mux[7], mux[8],
												mux[9], mux[10], mux[11], mux[12], mux[13], mux[14], mux[15], mux[16], 
												mux[17], mux[18], mux[19], mux[20], mux[21], mux[22], mux[23], mux[24],
												mux[25], mux[26], mux[27], mux[28], mux[29], mux[30], mux[31]);

endmodule