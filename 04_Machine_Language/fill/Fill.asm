// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
	@SCREEN
	D = A
	@i
	M = D  // i = SCREEN (i is a pointer to screen)

	@KBD
	D = M
	
	@KEYPRESSED
	D ; JNE  // jump if key != 0

(KEYNOTPRESSED)
	@KBD
	D = A
	@i
	D = D - M
	@STOP
	D ; JEQ // if (i == n) exit loop
	
	@i
	A = M  // Address = SCREEN + i
	M = 0 // RAM[Address] = 0 or don't fill
	@i
	M = M + 1 // i++
	
	@KEYNOTPRESSED
	0 ; JMP	
	
(KEYPRESSED)
	@KBD
	D = A
	@i
	D = D - M
	@STOP
	D ; JEQ // if (i == n) exit loop
	
	@i
	A = M  // Address = SCREEN + i
	M = -1 // RAM[Address] = -1 or fill
	@i
	M = M + 1 // i++
	
	@KEYPRESSED
	0 ; JMP
	

(STOP)
	@LOOP
	0 ; JMP
	
	
	
	