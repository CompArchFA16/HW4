//------------------------------------------------------------------------------
// MIPS register file testers
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//   * These will be intentionally wrong
//------------------------------------------------------------------------------

// Comment out test cases we are not testing cuz module names are the same

// module regfile// testing case 3
// (
// output[31:0]	ReadData1,	// Contents of first register read
// output[31:0]	ReadData2,	// Contents of second register read
// input[31:0]	WriteData,	// Contents to write to register
// input[4:0]	ReadRegister1,	// Address of first register to read
// input[4:0]	ReadRegister2,	// Address of second register to read
// input[4:0]	WriteRegister,	// Address of register to write
// input		RegWrite,	// Enable writing of register when High
// input		Clk		// Clock (Positive Edge Triggered)
// );

// 	// Decoder to choose which address we are writing to and if its enabled
// 	wire [31:0] decoder_output;
// 	decoder1to32 decoder1(decoder_output, 1, WriteRegister);

// 	// 32 Registers (including 1 zero one)
// 	wire[31:0]  input0, input1, input2, input3, input4, input5, input6, input7, input8, input9;
// 	wire[31:0]	input10, input11, input12, input13, input14, input15, input16, input17, input18, input19;
// 	wire[31:0]	input20, input21, input22, input23, input24, input25, input26, input27, input28, input29;
// 	wire[31:0]	input30, input31;

// 	//Zero register (0th one)
// 	register32zero register_zero_1(input0, WriteData, decoder_output[0], Clk);

// 	// Other Registers
// 	register32 reg32_1(input1, WriteData, decoder_output[1], Clk);
// 	register32 reg32_2(input2, WriteData, decoder_output[2], Clk);
// 	register32 reg32_3(input3, WriteData, decoder_output[3], Clk);
// 	register32 reg32_4(input4, WriteData, decoder_output[4], Clk);
// 	register32 reg32_5(input5, WriteData, decoder_output[5], Clk);
// 	register32 reg32_6(input6, WriteData, decoder_output[6], Clk);
// 	register32 reg32_7(input7, WriteData, decoder_output[7], Clk);
// 	register32 reg32_8(input8, WriteData, decoder_output[8], Clk);
// 	register32 reg32_9(input9, WriteData, decoder_output[9], Clk);
// 	register32 reg32_10(input10, WriteData, decoder_output[10], Clk);
// 	register32 reg32_11(input11, WriteData, decoder_output[11], Clk);
// 	register32 reg32_12(input12, WriteData, decoder_output[12], Clk);
// 	register32 reg32_13(input13, WriteData, decoder_output[13], Clk);
// 	register32 reg32_14(input14, WriteData, decoder_output[14], Clk);
// 	register32 reg32_15(input15, WriteData, decoder_output[15], Clk);
// 	register32 reg32_16(input16, WriteData, decoder_output[16], Clk);
// 	register32 reg32_17(input17, WriteData, decoder_output[17], Clk);
// 	register32 reg32_18(input18, WriteData, decoder_output[18], Clk);
// 	register32 reg32_19(input19, WriteData, decoder_output[19], Clk);
// 	register32 reg32_20(input20, WriteData, decoder_output[20], Clk);
// 	register32 reg32_21(input21, WriteData, decoder_output[21], Clk);
// 	register32 reg32_22(input22, WriteData, decoder_output[22], Clk);
// 	register32 reg32_23(input23, WriteData, decoder_output[23], Clk);
// 	register32 reg32_24(input24, WriteData, decoder_output[24], Clk);
// 	register32 reg32_25(input25, WriteData, decoder_output[25], Clk);
// 	register32 reg32_26(input26, WriteData, decoder_output[26], Clk);
// 	register32 reg32_27(input27, WriteData, decoder_output[27], Clk);
// 	register32 reg32_28(input28, WriteData, decoder_output[28], Clk);
// 	register32 reg32_29(input29, WriteData, decoder_output[29], Clk);
// 	register32 reg32_30(input30, WriteData, decoder_output[30], Clk);
// 	register32 reg32_31(input31, WriteData, decoder_output[31], Clk);

// 	// Multiplexors x2
// 	mux32to1by32	mux1(ReadData1, ReadRegister1, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);
// 	mux32to1by32	mux2(ReadData2, ReadRegister2, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);

// endmodule


// module regfile //testing case 4
// (
// output[31:0]	ReadData1,	// Contents of first register read
// output[31:0]	ReadData2,	// Contents of second register read
// input[31:0]	WriteData,	// Contents to write to register
// input[4:0]	ReadRegister1,	// Address of first register to read
// input[4:0]	ReadRegister2,	// Address of second register to read
// input[4:0]	WriteRegister,	// Address of register to write
// input		RegWrite,	// Enable writing of register when High
// input		Clk		// Clock (Positive Edge Triggered)
// );

// 	// Decoder to choose which address we are writing to and if its enabled
// 	// wire[31:0] decoder_output;
// 	// decoder1to32 decoder1(decoder_output, RegWrite, WriteRegister);



// 	// 32 Registers (including 1 zero one)
// 	wire[31:0]  input0, input1, input2, input3, input4, input5, input6, input7, input8, input9;
// 	wire[31:0]	input10, input11, input12, input13, input14, input15, input16, input17, input18, input19;
// 	wire[31:0]	input20, input21, input22, input23, input24, input25, input26, input27, input28, input29;
// 	wire[31:0]	input30, input31;

// 	//Zero register (0th one)
// 	register32zero register_zero_1(input0, WriteData, decoder_output[0], Clk);

// 	// Other Registers
// 	register32 reg32_1(input1, WriteData, RegWrite, Clk);
// 	register32 reg32_2(input2, WriteData, RegWrite, Clk);
// 	register32 reg32_3(input3, WriteData, RegWrite, Clk);
// 	register32 reg32_4(input4, WriteData, RegWrite, Clk);
// 	register32 reg32_5(input5, WriteData, RegWrite, Clk);
// 	register32 reg32_6(input6, WriteData, RegWrite, Clk);
// 	register32 reg32_7(input7, WriteData, RegWrite, Clk);
// 	register32 reg32_8(input8, WriteData, RegWrite, Clk);
// 	register32 reg32_9(input9, WriteData, RegWrite, Clk);
// 	register32 reg32_10(input10, WriteData, RegWrite, Clk);
// 	register32 reg32_11(input11, WriteData, RegWrite, Clk);
// 	register32 reg32_12(input12, WriteData, RegWrite, Clk);
// 	register32 reg32_13(input13, WriteData, RegWrite, Clk);
// 	register32 reg32_14(input14, WriteData, RegWrite, Clk);
// 	register32 reg32_15(input15, WriteData, RegWrite, Clk);
// 	register32 reg32_16(input16, WriteData, RegWrite, Clk);
// 	register32 reg32_17(input17, WriteData, RegWrite, Clk);
// 	register32 reg32_18(input18, WriteData, RegWrite, Clk);
// 	register32 reg32_19(input19, WriteData, RegWrite, Clk);
// 	register32 reg32_20(input20, WriteData, RegWrite, Clk);
// 	register32 reg32_21(input21, WriteData, RegWrite, Clk);
// 	register32 reg32_22(input22, WriteData, RegWrite, Clk);
// 	register32 reg32_23(input23, WriteData, RegWrite, Clk);
// 	register32 reg32_24(input24, WriteData, RegWrite, Clk);
// 	register32 reg32_25(input25, WriteData, RegWrite, Clk);
// 	register32 reg32_26(input26, WriteData, RegWrite, Clk);
// 	register32 reg32_27(input27, WriteData, RegWrite, Clk);
// 	register32 reg32_28(input28, WriteData, RegWrite, Clk);
// 	register32 reg32_29(input29, WriteData, RegWrite, Clk);
// 	register32 reg32_30(input30, WriteData, RegWrite, Clk);
// 	register32 reg32_31(input31, WriteData, RegWrite, Clk);

// 	// Multiplexors x2
// 	mux32to1by32	mux1(ReadData1, ReadRegister1, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);
// 	mux32to1by32	mux2(ReadData2, ReadRegister2, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);

// endmodule

// module regfile	// test case 5
// (
// output[31:0]	ReadData1,	// Contents of first register read
// output[31:0]	ReadData2,	// Contents of second register read
// input[31:0]	WriteData,	// Contents to write to register
// input[4:0]	ReadRegister1,	// Address of first register to read
// input[4:0]	ReadRegister2,	// Address of second register to read
// input[4:0]	WriteRegister,	// Address of register to write
// input		RegWrite,	// Enable writing of register when High
// input		Clk		// Clock (Positive Edge Triggered)
// );

// 	// These two lines are clearly wrong.  They are included to showcase how the 
// 	// test harness works. Delete them after you understand the testing process, 
// 	// and replace them with your actual code.
// 	// assign ReadData1 = 42;
// 	// assign ReadData2 = 42;

// 	// Decoder to choose which address we are writing to and if its enabled
// 	wire [31:0] decoder_output;
// 	decoder1to32 decoder1(decoder_output, RegWrite, WriteRegister);

// 	// 32 Registers (including 1 zero one)
// 	wire[31:0]  input0, input1, input2, input3, input4, input5, input6, input7, input8, input9;
// 	wire[31:0]	input10, input11, input12, input13, input14, input15, input16, input17, input18, input19;
// 	wire[31:0]	input20, input21, input22, input23, input24, input25, input26, input27, input28, input29;
// 	wire[31:0]	input30, input31;

// 	//Zero register (0th one)
// 	register32 reg32_0(input0, WriteData, decoder_output[0], Clk);

// 	// Other Registers
// 	register32 reg32_1(input1, WriteData, decoder_output[1], Clk);
// 	register32 reg32_2(input2, WriteData, decoder_output[2], Clk);
// 	register32 reg32_3(input3, WriteData, decoder_output[3], Clk);
// 	register32 reg32_4(input4, WriteData, decoder_output[4], Clk);
// 	register32 reg32_5(input5, WriteData, decoder_output[5], Clk);
// 	register32 reg32_6(input6, WriteData, decoder_output[6], Clk);
// 	register32 reg32_7(input7, WriteData, decoder_output[7], Clk);
// 	register32 reg32_8(input8, WriteData, decoder_output[8], Clk);
// 	register32 reg32_9(input9, WriteData, decoder_output[9], Clk);
// 	register32 reg32_10(input10, WriteData, decoder_output[10], Clk);
// 	register32 reg32_11(input11, WriteData, decoder_output[11], Clk);
// 	register32 reg32_12(input12, WriteData, decoder_output[12], Clk);
// 	register32 reg32_13(input13, WriteData, decoder_output[13], Clk);
// 	register32 reg32_14(input14, WriteData, decoder_output[14], Clk);
// 	register32 reg32_15(input15, WriteData, decoder_output[15], Clk);
// 	register32 reg32_16(input16, WriteData, decoder_output[16], Clk);
// 	register32 reg32_17(input17, WriteData, decoder_output[17], Clk);
// 	register32 reg32_18(input18, WriteData, decoder_output[18], Clk);
// 	register32 reg32_19(input19, WriteData, decoder_output[19], Clk);
// 	register32 reg32_20(input20, WriteData, decoder_output[20], Clk);
// 	register32 reg32_21(input21, WriteData, decoder_output[21], Clk);
// 	register32 reg32_22(input22, WriteData, decoder_output[22], Clk);
// 	register32 reg32_23(input23, WriteData, decoder_output[23], Clk);
// 	register32 reg32_24(input24, WriteData, decoder_output[24], Clk);
// 	register32 reg32_25(input25, WriteData, decoder_output[25], Clk);
// 	register32 reg32_26(input26, WriteData, decoder_output[26], Clk);
// 	register32 reg32_27(input27, WriteData, decoder_output[27], Clk);
// 	register32 reg32_28(input28, WriteData, decoder_output[28], Clk);
// 	register32 reg32_29(input29, WriteData, decoder_output[29], Clk);
// 	register32 reg32_30(input30, WriteData, decoder_output[30], Clk);
// 	register32 reg32_31(input31, WriteData, decoder_output[31], Clk);

// 	// Multiplexors x2
// 	mux32to1by32	mux1(ReadData1, ReadRegister1, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);
// 	mux32to1by32	mux2(ReadData2, ReadRegister2, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);

// endmodule

// module regfile  // test case 6
// (
// output[31:0]	ReadData1,	// Contents of first register read
// output[31:0]	ReadData2,	// Contents of second register read
// input[31:0]	WriteData,	// Contents to write to register
// input[4:0]	ReadRegister1,	// Address of first register to read
// input[4:0]	ReadRegister2,	// Address of second register to read
// input[4:0]	WriteRegister,	// Address of register to write
// input		RegWrite,	// Enable writing of register when High
// input		Clk		// Clock (Positive Edge Triggered)
// );

// 	// Decoder to choose which address we are writing to and if its enabled
// 	wire [31:0] decoder_output;
// 	decoder1to32 decoder1(decoder_output, RegWrite, WriteRegister);

// 	// 32 Registers (including 1 zero one)
// 	wire[31:0]  input0, input1, input2, input3, input4, input5, input6, input7, input8, input9;
// 	wire[31:0]	input10, input11, input12, input13, input14, input15, input16, input17, input18, input19;
// 	wire[31:0]	input20, input21, input22, input23, input24, input25, input26, input27, input28, input29;
// 	wire[31:0]	input30, input31;

// 	//Zero register (0th one)
// 	register32zero register_zero_1(input0, WriteData, decoder_output[0], Clk);

// 	// Other Registers
// 	register32 reg32_1(input1, WriteData, decoder_output[1], Clk);
// 	register32 reg32_2(input2, WriteData, decoder_output[2], Clk);
// 	register32 reg32_3(input3, WriteData, decoder_output[3], Clk);
// 	register32 reg32_4(input4, WriteData, decoder_output[4], Clk);
// 	register32 reg32_5(input5, WriteData, decoder_output[5], Clk);
// 	register32 reg32_6(input6, WriteData, decoder_output[6], Clk);
// 	register32 reg32_7(input7, WriteData, decoder_output[7], Clk);
// 	register32 reg32_8(input8, WriteData, decoder_output[8], Clk);
// 	register32 reg32_9(input9, WriteData, decoder_output[9], Clk);
// 	register32 reg32_10(input10, WriteData, decoder_output[10], Clk);
// 	register32 reg32_11(input11, WriteData, decoder_output[11], Clk);
// 	register32 reg32_12(input12, WriteData, decoder_output[12], Clk);
// 	register32 reg32_13(input13, WriteData, decoder_output[13], Clk);
// 	register32 reg32_14(input14, WriteData, decoder_output[14], Clk);
// 	register32 reg32_15(input15, WriteData, decoder_output[15], Clk);
// 	register32 reg32_16(input16, WriteData, decoder_output[16], Clk);
// 	register32 reg32_17(input17, WriteData, decoder_output[17], Clk);
// 	register32 reg32_18(input18, WriteData, decoder_output[18], Clk);
// 	register32 reg32_19(input19, WriteData, decoder_output[19], Clk);
// 	register32 reg32_20(input20, WriteData, decoder_output[20], Clk);
// 	register32 reg32_21(input21, WriteData, decoder_output[21], Clk);
// 	register32 reg32_22(input22, WriteData, decoder_output[22], Clk);
// 	register32 reg32_23(input23, WriteData, decoder_output[23], Clk);
// 	register32 reg32_24(input24, WriteData, decoder_output[24], Clk);
// 	register32 reg32_25(input25, WriteData, decoder_output[25], Clk);
// 	register32 reg32_26(input26, WriteData, decoder_output[26], Clk);
// 	register32 reg32_27(input27, WriteData, decoder_output[27], Clk);
// 	register32 reg32_28(input28, WriteData, decoder_output[28], Clk);
// 	register32 reg32_29(input29, WriteData, decoder_output[29], Clk);
// 	register32 reg32_30(input30, WriteData, decoder_output[30], Clk);
// 	register32 reg32_31(input31, WriteData, decoder_output[31], Clk);

// 	// Multiplexors x2
// 	mux32to1by32	mux1(ReadData1, ReadRegister1, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);
// 	mux32to1by32	mux2(ReadData2, 5'd17, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);

// endmodule

// module regfile //testcase 7
// (
// output[31:0]	ReadData1,	// Contents of first register read
// output[31:0]	ReadData2,	// Contents of second register read
// input[31:0]	WriteData,	// Contents to write to register
// input[4:0]	ReadRegister1,	// Address of first register to read
// input[4:0]	ReadRegister2,	// Address of second register to read
// input[4:0]	WriteRegister,	// Address of register to write
// input		RegWrite,	// Enable writing of register when High
// input		Clk		// Clock (Positive Edge Triggered)
// );

// 	// These two lines are clearly wrong.  They are included to showcase how the 
// 	// test harness works. Delete them after you understand the testing process, 
// 	// and replace them with your actual code.
// 	// assign ReadData1 = 42;
// 	// assign ReadData2 = 42;

// 	// Decoder to choose which address we are writing to and if its enabled
// 	wire [31:0] decoder_output;
// 	decoder1to32 decoder1(decoder_output, RegWrite, WriteRegister);

// 	// 32 Registers (including 1 zero one)
// 	wire[31:0]  input0, input1, input2, input3, input4, input5, input6, input7, input8, input9;
// 	wire[31:0]	input10, input11, input12, input13, input14, input15, input16, input17, input18, input19;
// 	wire[31:0]	input20, input21, input22, input23, input24, input25, input26, input27, input28, input29;
// 	wire[31:0]	input30, input31;

// 	//Zero register (0th one)
// 	register32zero register_zero_1(input0, WriteData, decoder_output[0], Clk);

// 	// Other Registers
// 	register32 reg32_1(input1, WriteData, decoder_output[1], Clk);
// 	register32 reg32_2(input2, WriteData, decoder_output[2], Clk);
// 	register32 reg32_3(input3, WriteData, decoder_output[3], Clk);
// 	register32 reg32_4(input4, WriteData, decoder_output[4], Clk);
// 	register32 reg32_5(input5, WriteData, decoder_output[5], Clk);
// 	register32 reg32_6(input6, WriteData, decoder_output[6], Clk);
// 	register32 reg32_7(input7, WriteData, decoder_output[7], Clk);
// 	register32 reg32_8(input8, WriteData, decoder_output[8], Clk);
// 	register32 reg32_9(input9, WriteData, decoder_output[9], Clk);
// 	register32 reg32_10(input10, WriteData, decoder_output[10], Clk);
// 	register32 reg32_11(input11, WriteData, decoder_output[11], Clk);
// 	register32 reg32_12(input12, WriteData, decoder_output[12], Clk);
// 	register32 reg32_13(input13, WriteData, decoder_output[13], Clk);
// 	register32 reg32_14(input14, WriteData, decoder_output[14], Clk);
// 	register32 reg32_15(input15, WriteData, decoder_output[15], Clk);
// 	register32 reg32_16(input16, WriteData, decoder_output[16], Clk);
// 	register32 reg32_17(input17, WriteData, decoder_output[17], Clk);
// 	register32 reg32_18(input18, WriteData, decoder_output[18], Clk);
// 	register32 reg32_19(input19, WriteData, decoder_output[19], Clk);
// 	register32 reg32_20(input20, WriteData, decoder_output[20], Clk);
// 	register32 reg32_21(input21, WriteData, decoder_output[21], Clk);
// 	register32 reg32_22(input22, WriteData, decoder_output[22], Clk);
// 	register32 reg32_23(input23, WriteData, decoder_output[23], Clk);
// 	register32 reg32_24(input24, WriteData, decoder_output[24], Clk);
// 	register32 reg32_25(input25, WriteData, decoder_output[25], Clk);
// 	register32 reg32_26(input26, WriteData, decoder_output[26], Clk);
// 	register32 reg32_27(input27, WriteData, decoder_output[27], Clk);
// 	register32 reg32_28(input28, WriteData, decoder_output[28], Clk);
// 	register32 reg32_29(input29, WriteData, decoder_output[29], Clk);
// 	register32 reg32_30(input30, WriteData, decoder_output[30], Clk);
// 	register32 reg32_31(input31, WriteData, decoder_output[31], Clk);

// 	// Multiplexors x2
// 	mux32to1by32	mux1(ReadData1, 5'd10 , input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);
// 	mux32to1by32	mux2(ReadData2, ReadRegister2, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);

// endmodule

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
	// assign ReadData1 = 42;
	// assign ReadData2 = 42;

	wire not_RegWrite;
	not not1(not_RegWrite, RegWrite);

	// Decoder to choose which address we are writing to and if its enabled
	wire [31:0] decoder_output;
	decoder1to32 decoder1(decoder_output, not_RegWrite, WriteRegister);

	// 32 Registers (including 1 zero one)
	wire[31:0]  input0, input1, input2, input3, input4, input5, input6, input7, input8, input9;
	wire[31:0]	input10, input11, input12, input13, input14, input15, input16, input17, input18, input19;
	wire[31:0]	input20, input21, input22, input23, input24, input25, input26, input27, input28, input29;
	wire[31:0]	input30, input31;

	//Zero register (0th one)
	register32zero register_zero_1(input0, WriteData, decoder_output[0], Clk);

	// Other Registers
	register32 reg32_1(input1, WriteData, decoder_output[1], Clk);
	register32 reg32_2(input2, WriteData, decoder_output[2], Clk);
	register32 reg32_3(input3, WriteData, decoder_output[3], Clk);
	register32 reg32_4(input4, WriteData, decoder_output[4], Clk);
	register32 reg32_5(input5, WriteData, decoder_output[5], Clk);
	register32 reg32_6(input6, WriteData, decoder_output[6], Clk);
	register32 reg32_7(input7, WriteData, decoder_output[7], Clk);
	register32 reg32_8(input8, WriteData, decoder_output[8], Clk);
	register32 reg32_9(input9, WriteData, decoder_output[9], Clk);
	register32 reg32_10(input10, WriteData, decoder_output[10], Clk);
	register32 reg32_11(input11, WriteData, decoder_output[11], Clk);
	register32 reg32_12(input12, WriteData, decoder_output[12], Clk);
	register32 reg32_13(input13, WriteData, decoder_output[13], Clk);
	register32 reg32_14(input14, WriteData, decoder_output[14], Clk);
	register32 reg32_15(input15, WriteData, decoder_output[15], Clk);
	register32 reg32_16(input16, WriteData, decoder_output[16], Clk);
	register32 reg32_17(input17, WriteData, decoder_output[17], Clk);
	register32 reg32_18(input18, WriteData, decoder_output[18], Clk);
	register32 reg32_19(input19, WriteData, decoder_output[19], Clk);
	register32 reg32_20(input20, WriteData, decoder_output[20], Clk);
	register32 reg32_21(input21, WriteData, decoder_output[21], Clk);
	register32 reg32_22(input22, WriteData, decoder_output[22], Clk);
	register32 reg32_23(input23, WriteData, decoder_output[23], Clk);
	register32 reg32_24(input24, WriteData, decoder_output[24], Clk);
	register32 reg32_25(input25, WriteData, decoder_output[25], Clk);
	register32 reg32_26(input26, WriteData, decoder_output[26], Clk);
	register32 reg32_27(input27, WriteData, decoder_output[27], Clk);
	register32 reg32_28(input28, WriteData, decoder_output[28], Clk);
	register32 reg32_29(input29, WriteData, decoder_output[29], Clk);
	register32 reg32_30(input30, WriteData, decoder_output[30], Clk);
	register32 reg32_31(input31, WriteData, decoder_output[31], Clk);

	// Multiplexors x2
	mux32to1by32	mux1(ReadData1, ReadRegister1, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);
	mux32to1by32	mux2(ReadData2, ReadRegister2, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);

endmodule