---
permalink: /
title: Home
---

# Morse Code Decoder

![Image](Images/BasicR.gif)

## What is this?

This website serves as documentation of our Fall 2019 Computer Architecture final project, an FPGA-implemented, human-input morse code decoder.

## Why did we do this?

(Other than this being a required assignment)
We chose to create a hardware-based morse code decoder because we viewed it as a fun extension of our learning throughout the semester in terms of the Verilog programming language, as well as concepts such as synchronization, finite state machines, and behavioral Verilog. In addition to this, we had less experience working with FPGAs (and the Vivado software), and felt that a hardware-based application of these concepts would allow us to learn more about implementing our simulations in other environments. This project has served as a lesson in the integration of modules and working around human interaction with our developed software, and posed some interesting questions and problems while we implemented what is essentially the first "binary" form of communication.

## Reflection

Overall, we enjoyed this project a lot, and feel that it would be a good idea to possibly implement it as a lab in the course. While it didn't use a lot of the "hardware" we learned about, it did provide a lot of good problem-solving cases for finite state machines and thinking about how to time things correctly. Perhaps adding in some more creative ways of timing the inputs could make this into something for the class, as it also provides a good introduction to how Vivado and FPGA programming work. At this point, our human-input FPGA does work, however, the automation of the "done" flag is something we would have liked to implement. The limited output information from the FPGA drove us to coming up with more creative debugging ideas; not being able to see the signals from a software like GTKWave made it more difficult. While this served to be frustrating at times, it allowed us to think more critically about how and when we were asking for things to display, and to be intentional about design decisions from the lowest to the highest level.


## Extensions

One possible extension could be to expect the classic phrase that Morse Code user use to signal the words per minute of the oncoming communication. This would entail expecting "PARIS CODEX" as the first word that would set the time length of DITs and DAHs. This could be done by taking the counter's value at each of the DITs and DAHs and setting the counter's most significant bits to align with the speed. This would enable the decoder to decode any Morse Code signal, allowing it to be used by the experienced and novice alike.

Another extension would be to convert letters to Morse Code. This would involve taking an ASCII or keyboard input and using a state machine based on each letter to output a binary signal.
<!-- ## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/MarkG98/MorseCodeTranslator/edit/gh-pages/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/MarkG98/MorseCodeTranslator/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out. -->