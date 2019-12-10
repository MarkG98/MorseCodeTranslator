---
permalink: /
title: Overview
---

# Morse Code Decoder

## How To Use The FPGA Implementation
![Image](Images/BasicR.gif)

- **DIT**: hold button 0 until LED 1 blinks on and off once.
- **DAH**: hold button 0 until LED 1 blinks on and off twice.
- **Translate Sequence of DITS and DAHS**: Press button 1 to register that you are done sending a letter and then the letter should display on the PMOD LEDs

## What Is Morse Code?
Morse code is a standardized character encoding scheme that uses two different signal lengths (DIT being a short signal and DAH being a long signal) to encode text characters. The encodings for the alphabet and numbers 0 - 9 can be seen below chart taken from the [Morse code Wikipedia page](https://en.wikipedia.org/wiki/Morse_code)

![Image](Images/MC.png)

Our goal for this project was to design hardware which can take in Morse code input from a user and translate the inputted signal to ASCII code for the corresponding letter that it translates to.

## Motivation

(Other than this being a required assignment)
We chose to create a hardware-based morse code decoder because we viewed it as a fun extension of our learning throughout the semester in terms of the Verilog programming language, as well as concepts such as synchronization, finite state machines, and behavioral Verilog. In addition to this, we had less experience working with FPGAs (and the Vivado software), and felt that a hardware-based application of these concepts would allow us to learn more about implementing our simulations in other environments. This project has served as a lesson in the integration of modules and working around human interaction with our developed software, and posed some interesting questions and problems while we implemented what is essentially the first "binary" form of communication.

## Reflection

Overall, we enjoyed this project a lot, and feel that it would be a good idea to possibly implement it as a lab in the course. While it didn't use a lot of the "hardware" we learned about, it did provide a lot of good problem-solving cases for finite state machines and thinking about how to time things correctly. Perhaps adding in some more creative ways of timing the inputs could make this into something for the class, as it also provides a good introduction to how Vivado and FPGA programming work. At this point, our human-input FPGA does work, however, the automation of the "done" flag is something we would have liked to implement. The limited output information from the FPGA drove us to coming up with more creative debugging ideas; not being able to see the signals from a software like GTKWave made it more difficult. While this served to be frustrating at times, it allowed us to think more critically about how and when we were asking for things to display, and to be intentional about design decisions from the lowest to the highest level.


## Extensions

One possible extension could be to expect the classic phrase that Morse Code user use to signal the words per minute of the oncoming communication. This would entail expecting "PARIS CODEX" as the first word that would set the time length of DITs and DAHs. This could be done by taking the counter's value at each of the DITs and DAHs and setting the counter's most significant bits to align with the speed. This would enable the decoder to decode any Morse Code signal, allowing it to be used by the experienced and novice alike.

Another extension would be to convert letters to Morse Code. This would involve taking an ASCII or keyboard input and using a state machine based on each letter to output a binary signal.
