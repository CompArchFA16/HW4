#Submission of HW4

The assignment description for this homework can be found on the Olin Computer Architecture GitHub [repo](https://github.com/CompArchFA16/HW4). In overview, the assignment was to use Verilog to design and test a register file. The primary deliverables for the assignment are functional Verilog files, but 2 additonal deliverables are shown below.

##Deliverable 1
In both implementations of a register, the register value (q) is set on the rising edge of the clock. To model this behavior, I included a D Flip-Flop with a clock in both controllers. Where the two implementations differ is how they incorporate the write-enable functionality.

In the first circuit wrenable is the input that switches a 2-input multiplexer. This implementation is better because the register will store the value of q whenever wrenable goes high. It also does not require us to manipulate the clock before it is input to the Flip-Flop, thus the functionality of our clock is preserved.

![alt text](https://github.com/tah20112/HW4/blob/master/Reg1_large.png)

This circuit models the code shown below:

```verilog
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);
    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end
endmodule
```
In the second circuit, wrenable is "anded" with the clock input, which means that the clock input to the D Flip-Flop is low unless write is enabled. When write is enabled, the input has normal clock functionality. This implementation is not ideal because it essentially disables the Flip-Flop if write is not enabled. 

![alt text](https://github.com/tah20112/HW4/blob/master/Reg2_large.png)

This circuit models the code shown below:

```verilog
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);
    always @(posedge (clk & wrenable)) begin
        q = d;
    end
endmodule
```

##Deliverable 6

Explanation