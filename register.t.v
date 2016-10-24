`timescale 1 ns / 1 ps
`include "register.v"

/*module testreg();
    reg[31:0] d;
    reg wrenable, clk;
    wire[31:0] q;

    register32zero Myreg(q, d, wrenable, clk);

    initial begin
    //dump to vcd file so we can look at waveform
    $dumpfile("testreg.vcd");
    $dumpvars(0, testreg);

    $display("  d    q    wrenable    clk");

    #5 clk = 1;
    #5 clk = 0;
    // this is our test bench
    d=32'b11; wrenable = 1'b1;  #1001
    $display(" %b %b  %b   %b", d, q, wrenable, clk);

    end
endmodule

*/

module testmux();
    wire out;
    reg [4:0] address;
    reg[31:0] inputs;


    mux32to1by1 MyMux(out, address, inputs);

    initial begin
    //dump to vcd file so we can look at waveform
    $dumpfile("testmux.vcd");
    $dumpvars(0, testmux);

    $display("  address    inputs     out");


    // this is our test bench
    inputs=32'h13; address= 5'b1;  #1001
    $display(" %b %b  %b ", address, inputs, out);

    end
endmodule

