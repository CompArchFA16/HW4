all : register.o regfile.o mux.o

regfile.o : regfile.v regfile.t.v
	iverilog regfile.t.v -o regfile.o
register.o : register.v register.t.v
	iverilog register.t.v -o register.o

mux.o : mux.v mux.t.v
	iverilog mux.t.v -o mux.o

clean:
	rm *.o
