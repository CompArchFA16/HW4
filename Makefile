default:
	iverilog -o regfile.o decoders.v multiplexers.v regfile.v register.v regfile.t.v

	############################
	# To run, type ./regfile.o #
	############################

clean:
	rm *.o
