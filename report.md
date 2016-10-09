### Deliverable 1

// todo

### Deliverable 6

*decoder1to32* works using the bit shifting operator in Verilog. The shift operator takes two operands. The first operand is the bit string to be shifted. The second operand represents how far the first operand should be shifted.

*enable* will always be a single binary bit representing whether any registers should be written to. The shift operator shifts the *enable* bit over by the value of *address* so that the *enable* bit is at address *address* in the 32 bit wire which controls the write functionality for all registers.

e.g. 0000 0000 0000 0000 0000 0000 0100 0000 = 1<<00110