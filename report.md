### Deliverable 1

#### Method 1
```verilog
module register
(
output reg  q,
input       d,
input       wrenable,
input       clk
);
    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end
endmodule
```

#### Method 2
```verilog
always @(posedge (clk & wrenable)) begin
    q = d;
end
```
#### Structural equivalant for the above register implementations
![Schematic for Deliverable 1](https://github.com/iangmhill/HW4/blob/master/images/deliverable1.jpg "Schematic for Deliverable 1")



### Deliverable 6

*decoder1to32* works using the bit shifting operator in Verilog. The shift operator takes two operands. The first operand is the bit string to be shifted. The second operand represents how far the first operand should be shifted.

*enable* will always be a single binary bit representing whether any registers should be written to. The shift operator shifts the *enable* bit over by the value of *address* so that the *enable* bit is at address *address* in the 32 bit wire which controls the write functionality for all registers.

e.g. 0000 0000 0000 0000 0000 0000 0100 0000 = 1<<00110