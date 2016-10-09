// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end
endmodule

module register32
// same module register as above but have 32 registers
(
output[31:0] reg q,
input[31:0] 	 d,
input			 wrenable,
input			 clk
);

wire[5:0] i;	//indexing used in for loop

	always @(posedge clk) begin
		if (wrenable) begin
			for (i=6'b000000, i<6'b100000, i=i+1) begin:
				q[i] = d[i];
			end
		end

	end
endmodule

module register32zero
// same module register as above but have 32 registers
(
output[31:0] reg q,
input[31:0] 	 d,
input			 wrenable,
input			 clk
);

wire[5:0] i;	//indexing used in for loop

	always @(posedge clk) begin
		if (wrenable) begin
			for (i=6'b000000, i<6'b100000, i=i+1) begin:
				q[i] = 0;
			end
		end

	end
endmodule