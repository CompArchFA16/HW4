#!/bin/bash

#Run the tests
iverilog -o regfile.o regfile.t.v
./regfile.o
rm regfile.o	#remove unwanted files