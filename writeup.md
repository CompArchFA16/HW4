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

## Behavior Verilog Decoder
