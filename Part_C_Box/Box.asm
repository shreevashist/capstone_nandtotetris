
// K = 59
// Box starts at row 49
// Width = 32 pixels (2 words)
// Height = 20 rows
// Shree Vashisht

(LOOP)
    // Check keyboard
    @KBD
    D=M
    @BLACK
    D;JNE

    // No key pressed: white
    @0
    D=A
    @R15
    M=D
    @DRAW
    0;JMP

(BLACK)
    // Key pressed: black
    @1
    D=-A
    @R15
    M=D

(DRAW)
    // Starting screen address = 17952
    @17952
    D=A
    @R13
    M=D

    // Height = 20 rows
    @20
    D=A
    @R14
    M=D

(ROW)
    // Draw first 16 pixels
    @R15
    D=M
    @R13
    A=M
    M=D

    // Move to second word
    @R13
    M=M+1

    // Draw next 16 pixels
    @R15
    D=M
    @R13
    A=M
    M=D

    // Move to next screen row
    @R13
    M=M+1

    // Skip remaining 30 words
    @30
    D=A
    @R13
    M=D+M

    // Decrease row counter
    @R14
    MD=M-1
    @ROW
    D;JGT

    // Repeat continuously
    @LOOP
    0;JMP
