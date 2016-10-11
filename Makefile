all : register.o

register.o : register.v register.t.v
	iverilog register.t.v -o register.o
