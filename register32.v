// 32-bit D Flip-Flop with enable, positive edge triggered
// Also includes zero register

`include "register.v"

module register32
(
    output [31:0] q,
    input [31:0] d,
    input wrenable,
    input clk
);
    wire [31:0] d;
    wire wrenable, clk;

    // 32 single-bit registers
    genvar i;
    generate
        for (i=0; i < 32; i=i+1) begin : createRegBits
            register _register(q[i], d[i], wrenable, clk);
        end
    endgenerate

endmodule

module register32zero
(
    output [31:0] q,
    input [31:0] d,
    input wrenable,
    input clk
);
    wire [31:0] d;
    wire wrenable, clk;

    // always output 0
    assign q = 32'd0;

endmodule