`include "decoders.v"
`include "mux.v"
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
output[31:0]  ReadData1,    // Contents of first register read
output[31:0]  ReadData2,    // Contents of second register read
input[31:0]  WriteData,    // Contents to write to register
input[4:0]  ReadRegister1,    // Address of first register to read
input[4:0]  ReadRegister2,    // Address of second register to read
input[4:0]  WriteRegister,    // Address of register to write
input        RegWrite,    // Enable writing of register when High
input        Clk        // Clock (Positive Edge Triggered)
);

    // These two lines are clearly wrong.  They are included to showcase how the 
    // test harness works. Delete them after you understand the testing process, 
    // and replace them with your actual code.
    //assign ReadData1 = 42;
    //assign ReadData2 = 42;

    wire[31:0] write;
    wire[32*32-1:0] registerFile;

    decoder1to32 decoder0(write, RegWrite, WriteRegister);

    register32zero register(registerFile[31:0], WriteData, write[0], Clk);
    genvar i;
    generate 
    for (i=1; i < 32; i=i+1) begin: registers
        register32 register(registerFile[32*(i+1)-1:32*i], WriteData, write[i], Clk);
    end
    endgenerate
    
    mux32to1by32 mux0(ReadData1, ReadRegister1, registerFile);
    mux32to1by32 mux1(ReadData2, ReadRegister2, registerFile);

endmodule
