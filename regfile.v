//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register.v"
`include "decoders.v"
`include "mux.v"

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

wire[31:0] mem [31:0];
wire[31:0] r_adr1;
wire[31:0] r_adr2;
wire[31:0] w_adr; //decoded address

decoder1to32 dc_w(w_adr,RegWrite,WriteRegister);
register32zero #(.n(32)) register0(mem[0], WriteData, w_adr[0], Clk);

generate
genvar i;
for (i=1; i<32; i = i+1) begin: reggenblk 
	register32 #(.n(32)) register(mem[i],WriteData,w_adr[i],Clk); //q,d,en,clk
end
endgenerate

mux32to1by32 m_r1(ReadData1, ReadRegister1,
	mem[0],mem[1],mem[2],mem[3],
	mem[4],mem[5],mem[6],mem[7],
	mem[8],mem[9],mem[10],mem[11],
	mem[12],mem[13],mem[14],mem[15],
	mem[16],mem[17],mem[18],mem[19],
	mem[20],mem[21],mem[22],mem[23],
	mem[24],mem[25],mem[26],mem[27],
	mem[28],mem[29],mem[30],mem[31]
);

mux32to1by32 m_r2(ReadData2, ReadRegister2,
	mem[0],mem[1],mem[2],mem[3],
	mem[4],mem[5],mem[6],mem[7],
	mem[8],mem[9],mem[10],mem[11],
	mem[12],mem[13],mem[14],mem[15],
	mem[16],mem[17],mem[18],mem[19],
	mem[20],mem[21],mem[22],mem[23],
	mem[24],mem[25],mem[26],mem[27],
	mem[28],mem[29],mem[30],mem[31]
);

endmodule
