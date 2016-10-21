`timescale 1 ns / 1 ps
`include "decoders.v"

module testDecoder();
    reg enable;
    reg[4:0] address;
    wire[31:0] out;
    
    decoder1to32 decoder (out, enable, address);

    initial begin
        $display("En Add | Out");
        enable = 0; address = 0; #500
        $display("%b %b | %b", enable, address, out);
        enable = 1; address = 4; #500
        $display("%b %b | %b", enable, address, out);
        enable = 0; address = 4; #500
        $display("%b %b | %b", enable, address, out);
        enable = 1; address = 6; #500
        $display("%b %b | %b", enable, address, out);
        enable = 2; address = 6; #500
        $display("%b %b | %b", enable, address, out);
    end

endmodule
