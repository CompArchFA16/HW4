#!/bin/bash

echo "Testing register modules ...."
echo ""

iverilog -o register_test regfile.t.v

./register_test
