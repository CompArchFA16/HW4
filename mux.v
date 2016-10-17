module mux32to1by1
(
    output out,
    input[4:0] address,
    input[31:0] inputs
);

    assign out=inputs[address];

endmodule

module mux32to1by32
(
    output[31:0] out,
    input[4:0] address,
    input[32*32-1:0] input0
);

    wire[31:0] mux[31:0];

    genvar i;
    generate
    for (i=0; i < 32; i=i+1) begin: registers
        assign mux[i] = input0[32*(i+1)-1:32*i];
    end
    endgenerate

    assign out = mux[address];

endmodule

