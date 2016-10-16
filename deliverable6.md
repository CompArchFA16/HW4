# Deliverable 6

A typical decoder converts an enable bit E and an address A into a sequence of 2^N bits, where N is the number of address pins. The code below works by left-shifting the enable bit by the amount specified by the address bits (range = 0 to 31 base 10). If address is 5 and enable is 1, the decoder will shift the enable bit 1 to the left 5 times, setting all other digits to be 0. The output will be 0b100000 (without zero-padding), which will only transmit a high value to the 5th register as specified by the address bits.

Equivalently, the left-shift operator can be seen as a power function that keeps multiplying the enable bit by 2 until it reaches 2^A.

```verilog
module decoder1to32
(
output[31:0]    out,
input           enable,
input[4:0]      address
);
    assign out = enable<<address; 
endmodule
```
