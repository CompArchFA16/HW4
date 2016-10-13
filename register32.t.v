// Testbench for 32-bit D Flip-Flop with enable

`include "register32.v"

module testRegister32();
    reg [31:0] d;
    reg wrenable, clk;
    wire [31:0] q;

    register32 register (q, d, wrenable, clk);

    initial begin
        $display("d            en  clk | q           | q (expected)");
        d=32'd123456789;wrenable=0;clk=0; #500
        $display("%-11d  %b   %b   | %-11d | x", d, wrenable, clk, q);
        d=32'd123456789;wrenable=1;clk=0; #500
        $display("%-11d  %b   %b   | %-11d | x", d, wrenable, clk, q);
        d=32'd123456789;wrenable=1;clk=1; #500
        $display("%-11d  %b   %b   | %-11d | 123456789", d, wrenable, clk, q);
        d=32'd666666;wrenable=0;clk=0; #500
        $display("%-11d  %b   %b   | %-11d | 123456789", d, wrenable, clk, q);
        d=32'd666666;wrenable=0;clk=1; #500
        $display("%-11d  %b   %b   | %-11d | 123456789", d, wrenable, clk, q);
        d=32'd666666;wrenable=1;clk=0; #500 clk=1; #500
        $display("%-11d  %b   %b   | %-11d | 666666", d, wrenable, clk, q);
    end
endmodule