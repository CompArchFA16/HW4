`include "register.v"

module register32
(
  output[31:0] outputData,
  input[31:0]  inputData,
  input        wrenable,
  input        clk
);

  genvar i;
  generate
    for (i = 0; i < 31; i = i + 1)
    begin:ALUBitslice32
      register generatedRegister(
        outputData[i],
        inputData[i],
        wrenable,
        clk
      );
    end
  endgenerate
endmodule
