# To run the simulation of the full system type "make run" in the root directory of the repo
# What is sent through morse code can be changed in the test bench and there are instructions
# there on how to do so. If one wishes to run another test bench type "make run  TEST = *.t.v"
# in the repo root directory for the desired test to run..

ICARUS_OPTIONS := -Wall
IVERILOG := iverilog $(ICARUS_OPTIONS)
SIM := vvp

TEST:= MorseDecoder

%.vvp: %.t.v %.v
	$(IVERILOG) -o $@ $<

run: $(TEST).vvp
	$(SIM) $<

clean:
	rm *.vvp; rm *.vcd
