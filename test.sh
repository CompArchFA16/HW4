#!/bin/bash

echo "Testing register modules."

iverilog -o regfile regfile.t.v

./regfile
