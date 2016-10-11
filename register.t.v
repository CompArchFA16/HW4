`include "register.v"

module test_register();

reg d, en;

reg clk = 0;

wire q;

register r(q,d,en,clk);

always begin
	#50 clk = !clk;
end
//
//initial begin
//	$display("Q D EN CLK");
//	en = 1; d = 1;
//	#500; $display("%b %b %b %b", q, d, en, clk);
//	en = 1; d = 0;
//	#500; $display("%b %b %b %b", q, d, en, clk);
//end
//
endmodule

module test_register32();

reg [31:0] d;
reg en;
reg clk = 0;
wire [31:0] q;

register32 #(.n(32)) r(q,d,en,clk);

always begin
	#50 clk = !clk;
end

//initial begin
//	$display("Q D EN CLK");
//	en = 1; d = 32'd5;
//	#500; $display("%d %d %b %b", q, d, en, clk);
//
//	en = 0; d = 32'd7;
//	#500; $display("%d %d %b %b", q, d, en, clk);
//
//	en = 1; d = 32'd7;
//	#500; $display("%d %d %b %b", q, d, en, clk);
//end

endmodule


module test_register32zero();

reg [31:0] d;
reg en;
reg clk = 0;
wire [31:0] q;

register32zero #(.n(32)) r(q,d,en,clk);

always begin
	#50 clk = !clk;
end

initial begin
	$display("Q D EN CLK");
	en = 1; d = 32'd5;
	#500; $display("%d %d %b %b", q, d, en, clk);

	en = 0; d = 32'd7;
	#500; $display("%d %d %b %b", q, d, en, clk);

	en = 1; d = 32'd7;
	#500; $display("%d %d %b %b", q, d, en, clk);
end

endmodule
