// Anna Buchele HW4 Modules

module register32    //Deliverable 2
(
output reg [31:0]	q, //32-bit output q
input	[31:0]	d,     //32-bit input d
input		wrenable,    //1-bit write-enable
input		clk          //1-bit clock
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule


module register32zero //Deliverable 3
(
output reg [31:0]	q,  //32-bit output q, which is always zeros
input  [31:0]  d,     //32-bit input d
input   wrenable,     //1-bit write-enable
input   clk           //1-bit clock
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = 0;    //outputs zeros only
        end
    end

endmodule



module mux32to1by1   //Deliverable 4
(
output      out,     //1-bit output
input[4:0]  address, //5-bit address
input[31:0] inputs   //32-bit input
);
  reg out;
  always @(inputs or address) //Runs if inputs or address changes
    out = inputs[address];    //Outputs the inputs at the address
endmodule



module mux32to1by32      //Deliverable 5
(
output[31:0]    out,     //32-bit output
input[4:0]      address, //5-bit address
input[31:0]     input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31
);

  wire[31:0] mux[31:0];         // Create a 2D array of wires
  assign mux[0] = input0;       // Connect the sources of the array
  assign mux[1] = input1;
  assign mux[2] = input2;
  assign mux[3] = input3;
  assign mux[4] = input4;
  assign mux[5] = input5;
  assign mux[6] = input6;
  assign mux[7] = input7;
  assign mux[8] = input8;
  assign mux[9] = input9;
  assign mux[10] = input10;       
  assign mux[11] = input11;
  assign mux[12] = input12;
  assign mux[13] = input13;
  assign mux[14] = input14;
  assign mux[15] = input15;
  assign mux[16] = input16;
  assign mux[17] = input17;
  assign mux[18] = input18;
  assign mux[19] = input19;
  assign mux[20] = input20;       
  assign mux[21] = input21;
  assign mux[22] = input22;
  assign mux[23] = input23;
  assign mux[24] = input24;
  assign mux[25] = input25;
  assign mux[26] = input26;
  assign mux[27] = input27;
  assign mux[28] = input28;
  assign mux[29] = input29;
  assign mux[30] = input30;     
  assign mux[31] = input31;


  assign out = mux[address];    // Connect the output of the array
endmodule

module decoder1to32
(
output[31:0]    out,
input           enable,
input[4:0]      address
);
    assign out = enable<<address; 
endmodule
//Deliverable 6:
//This module works by shifting the enable input left by the address number of bits. So, it will output 32-bits of zeros, except with one of the bits set to the enable. 
//So, if the address is d8 (and enable is 1), the decoder will output all zeros, except for the eighth bit from the right, which will be set to one.