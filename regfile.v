//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register32.v"
`include "mux32.v"
`include "decoders.v"

module regfile
(
    output[31:0]	ReadData1,	// Contents of first register read
    output[31:0]    ReadData2,	// Contents of second register read
    input[31:0]	    WriteData,	// Contents to write to register
    input[4:0]	    ReadRegister1,	// Address of first register to read
    input[4:0]	    ReadRegister2,	// Address of second register to read
    input[4:0]	    WriteRegister,	// Address of register to write
    input		    RegWrite,	// Enable writing of register when High
    input		    Clk		// Clock (Positive Edge Triggered)
);
    wire [31:0] WriteData;
    wire [4:0] ReadRegister1, ReadRegister2, WriteRegister;
    wire RegWrite, Clk;

    // Decode write address
    wire[31:0] writeEnable;
    decoder1to32 decoder(writeEnable, RegWrite, WriteRegister);

    // 32 32-bit registers, with the first register as constant zero
    wire[31:0] storedData[31:0];
    register32zero register32zero(storedData[0], WriteData, writeEnable[0], Clk);
    genvar i;
    generate
        for (i=1; i < 32; i=i+1) begin : createRegBits
            register32 _register32(storedData[i], WriteData, writeEnable[i], Clk);
        end
    endgenerate

    // 2 multiplexers for reading data
    mux32to1by32 mux1(ReadData1, ReadRegister1,
        storedData[0], storedData[1], storedData[2], storedData[3], storedData[4], storedData[5],
        storedData[6], storedData[7], storedData[8], storedData[9], storedData[10], storedData[11],
        storedData[12], storedData[13], storedData[14], storedData[15], storedData[16],
        storedData[17], storedData[18], storedData[19], storedData[20], storedData[21],
        storedData[22], storedData[23], storedData[24], storedData[25], storedData[26],
        storedData[27], storedData[28], storedData[29], storedData[30], storedData[31]);
    mux32to1by32 mux2(ReadData2, ReadRegister2,
        storedData[0], storedData[1], storedData[2], storedData[3], storedData[4], storedData[5],
        storedData[6], storedData[7], storedData[8], storedData[9], storedData[10], storedData[11],
        storedData[12], storedData[13], storedData[14], storedData[15], storedData[16],
        storedData[17], storedData[18], storedData[19], storedData[20], storedData[21],
        storedData[22], storedData[23], storedData[24], storedData[25], storedData[26],
        storedData[27], storedData[28], storedData[29], storedData[30], storedData[31]);

endmodule