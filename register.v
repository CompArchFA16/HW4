// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

	// on pos edge of clock, output q as d (d flip flop)
    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end
endmodule

module register32
//parameterizing as reccomended in lab
#(parameter b=31)
// same module register as above but have 32 registers
(
output reg[b:0] q,
input[b:0] 	 d,
input			 wrenable,
input			 clk
);

	// same process as register above, but q and hold 32 bits now
	always @(posedge clk) begin
		if (wrenable) begin
				q = d;
			end
	end


endmodule

module register32zero
#(parameter b=31)
// same module register as above but have 32 registers
// outputs only zeros
(
output reg[b:0] q,
input[b:0] 	 d,
input			 wrenable,
input			 clk
);

	always @(posedge clk) begin
		if (wrenable) begin
				q = {b{1'b0}};
			end
	end
endmodule

