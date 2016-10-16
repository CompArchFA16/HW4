run: build
	./regfile.o

build:
	iverilog -Wall -o regfile.o regfile.t.v