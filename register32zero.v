
module register32zero
(
output reg[31:0] q,
input[31:0] d,
input wrenable,
input clk
);

always @(posedge clk)begin
    q = 00000000000000000000000000000000;
end

endmodule
