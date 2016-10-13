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
//parameterizing as reccomended in lab
#(parameter a=32, parameter b=a-1)
// same module register as above but have 32 registers
(
output reg[b:0] q,
input[b:0] 	 d,
input			 wrenable,
input			 clk
);

// is making an index variable like this legal?
//wire[5:0] i;	//indexing used in for loop
// generate
// 	genvar i;
// // what does it mean parameterizing this width?
// 	always @(posedge clk) begin
// 		if (wrenable) begin
// 			for (i=6'b000000; i<6'b100000; i=i+1) begin: q_to_d
// 				q[i] = d[i];
// 			end
// 		end


// 	end
// endgenerate

	always @(posedge clk) begin
		if (wrenable) begin
				q = d;
			end
	end


endmodule

module register32zero
#(parameter a=32, parameter b=a-1)
// same module register as above but have 32 registers
// outputs only zeros
(
output reg[31:0] q,
input[31:0] 	 d,
input			 wrenable,
input			 clk
);

// generate
// 	genvar i;
// // what does it mean parameterizing this width?
// 	always @(posedge clk) begin
// 		if (wrenable) begin
// 			for (i=6'b000000; i<6'b100000; i=i+1) begin: q_to_d
// 				q[i] = 1'b0;
// 			end
// 		end


// 	end
// endgenerate

	always @(posedge clk) begin
		if (wrenable) begin
				q = {b{1'b0}};
			end
	end
endmodule

