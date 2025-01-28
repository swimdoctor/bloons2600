
	processor 6502
        include "vcs.h"
        include "macro.h"
        include "xmacro.h"

	seg Code
        org $f000
        
Start
	CLEAN_START
        
        ldx #$80
        stx COLUBK
        lda #$1C
        sta COLUPF
        
        
        
        
StartFrame
	lda #2
        sta VBLANK
        sta VSYNC
        
        REPEAT 3
        sta WSYNC
        REPEND
        
        lda #0
        sta VSYNC
        
        REPEAT 37
        sta WSYNC
        REPEND
        
        sta VBLANK
        
        ;Start PF
        
        ldx #%00000001
        stx CTRLPF
        
	REPEAT 10
	sta WSYNC
        REPEND
        
        ldx #%11111111
        stx PF0
        stx PF1
        stx PF2
        
        REPEAT 8
	sta WSYNC
        REPEND
        
        REPEAT 156
	sta WSYNC
        REPEND
        
        ldx #%11111111
        stx PF0
        stx PF1
        stx PF2
        
        REPEAT 8
	sta WSYNC
        REPEND
        
        ldx #0
        stx PF0
        stx PF1
        stx PF2
        
        REPEAT 10
	sta WSYNC
        REPEND
        
        
        lda #2
        sta VBLANK
        
        REPEAT 30
        sta WSYNC
        REPEND
        
        
        
        JMP StartFrame
        
        
        
        
        
        
        
        
        
        org $fffc
        .word Start
        .word Start