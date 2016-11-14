module register32zero
(
  output[31:0] outputData,
  input[31:0]  inputData,
  input        wrenable,
  input        clk
);
  assign outputData = 32'b0;
endmodule
