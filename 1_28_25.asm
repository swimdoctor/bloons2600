	processor 6502
        include "vcs.h"
        include "macro.h"
        include "xmacro.h"

	seg code
        org $f000

Start
	CLEAN_START
        
ShowFrame
	LDA #$88
        STA COLUBK
        
        STA WSYNC
        LDA #2
	STA VSYNC
	STA VBLANK
	STA WSYNC
        STA WSYNC
        STA WSYNC
        STA WSYNC
        
        LDA #0
        STA VSYNC
        
        LDX #36
VBlank
	STA WSYNC
        DEX
	BNE VBlank
        
        LDA #0
        STA VBLANK
	
        
        LDX #96
FirstHalf
	STA WSYNC
        DEX
	BNE FirstHalf
	
        LDA #$F9
        STA COLUBK
        
	LDX #96
SecondHalf
	STA WSYNC
        DEX
	BNE SecondHalf
        
        LDA #2
        STA VBLANK
	LDX 30
Bottom
	STA WSYNC
        DEX
	BNE Bottom
        
        JMP ShowFrame
        
        
        
        
        
        
        
        org $FFFC
        .word Start
        .word Start