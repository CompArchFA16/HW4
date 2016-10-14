// Testbench for 32:1 multiplexer and 32:32 multiplexer

`include "mux32.v"

module testMux32();
    reg [4:0] address;
    reg [31:0] inputs;
    wire out;
    wire [31:0] out32;

    mux32to1by1 mux (out, address, inputs);
    mux32to1by32 mux32 (out32, address, {32{inputs[0]}}, {32{inputs[1]}}, {32{inputs[2]}}, {32{inputs[3]}}, {32{inputs[4]}}, {32{inputs[5]}}, {32{inputs[6]}}, {32{inputs[7]}}, {32{inputs[8]}}, {32{inputs[9]}}, {32{inputs[10]}}, {32{inputs[11]}}, {32{inputs[12]}}, {32{inputs[13]}}, {32{inputs[14]}}, {32{inputs[15]}}, {32{inputs[16]}}, {32{inputs[17]}}, {32{inputs[18]}}, {32{inputs[19]}}, {32{inputs[20]}}, {32{inputs[21]}}, {32{inputs[22]}}, {32{inputs[23]}}, {32{inputs[24]}}, {32{inputs[25]}}, {32{inputs[26]}}, {32{inputs[27]}}, {32{inputs[28]}}, {32{inputs[29]}}, {32{inputs[30]}}, {32{inputs[31]}});

    initial begin
        $display("address  inputs                           | out  out32                            | out (expected)");
        address='d0;inputs=32'b11111111111111111111111111111110; #500
        $display("%-2d       %b | %b    %b | 0", address, inputs, out, out32);
        inputs=32'b00000000000000000000000000000001; #500
        $display("%-2d       %b | %b    %b | 1", address, inputs, out, out32);
        address='d13;inputs=32'b11111111111111111101111111111111; #500
        $display("%-2d       %b | %b    %b | 0", address, inputs, out, out32);
        address='d27;inputs=32'b00001000000000000000000000000000; #500
        $display("%-2d       %b | %b    %b | 1", address, inputs, out, out32);
    end

endmodule