// Single-bit D Flip-Flop with enable
//   Positive edge triggered
// module register
// (
// output reg	q,
// input		d,
// input		wrenable,
// input		clk
// );
//
//     always @(posedge clk) begin
//         if(wrenable) begin
//             q = d;
//         end
//     end
// endmodule

//32 bit D Flip Flop with enable
//Positive edge triggered

// module register32
// (
// output reg	[31:0] q,
// input		[31:0] d,
// input		wrenable,
// input		clk
// );
//
//     always @(posedge clk) begin
//         if(wrenable) begin
//              q = d;
//         end
//     end
//
// endmodule

module register32
(
    output reg [31:0] q,
    input      [31:0] d,
    input       wrenable,
    input       clk
    );

    genvar i;

    generate
        for(i=0; i<32; i=i+1)
        begin: Allbits
            always @(posedge clk) begin
                if (wrenable) begin
                    q[i] = d[i];
                end
            end
        end
    endgenerate
endmodule

//32 bit zero output with enable
//Positive edge triggered

module register32zero
(
output reg	[31:0] q,
input		[31:0] d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
             q = 32'd0;
        end
    end

endmodule


// module quicktest();
//     reg[31:0] d;
//     reg wrenable, clk;
//     wire[31:0] q;
//
//     register32zero registermine (q, d, wrenable, clk);
//
//     initial begin
//         clk = 0; #10
//
//         d = 32'd50;
//         wrenable = 1;
//         clk = 1; #10;
//
//         $display("Output: %d", q);
//     end
// endmodule
