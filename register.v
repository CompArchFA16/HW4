// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg q,
input d,
input wrenable,
input clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule

module register32
(
output reg [31:0] q,
input [31:0] d,
input wrenable,
input clk
);
    always @(posedge clk) begin
        if(wrenable) begin
            q[31:0] = d[31:0];
        end
    end

endmodule

module register32zero
(
output reg [31:0] q,
input [31:0] d,
input wrenable,
input clk
);
    always @(posedge clk) begin
        if(wrenable) begin
            q[31:0] = 32'b0;
        end
    end

endmodule
