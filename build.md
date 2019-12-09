---
permalink: /build/
title: Build Instructions
---

# Build Instructions

## General Setup (Do This First!)

1. Some software which is necessary before using our morse code decoder are [gtkwave](http://gtkwave.sourceforge.net/) for viewing the results of simulation done of the device done with [Icarus Verilog](http://iverilog.icarus.com/) as well as [Vivado](https://www.xilinx.com/products/design-tools/vivado.html) in order to implement the hardware design on an FPGA. Note that in our testing we used the [Zybo
Zynq-7000 ARM/FPGA SoC Trainer Board](https://reference.digilentinc.com/reference/programmable-logic/zybo/start).
2. After downloading the necessary software go out [GitHub repository](https://github.com/MarkG98/MorseCodeTranslator.git) and clone the `master` and `FPGA` branches.

## Simulation
1. Switch to the `master` branch of the repository.
2. See instructions in `MorseDecoder.t.v` to change what you want to be communicated through Morse code.
3. Run `make run` to compile and run the simulation.
4. Run `gtkwave Decoder.vcd` in the terminal to open the simulation results in gtkwave, and view the letter and done signal to identify the letters which were transmitted and should theoretically
be visible to the user.
5. Optionally, run other test benches for other modules by following instructions in `Makefile` on the `master` branch.

## FPGA Implementation On Zybo Zynq-7000
1. Switch to the `FPGA` branch in the project repository
2. Plug in the FPGA and turn in on.
3. Launch Vivado and select "Create Project"
4. On the Project Type screen, keep default options intact.
5. On the Default Part screen, click "Boards" and select Zybo if you are using the same board referenced in General Setup. Alternativly if you did not install the board files) you can search for the board under "Parts".
6. Take the `ZYBO_Master.xdc` file from the repository and click "Add Sources" and select "Add or create constraints". Select the XDC file, and check "Copy constraints file into project".
7. Expand Constraints, and double clock `ZYBO_Master.xdc` to edit it. Everything is commented (disabled) initially, and you can uncomment elements as needed for your design
 by deleting the `#`. For our project we want the `clk` set property line, and those for the button, LEDs, and the JE PMOD to be uncommented.
8. Next select "Add Sources" and then "Add or create design sources". Here we need to include the following files: `DitDahDecoder.v`, `MorseDecoder.v`, `alphabetMachine.v`, `morse_wrapper.v`,
and `register.v`.
9. Next, perform Synthesis, Implementeation, and Generate Bitstream in order.
10. Open the Hardware Manager and click "Open Target" and then "Autoconnect".
11. Lastly, click "Program Device" and enjoy!
