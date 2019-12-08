---
permalink: /technology/
title: Technology
---

# Technology

We separated the Morse Decoder into three distinct parts. The first part decodes the signal into a series of DITs, DAHs, GAPs, and SPACEs. The second part takes those and outputs the letters as well as a done flag. The last part implements the former parts on the FPGA.

## Schematic

![Image](Images/OverallSchematic.png)

## Signal into DITs and DAHs
Describing [`DitDahDecoder.v`](https://github.com/MarkG98/MorseCodeTranslator/blob/master/DitDahDecoder.v)

To implement the signal decoder, we made a counter that starts counting up as long as the signal is constant, whether high or low. The counter increments by one for each clock cycle. When the signal switches, the counter is reset to 0. This counter serves as a debouncer of the button as well as timing for the DITs, DAHs, GAPs and SPACEs. The following table details what constitutes a DIT DAH, GAP and SPACE:

| Output |  Time Length (Relative) | Held Signal  | MSBs |
|--------|-------------------------|--------------|------|
| DIT    |         1               |      1       | 001  |
| DAH    |         3               |      1       | 011  |
| GAP    |         3               |      0       | 011  |
| SPACE  |         7               |      0       | 111  |

DITs and DAHs are activated when the signal goes from on to off, depending on the value of the counter. If the three most significant bits (MSB) are 001, a DIT is output for one clock cycle. if the three most significant bits are 011, a DAH is output for one clock cycle. Because a SPACE is technically needed for separating the letters, GAP needs to be an output in addition to a SPACE being an output. So GAP is output as soon as the most significant bits are 011, and all other bits are 0, so that it only reads out for one clock cycle. A SPACE is output when the signal goes from off to on, and the most significant bits are 111. If none of the conditions are met, it outputs a WAIT state indicating nothing to be done. Checking the three most significant bits gives the user a window of one time length (same as the length of a DIT), as users are not perfect. For our implementation on the FPGA, the clock is running at 120MHz, and we decided upon 28 bits for the counter, causing the time length to be about one second.

## Translating Dits, Dahs, SPACEs, and GAPs Into Letters

![Image](Images/ALPHAFSM.png)

Alphabet FSM takes in the DITs, DAHs, SPACEs, and GAPs produced by the module in [`DitDahDecoder.v`]((https://github.com/MarkG98/MorseCodeTranslator/blob/master/DitDahDecoder.v)) and translates a series of these signals to letters for the system to output. This finite state machine is in the [`alphabetMachine.v`](https://github.com/MarkG98/MorseCodeTranslator/blob/master/alphabetMachine.v) file in the project repository. Each state represents a letter, and each transition is dependent on the current state (letter) and the input signal.

A slightly simplified version of the implemented finite state machine is shown above is shown above. Each dashed line represents a DAH causing a state transition, and each dotted line represents a DIT causing a state transition. Note that there is implicitly an arrow from each state to itself (with the exception of the SPACE state) which is used to transition in the case of a WAIT signal. Each letter state also has a transition to the start state which is triggered by a GAP signal.

## Wrapper for FPGA

The FPGA implementation of the Vivado simulation required a wrapper to synthesize on the FPGA we used for the project (the [Zybo Zynq-7000](https://reference.digilentinc.com/reference/programmable-logic/zybo/start)). Once the Vivado implementation was completed, we wrote [`morse_wrapper.v`](https://github.com/MarkG98/MorseCodeTranslator/blob/master/morse_wrapper.v) to include the [`MorseDecoder.v`](https://github.com/MarkG98/MorseCodeTranslator/blob/master/MorseDecoder.v) file that managed the signals and states in combination with a register module file [`register.v`](https://github.com/MarkG98/MorseCodeTranslator/blob/master/register.v). The wrapper file consists of a singular module that takes the clock and button presses as inputs, and outputs various information on the board LEDs, as well as a peripheral module that has an 8-LED package. The inputs and outputs of the MorseDecoder module were wired up, and the input signal was assigned to a button on the FPGA. After this signal was received on the hardware, we ran it through two D-flip-flops to synchronize it with the clock, and then passed it as an input to the MorseDecoder module. The outputs of this module, done and letter, were assigned to various LEDs on the FPGA and peripheral board, listed below in the hardware output guide.

### Hardware Output Guide

|   Hardware   |  Information Displayed  |
|--------------|-------------------------|
| Button 0     |        User Input       |
| LED 0        |      MSB of Counter     |
| LED 1        |    3rd MSB of Counter   |
| LED 2        |        Done Flag        |
| LED 2        | Output 1st Synchronizer |
| PMOD LED 0-7 |   ASCII Code of Letter  |
