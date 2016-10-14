CC=iverilog
OUT=run.out

all:
	echo "make {register32}"

register32: register32.v register32.t.v
	$(CC) -o $(OUT) register32.t.v && ./$(OUT)

mux32: mux32.v mux32.t.v
	$(CC) -o $(OUT) mux32.t.v && ./$(OUT)

clean:
	rm -r $(OUT)
