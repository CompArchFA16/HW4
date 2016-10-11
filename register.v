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
#(parameter n=4)
(
output reg	[n-1:0] q,
input		[n-1:0] d,
input		wrenable,
input		clk
);
    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end
endmodule

module register32zero
#(parameter n=4)
(
output reg	[n-1:0] q,
input		[n-1:0] d,
input		wrenable,
input		clk
);
    always @(posedge clk) begin
        if(wrenable) begin
            q = 32'b0;
        end
    end
endmodule
