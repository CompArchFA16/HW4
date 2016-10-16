module mux32to1by32
(
  output [31:0] out,
  input  [4:0]  address,
  input  [31:0] [31:0] inputs
);

  // Create a 2D of wires
  wire [31:0] mux [31:0];

  // Connect the sources of the array
  assign mux[0] = inputs[0];
  assign mux[1] = inputs[1];
  assign mux[2] = inputs[2];
  assign mux[3] = inputs[3];
  assign mux[4] = inputs[4];
  assign mux[5] = inputs[5];
  assign mux[6] = inputs[6];
  assign mux[7] = inputs[7];
  assign mux[8] = inputs[8];
  assign mux[9] = inputs[9];
  assign mux[10] = inputs[10];
  assign mux[11] = inputs[11];
  assign mux[12] = inputs[12];
  assign mux[13] = inputs[13];
  assign mux[14] = inputs[14];
  assign mux[15] = inputs[15];
  assign mux[16] = inputs[16];
  assign mux[17] = inputs[17];
  assign mux[18] = inputs[18];
  assign mux[19] = inputs[19];
  assign mux[20] = inputs[20];
  assign mux[21] = inputs[21];
  assign mux[22] = inputs[22];
  assign mux[23] = inputs[23];
  assign mux[24] = inputs[24];
  assign mux[25] = inputs[25];
  assign mux[26] = inputs[26];
  assign mux[27] = inputs[27];
  assign mux[28] = inputs[28];
  assign mux[29] = inputs[29];
  assign mux[30] = inputs[30];
  assign mux[31] = inputs[31];

  // Connect the output of the array
  assign out = mux[address];

endmodule
