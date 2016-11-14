// Single-bit D Flip-Flop with enable
//   Positive edge triggered

module register #( parameter width  = 1 ) (
  output reg [width-1:0] q,
  input	[width-1:0] d,
  input	wrenable,
  input	clk
);
  always @(posedge clk) begin
    if(wrenable) begin
      q = d;
    end
  end
endmodule
