`include "mux.v"

//module test_mux();
//
//wire		out;
//reg [5:0]	address;
//reg [31:0]	regs;
//
//mux32to1by1 mux(out,address[4:0],regs);
//
//initial begin
//	regs = {8{4'b1000}};
//	for (address = 0; address < (1 << 5); address = address + 1) begin
//		#50
//		$display("%b %b %b", out, address, regs);
//	end
//end
//
//endmodule

module test_mux();

wire [31:0]	out;

reg [5:0] address;

reg [31:0] inputs [31:0];

mux32to1by32 mux(out,address[4:0], 
				inputs[0], inputs[1], inputs[2], inputs[3], 
				inputs[4], inputs[5], inputs[6], inputs[7], 
				inputs[8], inputs[9], inputs[10], inputs[11], 
				inputs[12], inputs[13], inputs[14], inputs[15], 
				inputs[16], inputs[17], inputs[18], inputs[19], 
				inputs[20], inputs[21], inputs[22], inputs[23], 
				inputs[24], inputs[25], inputs[26], inputs[27], 
				inputs[28], inputs[29], inputs[30], inputs[31]);

initial begin

	// initialize inputs
	for (address = 0; address < (1 << 5); address = address + 1) begin
		inputs[address] = address + 5;
	end

	$display("IN ADR OUT");
	for (address = 0; address < (1 << 5); address = address + 1) begin
		#50
		$display("%d %d %d", inputs[address], address, out);
	end
end

endmodule
