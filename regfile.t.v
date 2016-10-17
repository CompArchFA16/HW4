`include "regfile.v"

`define TICK #5 Clk=1; #5 Clk=0	// Generate single clock pulse

//------------------------------------------------------------------------------
// Test harness validates hw4testbench by connecting it to various functional 
// or broken register files, and verifying that it correctly identifies each
//------------------------------------------------------------------------------

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

reg [32:0] it; // iterator, with one more bit for comparison against "max" value (1 << 32)
reg [32:0] it2; // another iterator

reg [31:0] dummy [31:0]; // storage for temporary variables, etc.
reg [31:0] dummy2 [31:0]; // another dummy

  // Initialize register driver signals
  initial begin
    WriteData=32'd0;
    ReadRegister1=5'd0;
    ReadRegister2=5'd0;
    WriteRegister=5'd0;
    RegWrite=0;
    Clk=0;
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
    $display("Test Case 1 Failed");
  end

  // Test Case 2: 
  //   Write '15' to register 2, verify with Read Ports 1 and 2
  //   (Fails with example register file, but should pass with yours)
  WriteRegister = 5'd2;
  WriteData = 32'd15;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd2;
  `TICK;

  if((ReadData1 != 15) || (ReadData2 != 15)) begin
    dutpassed = 0;
    $display("Test Case 2 Failed");
  end

  // Test Case 8-1 (all perfect) will be addressed last
  // because it encompasses other error cases as well.

  // Test Case 8-2 :
  // Write Enable is Broken, always written to
  // 
  for(it=0; it<32'd1000; it=it+1) begin
	  // test random numbers over 1000 iterations
	  
	  // first, clear buffer with random number :
	  WriteRegister = {$random} % (1 << 5);
	  ReadRegister1 = WriteRegister;
	  ReadRegister2 = WriteRegister;
	  WriteData = {$random};
	  RegWrite = 1'b1; // clear buffer with random number
	  `TICK;

	  // now test if write enable is broken :
	  dummy[0] = 0;
	  while(dummy[0] == 0) begin
		  dummy[0] = {$random};
	  end

	  WriteData = dummy[0] ^ WriteData; // guaranteed to be different from previous, since dummy[0] != 0
	  //RegWrite = 1'b1; // emulate broken write enable
	  RegWrite = 1'b0;
	  ReadRegister1 = WriteRegister;
	  ReadRegister2 = WriteRegister;
	  `TICK;
	  if((ReadData1 == WriteData) || (ReadData2 == WriteData)) begin
		dutpassed = 0;
		$display("Test Case 8-2 Failed : Write Enable Broken");
		it = 32'd1000; // break out of for loop
	  end

  end

  // Test Case 8-3 :
  // Decoder is Broken : all registers are written to
  dummy[0] = 0; // set flag to failure
  RegWrite = 1'b1;

  for(it=0; it<32'd1000; it=it+1) begin
	  // test random numbers over 1000 iterations
	  
	  WriteData = 0;
	  for(it2=0; it2<32'd32; it2=it2+1) begin // clear buffers with random numbers
		  WriteRegister = it2[4:0];
		  WriteData = WriteData + 1;
		  `TICK;
	  end

	  // now test if write enable is broken :
	  WriteData = {$random};

	  // emulate broken decoder
	  //dummy[1] = WriteRegister;
	  //for(it2=0; it2<32'd32; it2=it2+1) begin
	  //    WriteRegister = it2[4:0];
	  //    ReadRegister1 = WriteRegister;
	  //    `TICK;
	  //end
	  //WriteRegister = dummy[1];

	  for(it2=1; it2<32'd32; it2=it2+1) begin
		// start from 1, i.e. skip register 0 as it always outputs 0. 
		
		  ReadRegister1 = it2;
		  ReadRegister2 = it2;
		  `TICK;
		  if((ReadData1 != WriteData) || (ReadData2 != WriteData)) begin
			  dummy[0] = 1; // set flag to success (i.e. it at least passed this test)
			  it2 = 16'd32;
			  it = 32'd1000; // break out of for loop
		  end
	  end
  end

  if( dummy[0] ==  0) begin
	  dutpassed = 0;
	  $display("Test Case 8-3 Failed : Decoder Broken");
  end


  // Test Case 8-4 : 
  // Register Zero is a Register

  // emulate "register 0" with real register
  //WriteRegister = 1;
  //ReadRegister1 = 1;
  //ReadRegister2 = 1;

  WriteRegister = 0;
  ReadRegister1 = 0;
  ReadRegister2 = 0;
  RegWrite = 1'b1;
  for(it=0; it<32'd1000; it=it+1) begin
	  WriteData = {$random};
	  `TICK;
	  if(WriteData & (ReadData1 |  ReadData2)) begin // readdata1 and readdata2 and writedata are all nonzero
		dutpassed = 0;
		$display("Test Case 8-4 Failed : Register Zero is a Register");
		it = 32'd1000; //break
	  end
  end

  // Test Case 8-5 :
  // Port 2 is broken and always reads Register 17
  RegWrite = 1'b1;
  dummy[0] = 0; // set flag to failure
  for(it=0; it<32'd1000; it=it+1) begin
	  WriteData = {$random};
	  WriteRegister = {$random}; // keep changing the registers randomly in the background, to minimize possible oddity

	  ReadRegister1 = 17; // keep on reading reg. 17

	  while(ReadRegister2 == 17) begin // ensure port 2 doesn't read 17
		  ReadRegister2 = {$random};
	  end

	  //ReadRegister2 = 17; //emulate broken behavior: always read 17
	  `TICK;
	  
	  if (ReadData1 != ReadData2) begin // Port 2 clearly didn't read Register 17
		  dummy[0] = 1;
		it = 32'd1000; //break
	  end
  end

  if(dummy[0] == 0) begin // Port 2 always read Reg 17
	  dutpassed = 0;
	  $display("Test Case 8-4 Failed : Port 2 is Broken");
  end

  // Test Case 8-1 comes last, because it encompasses results from previous
  // test cases. By now, we know that enable, reg0 and address work without
  // issues. 

  // Test Case 8-1 : 
  // Fully Perfect Register File
  
  // Test Reading and Writing
  dummy[0] = 0;  // set reg0 to 0
  dummy2[0] = 1; // set default success
  for(it = 0; it < 32'd100; it=it+1) begin
      for(it2=0; it2 < 32'd32; it2=it2+1) begin
    	  WriteRegister = it2;
    	  WriteData = {$random};
    	  RegWrite = 1;
    	  if(it2) begin
       	  dummy[it2] = WriteData; // keep a copy of the register
    	  end	
    	  `TICK;
      end

      for(it2=0; it2 < 32'd16; it2 = it2+1) begin
    	  ReadRegister1 = it2 * 2; // test even index
    	  ReadRegister2 = it2 * 2  + 1; // test odd index
    	  `TICK;
    	  if(dummy[ReadRegister1] != ReadData1 || dummy[ReadRegister2] != ReadData2) begin
			  // presented wrong data in either read or write process
			  dummy2[0] = 0; //set flag to failure
    		  //break
    		  it2 = 32'd16;
    		  it = 32'd100;
    	  end
      end
  end

  if(dummy2[0] == 0) begin
	  dutpassed = 0;
	  $display("Test Case 8-1 Failed : Doesn't read/write correctly");
  end

  // Test Clock - no clock signal, should not behave normally
  dummy[0] = 0;  // set reg0 to 0
  dummy2[0] = 0; // set flag to default failure
  for(it = 0; it < 32'd100; it=it+1) begin
      for(it2=0; it2 < 32'd32; it2=it2+1) begin
    	  WriteRegister = it2;
    	  WriteData = {$random};
    	  RegWrite = 1;
		  if(it2) begin // i.e. skip reg0
			  dummy[it2] = WriteData; // keep a copy of the register
		  end
      end

      for(it2=0; it2 < 32'd16; it2 = it2+1) begin
    	  ReadRegister1 = it2 * 2; // test even index
    	  ReadRegister2 = it2 * 2  + 1; // test odd index
    	  if(dummy[ReadRegister1] != ReadData1 || dummy[ReadRegister2] != ReadData2) begin // == if(error)
			  dummy2[0] = 1; // made an error, therefore behaves as expected => success
    		  //break
    		  it2 = 32'd16;
    		  it = 32'd100;
    	  end
      end
  end

  if(dummy2[0] == 0) begin
	  dutpassed = 0;
	  $display("Test Case 8-1 Failed : Doesn't care about Clock Signal");
  end

  if(dutpassed == 0) begin
	  $display("Test Case 8-1 Failed : Not perfect");
  end

  // All done!  Wait a moment and signal test completion.
  #5
  endtest = 1;

end

endmodule
