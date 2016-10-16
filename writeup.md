# CompArch HW4 Write Up

## Register Circuit Diagrams
Positive edge triggered D Flip Flop with enable
```
     .-----------------------.
     |          ________     |
     '----|\   |        |    |
          | |--|D      Q|----'----q
 d--------|/   |        |
           |   |        |
 wrenable--'   |        |
               |        |
 clk-----------|CLK   Q'|-
               |________|
       
```

Positive edge triggered D Flip Flop with enable (gated clock)
```
                  ________
                 |        |
 d---------------|D      Q|----q
                 |        |
 wrenable--|&&   |        |
           |&&---|CLK   Q'|-
 clk-------|&&   |________|
       
```

## Behavioral Verilog Decoder
The `<<` is the left shift operator. By left shifting `enable` by `address` bits, the `enable` bit will end up in the `address` position, with all other bits as zero. In the case that `enable` is `1`, the `address` bit will be `1`, which is the definition of a decoder. In the case that `enable` is `0`, the entire bit string will be `0`s, which is the expected output when `enable` is false.
