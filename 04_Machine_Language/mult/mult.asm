// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Let a = R0, b = R1 ---> sum = a * b

	@R0
	D = M
	@a
	M = D // a = R0
	
	@R1
	D = M
	@b
	M = D // b = R1
	
	@a
	D = M
	@ZEROCOND
	D ; JEQ  // if a == 0 then result = 0
	
	@b
	D = M
	@ZEROCOND
	D ; JEQ  // if b == 0 then result = 0
	
	@sum
	M = 0 // sum = 0
	@i
	M = 1 // i = 1
	
	
(LOOP)
	@i
	D = M
	@b
	D = D - M
	@STOP
	D ; JGT // if (i > n) goto STOP
	
	@a
	D = M
	@sum
	M = D + M // sum += a
	@i
	M = M + 1 // i += 1
	@LOOP
	0 ; JMP // goto LOOP

(ZEROCOND)
	@R2
	M = 0
	@END
	0 ; JMP
	
(STOP)
	@sum
	D = M
	@R2
	M = D // R2 = sum = a * b = R0 * R1
	
(END)
	@END
	0 ; JMP
	