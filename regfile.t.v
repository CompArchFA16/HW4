//------------------------------------------------------------------------------
// Test harness validates hw4testbench by connecting it to various functional
// or broken register files, and verifying that it correctly identifies each
//------------------------------------------------------------------------------
`include "decoders.v"
`include "register.v"
`include "regfile.v"

module hw4testbenchharness();

  wire[31:0]	ReadData1;	// Data from first register read
  wire[31:0]	ReadData2;	// Data from second register read
  wire[31:0]	WriteData;	// Data to write to register
  wire[4:0]	ReadRegister1;	// Address of first register to read
  wire[4:0]	ReadRegister2;	// Address of second register to read
  wire[4:0]	WriteRegister;  // Address of register to write
  wire		RegWrite;	// Enable writing of register when High
  wire		Clk;		// Clock (Positive Edge Triggered)

  reg		begintest;	// Set High to begin testing register file
  wire		dutpassed;	// Indicates whether register file passed tests

  // Instantiate the register file being tested.  DUT = Device Under Test
  regfile DUT
  (
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .WriteData(WriteData),
    .ReadRegister1(ReadRegister1),
    .ReadRegister2(ReadRegister2),
    .WriteRegister(WriteRegister),
    .RegWrite(RegWrite),
    .Clk(Clk)
  );

  // Instantiate test bench to test the DUT
  hw4testbench tester
  (
    .begintest(begintest),
    .endtest(endtest),
    .dutpassed(dutpassed),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .WriteData(WriteData),
    .ReadRegister1(ReadRegister1),
    .ReadRegister2(ReadRegister2),
    .WriteRegister(WriteRegister),
    .RegWrite(RegWrite),
    .Clk(Clk)
  );

  // Test harness asserts 'begintest' for 1000 time steps, starting at time 10
  initial begin
    begintest=0;
    #10;
    begintest=1;
    #1000;
  end

  // Display test results ('dutpassed' signal) once 'endtest' goes high
  always @(posedge endtest) begin
    $display("DUT passed?: %b", dutpassed);
  end

endmodule


//------------------------------------------------------------------------------
// Your HW4 test bench
//   Generates signals to drive register file and passes them back up one
//   layer to the test harness. This lets us plug in various working and
//   broken register files to test.
//
//   Once 'begintest' is asserted, begin testing the register file.
//   Once your test is conclusive, set 'dutpassed' appropriately and then
//   raise 'endtest'.
//------------------------------------------------------------------------------

module hw4testbench
(
// Test bench driver signal connections
input	   		begintest,	// Triggers start of testing
output reg 		endtest,	// Raise once test completes
output reg 		dutpassed,	// Signal test result

// Register File DUT connections
input[31:0]		ReadData1,
input[31:0]		ReadData2,
output reg[31:0]	WriteData,
output reg[4:0]		ReadRegister1,
output reg[4:0]		ReadRegister2,
output reg[4:0]		WriteRegister,
output reg		RegWrite,
output reg		Clk
);

  // Initialize register driver signals
  reg write_broken, decoder_broken, register_not_zero, always_reads_reg_17;
  initial begin
    WriteData=32'd0;
    ReadRegister1=5'd0;
    ReadRegister2=5'd0;
    WriteRegister=5'd0;
    RegWrite=0;
    Clk=0;

    write_broken=0;
    decoder_broken=0;
    register_not_zero=0;
    always_reads_reg_17=0;
  end

  // Once 'begintest' is asserted, start running test cases
  always @(posedge begintest) begin
    endtest = 0;
    dutpassed = 1;
    #10

  // Test Case 1:
  //   Write '42' to register 2, verify with Read Ports 1 and 2
  //   (Passes because example register file is hardwired to return 42)
  WriteRegister = 5'd2;
  WriteData = 32'd42;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd2;
  #5 Clk=1; #5 Clk=0;	// Generate single clock pulse

  // Verify expectations and report test result
  if((ReadData1 != 42) || (ReadData2 != 42)) begin
    dutpassed = 0;	// Set to 'false' on failure
    $display("Failed TC01: Read and write to register 2 failed");
  end

  // Test Case 2:
  //   Write '15' to register 2, verify with Read Ports 1 and 2
  //   (Fails with example register file, but should pass with yours)
  WriteRegister = 5'd2;
  WriteData = 32'd15;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd2;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 != 15) || (ReadData2 != 15)) begin
    dutpassed = 0;
    $display("Failed TC02: Could not write to register 2");
  end


  // Test Case 3:
  //   Write '15' to register 2, switch write enabled false,
  //   write '30' to register 2, verify that '30' was NOT written.
  //   DELIVERABLE 8 CASE 2: Tests if write enable is ignored.
  WriteRegister = 5'd2;
  WriteData = 32'd15;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd2;
  #5 Clk=1; #5 Clk=0;
  RegWrite = 0;
  WriteRegister = 5'd2;
  WriteData = 32'd30;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 != 15) || (ReadData2 != 15)) begin
    dutpassed = 0;
    write_broken = 1;
    $display("Failed TC03: Write is always enabled for register 2");
  end

  // Test Case 4:
  //   Write '15' to register 16, write '15' to register 31,
  //   write '31' to register 16,
  //   verify that reg 16 was written to and reg 31 has not changed
  //   DELIVERABLE 8 CASE 3: Decoder broken. Multiple registers written to.
  RegWrite = 1;
  ReadRegister1 = 5'd16;
  ReadRegister2 = 5'd28;
  WriteRegister = 5'd16; WriteData = 32'd15;
  #5 Clk=1; #5 Clk=0;
  WriteRegister = 5'd31; WriteData = 32'd15;
  #5 Clk=1; #5 Clk=0;
  WriteRegister = 5'd16; WriteData = 32'd31;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 != 31) || (ReadData2 != 15)) begin
    dutpassed = 0;
    decoder_broken = 1;
    $display("Failed TC04: Decoder broken. Multiple registers written to");
  end

  // Test Case 5:
  //   Attempt to write '15' to register 0
  //   DELIVERABLE 8 CASE 4: Register 0 does not hold constant of zero.
  RegWrite = 1;
  ReadRegister1 = 5'd0;
  ReadRegister2 = 5'd0;
  WriteRegister = 5'd0; WriteData = 32'd15;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 != 0) || (ReadData2 != 0)) begin
    dutpassed = 0;
    register_not_zero = 1;
    $display("Failed TC05: Register 0 does not hold constant of zero");
  end

  // Test Case 6:
  //
  //   DELIVERABLE 8 CASE 5: Port 2 always reads register 17.
  RegWrite = 1;
  ReadRegister1 = 5'd5;
  ReadRegister2 = 5'd5;
  WriteRegister = 5'd5; WriteData = 32'd15;
  #5 Clk=1; #5 Clk=0;
  WriteRegister = 5'd17; WriteData = 32'd31;
  #5 Clk=1; #5 Clk=0;

  if((ReadData2 == 31)) begin
    dutpassed = 0;
    always_reads_reg_17 = 1;
    $display("Failed TC06: Port 2 always reads register 17");
  end

  // Report classifications
  if(!(write_broken || decoder_broken || register_not_zero || always_reads_reg_17)) begin
    $display("CLASS 1 REGISTER: A fully perfect register file");
  end
  if(write_broken) begin
    $display("CLASS 2 REGISTER: Write Enable is broken / ignored – Register is always written to");
  end
  if(decoder_broken) begin
    $display("CLASS 3 REGISTER: Decoder is broken – All registers are written to");
  end
  if(register_not_zero) begin
    $display("CLASS 4 REGISTER: Register Zero is actually a register instead of the constant value zero");
  end
  if(always_reads_reg_17) begin
    $display("CLASS 5 REGISTER: Port 2 is broken and always reads register 17");
  end

  // All done!  Wait a moment and signal test completion.
  #5
  endtest = 1;

end

endmodule