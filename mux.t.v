`include "mux.v"

module muxTest();
    reg[31:0] inputs;
    reg[4:0] address;
    wire out;

    mux32to1by1 mux0(out, address, inputs);

    initial begin
        inputs=1;
        address=1;
        $display("%b", out);
    end
endmodule
