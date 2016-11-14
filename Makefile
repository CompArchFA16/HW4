run: build
	./regfile.o

build:
	iverilog -Wall -o regfile.o regfile.t.v

clean:
	rm *.o *.out *.vcd
