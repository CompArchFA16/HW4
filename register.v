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
(
output reg[31:0]	q,
input[31:0]			d,
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
(
output reg[31:0]	q,
input[31:0]			d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = 32'b0;
        end
    end

endmodule

module mux32to1by1
(
output      out,
input[4:0]  address,
input[31:0] inputs
);
  assign out = inputs[address];
endmodule