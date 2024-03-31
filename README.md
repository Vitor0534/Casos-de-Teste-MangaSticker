# Interactive Manga Test Cases Implemented Using MangaSticker

### Autor: Vitor de Almeida Silva, PUC-GO/TCC - 2020

### Brief explanation


This repository contains the files of the three interactive manga test cases developed during my TCC. The projects aim to serve as tools for training people with Down Syndrome in simple money handling skills.

People with this genetic condition have specific characteristics, which require a different approach to training. More details were reported in the article published about the project:
- [MangaSticker: A Tool To Build Interactive Manga](https://ijcaonline.org/archives/volume174/number11/31723-2021920989/)

### Organization:

There are three test cases separated by individual folders, they can be understood as different projects. Except for test case 0, which does not use a microcontroller, the projects contain the following elements:
- **Source code:** is the source code produced in  [Processing IDE](https://processing.org/download). It consists of the sequence of activations necessary for the interactive manga, and integrates with Arduino, which enables communication between the manga and the system that reproduces the logic. 
	- The Arduino is loaded with the lib [Standard Firmata](https://www.arduino.cc/reference/en/libraries/firmata/), which allows standardized communication with any interactive manga built following these conventions.
- **MangaSticker Project:** is the project generated using the MangaSticker software, one of the products of this research:
	- MangaSticker allows you to edit the interactive manga interface, combining circuit components, which follow the [Circuit Stickers](https://www.media.mit.edu/projects/circuit-stickers/overview/) pattern, with the manga frames. The application gives complete creative freedom to build tangible interfaces using paper and circuits, so it is not limited to the topic of manga, but was initially developed with this focus.
	- The MangaSticker source code is publicly maintained by TCC group researchers in the following repository:
		- [MangaSticker github](https://github.com/Vitor0534/MangaSticker)
- **Circuit simulation:** To test the system before implementing the physical version, simulations were built in the software [Proteus v8.2](https://www.labcenter.com/), It is not a mandatory step, but it is recommended to avoid unnecessary expenditure of time and components.

### Development dependencies:

First you need to make sure that the system and development dependencies are configured correctly:
-   Development environment:
	- [Arduino IDE](https://www.arduino.cc/en/software)
	- [Processing IDE](https://processing.org/download)
	- [Proteus](https://www.labcenter.com/): if it is necessary to simulate the circuits
	- [MangaSticker](https://github.com/Vitor0534/MangaSticker):  if it is necessary to model interactive manga
- Development libs:
	- [Firmata:](https://www.arduino.cc/reference/en/libraries/firmata/) the Arduino must be loaded with this code before being integrated into the system
	- [com0com:](https://com0com.sourceforge.net/) serial port simulator, required to run simulations on Proteus

### How to execute the projects:

The steps to execute an interactive manga project are:

 1. Open manga source code using Processing
 2. Record Arduino with the Firmata lib
 3. Organize the interactive manga circuit according to the connection diagram together with Arduino
 4. Connect Arduino to computer via USB port
 5. Run the Processing code

The process to run using Proteus is the same. Except that, in this case, it is necessary to use the serial port "simulator". Indicate the port to be connected to both the Proteus Arduino and the connection in the Processing code.


### About test cases

**Test Case 0:** 

It was created just for simulation, it only has the Proteus circuit. It is the simplest case and is based on the first story, with the character Gustavo. Contains only click and light interactions, no audio.

**Test Case 1:** 

Gustavo is a boy who collects real (BRL) notes, he invites the interlocutor to learn a little about his collection. The character, through clicks on the manga frames, teaches the person to identify all the notes using audio stimuli (speech, music) and light (LEDs):

![enter image description here](./Caso%20de%20teste%201/Simulacao%20do%20circuito/cena%20principal%202.jpg)


**Test Case 2:** 

Sara is a girl who invents different games, this time she sets up a kind of toy “sale”. The interlocutor enters the game and clicks on the photos to buy items from the “market in the living room” that the character has set up:

![enter image description here](./Caso%20de%20teste%202/Simulacao%20do%20circuito/face_Manga.jpg)


### Links that can satisfy curiosity
- [What are cirtuit stickers? (1)](https://www.media.mit.edu/projects/circuit-stickers/overview/)
- [What are circuit stickers example? (2)](https://www.crowdsupply.com/chibitronics/circuit-stickers)



