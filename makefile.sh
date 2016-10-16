 #! /bin/bash
 iverilog -o reg regfile.v
 iverilog -o reg regfile.t.v
./reg