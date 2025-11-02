
initF256                                ; initialize F256

        ; init events
        lda #<event
        sta kernel.args.events+0
        lda #>event
        sta kernel.args.events+1

        ; setup tile graphics

        lda #$00                        ; Set the I/O page to #1
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)

        lda #$34                        ; enable Sprite, Tile, Graphics engines. Disable Sprites, Bitmap, Text
        sta VKY_MSTR_CTRL_0             ; save that to VICKY master control register 0
        lda #$01                        ; set CLK70, for 320x200 display size
        sta VKY_MSTR_CTRL_1             ; save that to VICKY master control register 0

        lda #$01
        sta VKY_BRDR_CTRL               ; enable border
        lda #$00
        sta VKY_BRDR_COL_B              ; border color: black
        sta VKY_BRDR_COL_G
        sta VKY_BRDR_COL_R
        sta VKY_BRDR_HORI               ; border width = 0
        sta VKY_BRDR_VERT               ; border height = 0

        sta VKY_BKG_COL_B               ; background color: black
        sta VKY_BKG_COL_G
        sta VKY_BKG_COL_R

        ; set up Tilemap 0 - 8x8 tiles (jungle scene) (foreground)

        lda #$11                        ; 8x8 tiles, enable
        sta VKY_TM0_CTRL
        lda #42                         ; 2 tiles wider than screen allows scrolling
        sta VKY_TM0_SIZE_X
        lda #25                         ; 25 rows in text screen
        sta VKY_TM0_SIZE_Y

        lda #$00
        sta VKY_TM0_POS_X_L
        sta VKY_TM0_POS_X_H
        sta VKY_TM0_POS_Y_L
        sta VKY_TM0_POS_Y_H

        lda #<tilemap_fg
        sta VKY_TM0_ADDR_L
        lda #>tilemap_fg
        sta VKY_TM0_ADDR_M
        lda #$00
        sta VKY_TM0_ADDR_H

        ; set up Tilemap 2 - 8x8 tiles (jungle scene) (background)

        lda #$11                        ; 8x8 tiles, enable
        sta VKY_TM2_CTRL
        lda #42                         ; 2 tiles wider than screen allows scrolling
        sta VKY_TM2_SIZE_X
        lda #25                         ; 25 rows in text screen
        sta VKY_TM2_SIZE_Y

        lda #$00
        sta VKY_TM2_POS_X_L
        sta VKY_TM2_POS_X_H
        sta VKY_TM2_POS_Y_L
        sta VKY_TM2_POS_Y_H

        lda #<tilemap_bg
        sta VKY_TM2_ADDR_L
        lda #>tilemap_bg
        sta VKY_TM2_ADDR_M
        lda #$00
        sta VKY_TM2_ADDR_H

        ; disable tilemaps: 1

        lda #$00
        sta VKY_TM1_CTRL

        ; disable bitmaps: 0,1,2

        lda #$00
        sta VKY_BM0_CTRL                ; disable bitmap 0
        sta VKY_BM1_CTRL                ; disable bitmap 1
        sta VKY_BM2_CTRL                ; disable bitmap 2

        ; set tile set #0

        lda #$00                        ; displayed tileset at $010000
        sta $d283                       ; tile format: vertical
        sta VKY_TS0_ADDR_L
        sta VKY_TS0_ADDR_M
        lda #$01
        sta VKY_TS0_ADDR_H

        jsr setColorLut                 ; setup color LUT

        ; assign the display layers

        lda #$04                        ; Layer 0: Tilemap 1 (enabled)
        sta VKY_LAYER_CTRL_0            ; Layer 1: (Tilemap 0, disabled)
        lda #$06                        ; Layer 2: Tilemap 0 (enabled)
        sta VKY_LAYER_CTRL_1


        jsr initSwapAreaC000            ; prepare $c000 for being used as swap area
        jsr initSpritesF256
        jsr initNumberSpritesF256

.if FOENIX_IDE
        ; schedule the first frame timer        ; Foenix IDE workaround
        lda #kernel.args.timer.FRAMES | kernel.args.timer.QUERY
        sta kernel.args.timer.units
        jsr kernel.Clock.SetTimer
        sta frames
        jsr schedule_frame
.else
        jsr setupPitfallIrq             ; Disabled for Foenix IDE workaround
.endif

        rts


handleEvents
        ; Peek at the event queue to see if anything is pending
        lda kernel.args.events.pending      ; negated count
        bpl _done

        ; get the next event
        jsr kernel.NextEvent
        bcs _done

        ; handle the event
        jsr dispatchEvent
        jmp handleEvents                    ; continue until the queue is drained

_done
        ; TODO: HIGHLY EXPERIMENTAL enable VIA0 interrupt on Interrupt Controller
        lda INT_MASK_1
        and #~INT15_VIA                 ; unmask the VIA0 interrupt
        sta INT_MASK_1
        rts

dispatchEvent
        ; get the event's type
        lda event.type
        ldy #$ff
_dispatchEventL
        iny
        lda tblEventKinds,y
        beq _exit                       ; ignore anything not handled
        cmp event.type                  ; matches current event type?
        bne _dispatchEventL
        tya                             ; call the appropriate handler
        asl
        tay
        lda tblEventHandlers+1,y
        pha
        lda tblEventHandlers+0,y
        pha
_exit
        rts                             ; dispatch event or exit


event_timer
        jmp event_timer_handler

event_joystick
        lda event.joystick.joy1         ; joystick 0 value
        eor #$ff                        ; convert to C64 convention
        sta joystickCode
        rts

event_key_pressed
;        jsr printKbdEvent               ; TODO EXPERIMENTAL TESTING
        lda event.key.ascii
        bne _key_pressed_j1
        bit event.key.flags             ; modifier event?
        bpl _exit                       ; not a modifier
        lda event.key.raw
        cmp #$02
        bcc _exit
        cmp #$03+1
        bcs _exit
        lda #$80
        sta ctrl_active
        jmp _exit

_key_pressed_j1
        pha                             ; joystick over keyboard handling
        jsr key_to_joystick_byte        ; convert to joystick port mask
        and joystickKbdCode             ; modify existing code
        sta joystickKbdCode             ; store back in joystickKbdCode variable
        pla

        cmp #$60                        ; upper case?
        bcc _key_pressed_j2             ; yes ->
        sec
        sbc #$20                        ; to upper case
_key_pressed_j2
        bit ctrl_active                 ; <CTRL> active?
        bpl _key_pressed_j3             ; no ->
        clc
        adc #KEY_CODE_CTRL+KEY_CODE_A-1 ; convert to <CTRL>-letter for game
_key_pressed_j3
        sta keyboardCode
        ; TODO: do something with key code
_exit
        rts

event_key_released
        lda event.key.ascii
        bne _key_pressed
        bit event.key.flags             ; modifier event?
        bpl _exit                       ; not a modifier
        lda event.key.raw
        cmp #$02
        bcc _exit
        cmp #$03+1
        bcs _exit
        lda #$00
        sta ctrl_active
        bne _exit

_key_pressed
        pha                             ; joystick over keyboard handling
        jsr key_to_joystick_byte        ; convert to joystick port mask
        eor #$ff                        ; invert port mask
        ora joystickKbdCode             ; modify existing code
        sta joystickKbdCode             ; store back in joystickKbdCode variable
        pla
_exit
        rts

key_to_joystick_byte
        phx
        ldx #$00
        cmp #KEY_JOY_UP
        beq _found
        inx
        cmp #KEY_JOY_DOWN
        beq _found
        inx
        cmp #KEY_JOY_LEFT
        beq _found
        inx
        cmp #KEY_JOY_RIGHT
        beq _found
        inx
        cmp #KEY_JOY_FIRE
        beq _found
        lda #$ff
        bne _exit
_found
        lda key_to_joy_masks,x
_exit
        plx
        rts

key_to_joy_masks
        .byte JOYSTICK_MASK_UP
        .byte JOYSTICK_MASK_DOWN
        .byte JOYSTICK_MASK_LEFT
        .byte JOYSTICK_MASK_RIGHT
        .byte JOYSTICK_MASK_FIRE

event_file_opened
        inc file_opened
        rts

event_file_closed
        inc file_closed
        rts

event_file_not_found
;        jsr print
;        .text "File not found!",$ff,$00
        inc file_error
        rts
;_error_loop
;        jmp _error_loop

event_file_data
        lda event.file.data.read
        sta kernel.args.buflen
        pha
        cmp #250
        beq _event_file_data_j1
;        jsr print
;        .text "End of File!",$ff,$00

_event_file_data_j1
        lda zpBufferPtr+0
        sta kernel.args.buf+0
        lda zpBufferPtr+1
        sta kernel.args.buf+1

        jsr kernel.ReadData

        pla
        clc
        adc zpBufferPtr+0
        sta zpBufferPtr+0
        bcc _file_data_j1
        inc zpBufferPtr+1
_file_data_j1
        inc file_next_chunk
;;;        jmp handleEvents        ; retrieve EOF event if EOF has been reached
        rts

event_file_eof
        inc file_eof
;        jsr print
;        .text "EOF!",$ff,$00
        rts


event_file_wrote
        sec
        lda zpFileSize+0                ; decrease remaining file size
        sbc event.file.wrote.wrote      ; by number of bytes written
        sta zpFileSize+0
        bcs _event_file_wrote_j1
        dec zpFileSize+1
_event_file_wrote_j1
        clc
        lda zpBufferPtr+0               ; increase source buffer pointer
        adc event.file.wrote.wrote      ; by number of bytes written
        sta zpBufferPtr+0
        bcc _event_file_wrote_j2
        inc zpBufferPtr+1
_event_file_wrote_j2
        inc file_next_chunk             ; indicate that chunk has been written
        rts


KBD
        .byte $00

ctrl_active
        .byte $00

file_opened
        .byte $00
file_closed
        .byte $00
file_eof
        .byte $00
file_next_chunk
        .byte $00
file_error
fileError
        .byte $00

timer_events
        .fill TIMER_EVENT_MAX+1,$00

tblEventKinds
        .byte kernel.event.JOYSTICK
        .byte kernel.event.key.PRESSED
        .byte kernel.event.key.RELEASED   ; TODO ONLY FOR TESTING
        .byte kernel.event.file.NOT_FOUND
        .byte kernel.event.file.ERROR
        .byte kernel.event.file.OPENED
        .byte kernel.event.file.DATA
        .byte kernel.event.file.EOF
        .byte kernel.event.file.CLOSED
        .byte kernel.event.file.WROTE
        .byte kernel.event.timer.EXPIRED
        .byte kernel.event.irq.IRQ
        .byte $00

tblEventHandlers
        .word event_joystick-1
        .word event_key_pressed-1
        .word event_key_released-1
        .word event_file_not_found-1
        .word event_file_not_found-1
        .word event_file_opened-1
        .word event_file_data-1
        .word event_file_eof-1
        .word event_file_closed-1
        .word event_file_wrote-1
        .word event_timer-1
        .word event_irq-1

setColorLut
        lda #$01                        ; Set the I/O page to #1
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)

        ; main clut (and player sprites)

        lda #<clut_start-1
        sta zpSrcPtr+0
        lda #>clut_start-1
        sta zpSrcPtr+1

        lda #<VKY_GR_CLUT_0-1
        sta zpDstPtr+0
        lda #>VKY_GR_CLUT_0-1
        sta zpDstPtr+1

        ldy #<clut_end - clut_start
        jsr SmallMemCopy

        lda #$00                        ; Set the I/O page to #0
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)

        rts


SmallMemCopy
        lda (zpSrcPtr),y
        sta (zpDstPtr),y
        dey
        bne SmallMemCopy
        rts


clut_start
        ; order: blue, green, red, (reserved)
        .byte $00,$00,$00,$00    ; transparent
        .byte $ff,$ff,$ff,$00    ; white
        .byte $27,$23,$6d,$00    ; red
        .byte $f8,$fe,$a0,$00    ; cyan
        .byte $c4,$62,$ba,$00    ; purple
        .byte $4d,$ac,$56,$00    ; green
        .byte $9b,$2c,$2e,$00    ; blue
        .byte $71,$f1,$ed,$00    ; yellow
        .byte $4d,$78,$ba,$00    ; orange
        .byte $00,$38,$55,$00    ; brown
        .byte $71,$6c,$c4,$00    ; light red
        .byte $37,$37,$37,$00    ; dark grey
        .byte $86,$86,$86,$00    ; mid grey
        .byte $9f,$ff,$a9,$00    ; light green
        .byte $f8,$77,$7a,$00    ; light blue
        .byte $e0,$e0,$e0,$00    ; light grey
        .byte $00,$00,$00,$00    ; black (solid)
clut_end


.comment
        .word ?                         ; align tile_map_tile to word
tile_map_tile_window
        .fill 22*14*2, [$24,$00]        ; use tile set 0
.endcomment


resetSwapAreaA000               ; swap area at $a000
        lda #$0a
setSwapAreaA000
        lsr                     ; convert address [24..31] to MMU bank
        pha
        lda #$b3                ; active MLUT = 3, Edit MLUT #3
        sta MMU_MEM_CTRL
        pla
        sta MMU_MEM_BANK_5      ; MMU Edit Register for bank 5 ($A000 - $BFFF)

        lda #$03
        sta MMU_MEM_CTRL

.comment
        lda MMU_IO_CTRL                 ; ($c000-$dfff is I/O)
        and #%11111011                  ; enable I/O
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)
.endcomment
        rts

initSwapAreaC000
        lda #$b3                ; active MLUT = 3, Edit MLUT #3
        sta MMU_MEM_CTRL
        lda MMU_MEM_BANK_6      ; MMU Edit Register for bank 6 ($C000 - $DFFF)
        sta defaultBank6        ; store the default configuration for later use
        lda #$03
        sta MMU_MEM_CTRL
        rts

setSwapAreaC000
        lsr                     ; convert address [24..31] to MMU bank
        pha
        lda #$b3                ; active MLUT = 3, Edit MLUT #3
        sta MMU_MEM_CTRL
;;;        lda MMU_MEM_BANK_6      ; MMU Edit Register for bank 6 ($C000 - $DFFF)
;;;        sta defaultBank6
        pla
        sta MMU_MEM_BANK_6      ; MMU Edit Register for bank 6 ($C000 - $DFFF)

        lda #$03
        sta MMU_MEM_CTRL

        lda MMU_IO_CTRL                 ; ($c000-$dfff is I/O)
        ora #%00000100                  ; disable I/O
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)
        rts

resetSwapAreaC000               ; swap area at $c000
        lda #$b3                ; active MLUT = 3, Edit MLUT #3
        sta MMU_MEM_CTRL

        lda defaultBank6
        sta MMU_MEM_BANK_6      ; MMU Edit Register for bank 6 ($C000 - $DFFF)

        lda #$03
        sta MMU_MEM_CTRL

        lda MMU_IO_CTRL                 ; ($c000-$dfff is I/O)
        and #%11111011                  ; enable I/O
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)

        rts


setBigSwapArea
        lsr                     ; convert address [24..31] to MMU bank
        pha
        lda #$b3                ; active MLUT = 3, Edit MLUT #3
        sta MMU_MEM_CTRL
        lda MMU_MEM_BANK_6      ; MMU Edit Register for bank 6 ($C000 - $DFFF)
        sta defaultBank6
        pla
        sta MMU_MEM_BANK_5      ; MMU Edit Register for bank 5 ($A000 - $BFFF)
        clc
        adc #$01
        sta MMU_MEM_BANK_6      ; MMU Edit Register for bank 6 ($C000 - $DFFF)

        lda #$03
        sta MMU_MEM_CTRL

        lda MMU_IO_CTRL                 ; ($c000-$dfff is I/O)
        ora #%00000100                  ; disable I/O
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)
        rts

resetBigSwapArea
        lda #$b3                ; active MLUT = 3, Edit MLUT #3
        sta MMU_MEM_CTRL

        lda #$0a >> 1
        sta MMU_MEM_BANK_5      ; MMU Edit Register for bank 5 ($A000 - $BFFF)
        lda defaultBank6
        sta MMU_MEM_BANK_6      ; MMU Edit Register for bank 6 ($C000 - $DFFF)

        lda #$03
        sta MMU_MEM_CTRL

        lda MMU_IO_CTRL                 ; ($c000-$dfff is I/O)
        and #%11111011                  ; enable I/O
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)

        rts

defaultBank6
        .byte $00


.comment

testKeyboard
        jsr handleEvents
        jmp testKeyboard

printByte
        pha
        lsr
        lsr
        lsr
        lsr
        jsr printDigit
        pla
        and #$0f
        jsr printDigit
        jsr printString
        .text "  ",$00
        rts

printKbdEvent
        lda #$00
        sta zpCursorRow
        sta zpCursorCol
        lda event.type
        jsr printByte
        lda event.key.raw
        jsr printByte
        lda event.key.ascii
        jsr printByte
        lda event.key.flags
        jsr printByte
        rts

printJoyEvent
        lda #$02
        sta zpCursorRow
        lda #$00
        sta zpCursorCol
        lda event.joystick.joy0
        jsr printByte
        lda event.joystick.joy1
        jsr printByte
        rts
.endcomment


delayF256
        lda #$1
        sta _delay
_delayL1
        ldx #$00
        ldy #$00
_delayL2
        dex
        bne _delayL2
        dey
        bne _delayL2
        ldy _delay
        dey
        sty _delay
        bne _delayL1
        rts

_delay
        .byte $00


initSpritesF256
        lda #$00                        ; Set the I/O page to #0
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)

        ldy #$00                        ; iterator
        tya                             ; init value
_disableSpritesL
        sta VKY_SP0_CTRL+$0000,y        ; init sprite registers  0-31
        sta VKY_SP0_CTRL+$0100,y        ; init sprite registers 32-63
        iny
        bne _disableSpritesL
        rts


initNumberSpritesF256
        ; A = sprite index (0..5 = score, 6,7: minutes, 8,9: seconds, 10: colon)
        ldy #$00                        ; iterator
        ldx #$00
_initNumberSpritesL
        lda #%01000001                  ; size: 16x16, layer 0, LUT 0, Enable
        sta VKY_SP0_CTRL,y

        lda numberSpriteXPositions+0,x
        sta VKY_SP0_POS_X_L,y
        lda numberSpriteXPositions+1,x
        sta VKY_SP0_POS_X_H,y
        lda numberSpriteYPositions+0,x
        sta VKY_SP0_POS_Y_L,y
        lda numberSpriteYPositions+1,x
        sta VKY_SP0_POS_Y_H,y

        lda #<numberSpritesF256
        sta VKY_SP0_AD_L,y
        lda #>numberSpritesF256
        sta VKY_SP0_AD_M,y
        lda #$01
        sta VKY_SP0_AD_H,y

        inx
        inx
        tya
        clc
        adc #$08
        tay
;        cpy #$68
        cpy #$70
        bne _initNumberSpritesL

        ldy #SPRITE_ID_COLON * 8
        lda #<(numberSpritesF256+SPRITE_DATA_COLON*$0100)
        sta VKY_SP0_AD_L,y
        lda #>(numberSpritesF256+SPRITE_DATA_COLON*$0100)
        sta VKY_SP0_AD_M,y

        ldy #SPRITE_ID_LIFE_INDICATOR * 8
        lda #<(mainSpritesF256+SPRITE_DATA_LIFE_INDICATOR*24*24)
        sta VKY_SP0_AD_L,y
        lda #>(mainSpritesF256+SPRITE_DATA_LIFE_INDICATOR*24*24)
        sta VKY_SP0_AD_M,y

        ldy #(SPRITE_ID_LIFE_INDICATOR+1) * 8
        lda #<(mainSpritesF256+SPRITE_DATA_LIFE_INDICATOR*24*24)
        sta VKY_SP0_AD_L,y
        lda #>(mainSpritesF256+SPRITE_DATA_LIFE_INDICATOR*24*24)
        sta VKY_SP0_AD_M,y

        rts


updateNumberSpriteF256
        ; A = sprite data (0..5 = score, 6,7: minutes, 8,9: seconds, 10: colon)
        ; point sprite shape (A) to the sprite indicated by (X).

        pha
        phx
        pha
        txa
        asl
        asl
        asl
        tax

        pla
        clc
        adc #>numberSpritesF256
        sta VKY_SP0_AD_M,x
        plx
        pla

        rts


updateLifeIndicatorSpriteF256
        ; A: state of life indicator (0: hide, 1: show)
        ; X: index of life indicator (0,1)
        phx
        pha
        txa
        asl
        asl
        asl
        adc #SPRITE_ID_LIFE_INDICATOR * 8
        tax
        pla
        pha
        cmp #$01
        beq _showLife
        lda #%00100000                  ; size: 24x24, layer 0, LUT 0, Disable
        jmp _continue
_showLife
        lda #%00100001                  ; size: 24x24, layer 0, LUT 0, Enable
_continue
        sta VKY_SP0_CTRL,x              ; disable or enable sprite
        pla
        plx
        rts


numberSpriteXPositions
        .word 88,104,120,136,152,168    ; score
        .word 104,120,152,168,136       ; minutes, seconds, colon
        .word 40,56                     ; life indicator

numberSpriteYPositions
        .word 42,42,42,42,42,42         ; score
        .word 54,54,54,54,54            ; minutes, seconds, colon
        .word 42,42                     ; life indicator


updateObjectSpritesF256
        ; update object sprites like crocodiles, rolling logs, snake, fire, treasure
        ; A: sprite ID (C64)
        ; Y: color (if applicable)

        pha
        phx
        phy

        sec                             ; translate C64 sprite to F256 sprite
        sbc #SPRITE_ID_PLAYER_RUNNING

        cmp #(SPRITE_ID_ROLLING_LOG_0-SPRITE_ID_PLAYER_RUNNING)
        bcc _skip
        sbc #2                          ; used on C64 for life indicator
_skip

        ldy #$00
        tax
_updateObjectSpritesL
        clc
        lda spritedata_ptr_lb,x
        adc #<mainSpritesF256
        sta VKY_SP0_AD_L+SPRITE_ID_OBJECTS*8,y  ; sprite address register, low byte
        lda spritedata_ptr_hb,x
        adc #>mainSpritesF256
        sta VKY_SP0_AD_M+SPRITE_ID_OBJECTS*8,y
        lda #$01
        sta VKY_SP0_AD_H+SPRITE_ID_OBJECTS*8,y

        tya
        clc
        adc #$08                        ; next set of sprite registers
        tay
        cpy #3*8
        bne _updateObjectSpritesL


        ply
        plx
        pla
        rts


updateScorpionSpriteF256
        ; update object sprite for scorpion
        ; A: sprite ID (C64)

        pha
        phx

        lda zp_scorpion_sprite_id
        sec                             ; translate C64 sprite to F256 sprite
        sbc #(SPRITE_ID_PLAYER_RUNNING+2)
        tax

        clc
        lda spritedata_ptr_lb,x
        adc #<mainSpritesF256
        sta VKY_SP0_AD_L+SPRITE_ID_SCORPION*8   ; sprite address register, low byte
        lda spritedata_ptr_hb,x
        adc #>mainSpritesF256
        sta VKY_SP0_AD_M+SPRITE_ID_SCORPION*8
        lda #$01
        sta VKY_SP0_AD_H+SPRITE_ID_SCORPION*8

        plx
        pla
        rts


updateHarrySpriteF256
        ; update object sprite for scorpion
        ; A: sprite ID (C64)

        pha
        phx

        sec                             ; translate C64 sprite to F256 sprite
        sbc #SPRITE_ID_PLAYER_RUNNING
        tax

        clc
        lda spritedata_ptr_lb,x
        adc #<mainSpritesF256
        sta VKY_SP0_AD_L+SPRITE_ID_HARRY*8      ; sprite address register, low byte
        lda spritedata_ptr_hb,x
        adc #>mainSpritesF256
        sta VKY_SP0_AD_M+SPRITE_ID_HARRY*8
        lda #$01
        sta VKY_SP0_AD_H+SPRITE_ID_HARRY*8

        plx
        pla
        rts


updateSpritePositionsF256
        ; Update all sprite positions that change during game play.
        ; To be called within each screen update.

        pha
        phx
        phy

        ldx #$00
        ldy #SPRITE_ID_OBJECTS * 8       ; offset to sprite registers for first object
_updateSpritePosL
        phx
        txa
        asl
        tax
        lda zp_log_0_x_pos+0,x          ; x-coordinate, low byte
        clc
        adc #$08                        ; adjust for different X offset on F256 vs C64
        sta VKY_SP0_POS_X_L,y
        lda zp_log_0_x_pos+1,x          ; x-coordinate, high byte
        adc #$00
        sta VKY_SP0_POS_X_H,y

        plx
        lda zp_log_0_y_pos+0,x          ; y-coordinate, low byte
        sec
        sbc #$12                        ; adjust for different Y offset on F256 vs C64
        sta VKY_SP0_POS_Y_L,y
        lda #$00                        ; y-coordinate, high byte
        sta VKY_SP0_POS_Y_H,y
        lda #%00100001                  ; size: 24x24, layer 0, LUT 0, Enable
        sta VKY_SP0_CTRL,y              ; enable sprite
        tya
        clc
        adc #$08
        tay
        inx
        cpx #$03
        bne _updateSpritePosL

        ; update scorpion
        ; y = SPRITE_ID_SCORPION*8

        ldy #SPRITE_ID_SCORPION * 8
        lda zp_scorpion_x_pos+0         ; x-coordinate, low byte
        clc
        adc #$08                        ; adjust for different X offset on F256 vs C64
        sta VKY_SP0_POS_X_L,y
        lda zp_scorpion_x_pos+1         ; x-coordinate, high byte
        adc #$00
        sta VKY_SP0_POS_X_H,y

        lda #$d9-$12                    ; scorpion y position
        sta VKY_SP0_POS_Y_L,y
        lda #$00                        ; y-coordinate, high byte
        sta VKY_SP0_POS_Y_H,y

        lda #%00100001                  ; size: 24x24, layer 0, LUT 0, Enable
        sta VKY_SP0_CTRL,y              ; enable sprite

        ; update Pitfall Harry
        ; y = SPRITE_ID_HARRY * 8

        ldy #SPRITE_ID_HARRY * 8
        lda zp_player_x_pos+0           ; Harry's x-coordinate, low byte
        clc
        adc #$08                        ; adjust for different X offset on F256 vs C64
        sta VKY_SP0_POS_X_L,y
        lda zp_player_x_pos+1           ; x-coordinate, high byte
        adc #$00
        sta VKY_SP0_POS_X_H,y

        lda zp_player_y_pos             ; Harry's y-coordinate
        sec
        sbc #$12                        ; adjust for different Y offset on F256 vs C64
        sta VKY_SP0_POS_Y_L,y
        lda #$00                        ; y-coordinate, high byte
        sta VKY_SP0_POS_Y_H,y

        lda #%00100001                  ; size: 24x24, layer 0, LUT 0, Enable
        sta VKY_SP0_CTRL,y              ; enable sprite

        ply
        plx
        pla
        rts


.comment
        ldy #$00                        ; iterator
_initSpriteL
        lda #<spritesF256
        sta VKY_SP0_AD_L,y
        lda #>spritesF256
        sta VKY_SP0_AD_M,y
        lda #$03
        sta VKY_SP0_AD_H,y

        ; The following initialization is done in _disableSpritesL above

;       sta VKY_SP0_POS_X_L,y           ; initially hide sprite in the border
;       sta VKY_SP0_POS_X_H,y
;       sta VKY_SP0_POS_Y_L,y
;       sta VKY_SP0_POS_Y_H,y

        lda #%01001000                  ; size: 16x16, layer 1, LUT 0, Disable
        cpy #$00
        beq _initSpritePlayerLUT
        lda #%01001010                  ; size: 16x16, layer 1, LUT 1, Disable
_initSpritePlayerLUT
        sta VKY_SP0_CTRL,y              ; TODO: use LUT 1 for enemy sprites

        tya
        clc
        adc #$08
        tay
        cmp #$30
        bne _initSpriteL

_exit
        rts


printSpriteF256
        ; A = sprite index (0 = player, 1..4 = enemies)
        ; X = pixel pos X / 2
        ; Y = pixel pos Y
        asl                             ; * 8 (offset to sprite register block)
        asl
        asl
        sta _spriteRegisterOffset

        lda #$00                        ; Set the I/O page to #0
        sta MMU_IO_CTRL                 ; ($c000-$dfff is I/O)

        tya
        clc
        adc #32                         ; start offset of sprite
        ldy _spriteRegisterOffset
        sta VKY_SP0_POS_Y_L,y
        lda #$00
        sta VKY_SP0_POS_Y_H,y

        txa
        clc
        adc #(32/2)
        asl                             ; calculate actual X position (lb)
        sta VKY_SP0_POS_X_L,y
        lda #$00
        rol
        sta VKY_SP0_POS_X_H,y

        ; set sprite pointer from animation phase
        ldy _spriteRegisterOffset
        bne _printSpriteEnemy
_printSpritePlayer
        lda zpPlayerAnimPhase           ; player animation phase
        jmp _printSpriteJ1
_printSpriteEnemy
        ldx zpEnemyAnimPhase
        lda tabEnemyToPlayerPhase,x

_printSpriteJ1
        clc
        adc #>spritesF256
        sta VKY_SP0_AD_M,y

        rts

_spriteRegisterOffset
        .byte $00

tabEnemyToPlayerPhase
        .byte $00,$01,$02,$03,$04,$05,$07
        .byte $08,$09,$0a,$0b,$0c,$0d,$0f
        .byte $10,$11


enableSpriteF256
        ; A = sprite index (0 = player, 1..4 = enemies)
        asl                             ; * 8 (offset to sprite register block)
        asl
        asl
        tay
        cpy #$00
        beq _enableSpritePlayerLUT
_enableSpriteEnemyLut
        lda #%01001011                  ; size: 16x16, layer 1, LUT 1, Enable
        bne _enableSpriteJ1
_enableSpritePlayerLut
        lda #%01001001                  ; size: 16x16, layer 0, LUT 0, Enable
_enableSpriteJ1
        sta VKY_SP0_CTRL,y
        rts

disableSpriteF256
        ; A = sprite index (0 = player, 1..4 = enemies)
        asl                             ; * 8 (offset to sprite register block)
        asl
        asl
        tay
        cpy #$00
        beq _disableSpritePlayerLUT
_disableSpriteEnemyLut
        lda #%01001010                  ; size: 16x16, layer 1, LUT 1, Disable
        bne _disableSpriteJ1
_disableSpritePlayerLut
        lda #%01001000                  ; size: 16x16, layer 1, LUT 0, Disable
_disableSpriteJ1
        sta VKY_SP0_CTRL,y
        rts

enableSpritesF256
        ; A = max sprite
        tax
        lda #$00                        ; start with sprite 0
_enableSpritesL
        tay
        cpy #$00
        beq _enableSpritePlayerLUT
        lda #%01001011                  ; size: 16x16, layer 1, LUT 1, Enable
        bne _enableSpriteJ1
_enableSpritePlayerLut
        lda #%01001001                  ; size: 16x16, layer 1, LUT 0, Enable
_enableSpriteJ1
        sta VKY_SP0_CTRL,y
        tya
        clc
        adc #$08
        dex
        bpl _enableSpritesL
        rts

disableSpritesF256
        ; A = max. sprite
        tax
        lda #$00                        ; start with sprite 0
_disableSpritesL
        tay
        cpy #$00
        beq _disableSpritePlayerLUT
_disableSpriteEnemyLut
        lda #%01001010                  ; size: 16x16, layer 1, LUT 1, Disable
        bne _disableSpriteJ1
_disableSpritePlayerLut
        lda #%01001000                  ; size: 16x16, layer 1, LUT 0, Disable
_disableSpriteJ1
;;;        lda VKY_SP0_CTRL,y
;;;        and #%11111110                  ; Disable Sprite
        sta VKY_SP0_CTRL,y
        tya
        clc
        adc #$08
        dex
        bpl _disableSpritesL
        rts

.endcomment


.if FOENIX_IDE
schedule_frame                          ; Foenix IDE workaround
        inc frames
        lda #kernel.args.timer.FRAMES
        sta kernel.args.timer.units
        lda frames
        sta kernel.args.timer.absolute
        lda #$01
        sta kernel.args.timer.cookie
        jsr kernel.Clock.SetTimer
        rts

frames                                  ; Foenix IDE workaround
        .byte $00
.endif

event_timer_handler
.if FOENIX_IDE
        sei                             ; Foenix IDE workaround
        jsr customIsr                   ; Foenix IDE workaround
        cli                             ; Foenix IDE workaround
        jsr schedule_frame
.endif
        rts

.comment
        ldx event.timer.cookie
        cpx #TIMER_EVENT_MAX+1
        bcs _exit

        lda #$01
        sta timer_events,x
_exit
        rts
.endcomment

event_irq
        sei
        jsr customIsr
        cli
        lda VIA_T1C_L                   ; EXPERIMENTAL: clear timer1 interrupt flag
        rts

.comment

clearMapAreaDungeon
        ; loop over four banks $018000 - $01ffff
        ; Fill the whole area with #$00 (make all tiles in tileset black)

        lda #$18                ; start at phys. memory $018000
        sta _physBank
_clearBmTilesetL1
        jsr setSwapAreaA000
        lda #$a0                ; start filling at logical $a000
        sta _dest+2             ; high byte of destination
        ldx #$20                ; for all banks but the last fill $20 pages
        lda _physBank
        cmp #$1e
        bne _notLastBank
        ldx #$1a                ; for the last bank, only need to fill $1a pages
_notLastBank
        lda #$00                ; fill value: $00
_clearBmTilesetL2
;;        txa                     ; TODO: TESTING ONLY
;;        and #$0f                ; TODO: TESTING ONLY fill tile with color
        ldy #$00
_dest
        sta $a000,y
        iny
        bne _dest

        inc _dest+2             ; inc high byte of destination
        dex
        bne _clearBmTilesetL2

        inc _physBank
        inc _physBank
        lda _physBank
        cmp #$20
        bne _clearBmTilesetL1

        jsr resetSwapAreaA000   ; restore swap area at $a000
        rts

_physBank
        .byte $00


clearDemoView
        ; TODO: implement
        pha
        ldx #5
_clearDemoViewL1
        clc
        lda tile_map_line_ptr_lb,x
        adc #<tile_map_tile_window
        sta zpDstPtr+0
        lda tile_map_line_ptr_hb,x
        adc #>tile_map_tile_window
        sta zpDstPtr+1

        ldy #2*22-1
_clearDemoViewL2
        lda #$00
        sta (zpDstPtr),y
        dey
        pla                             ; restore "empty tile" id
        sta (zpDstPtr),y
        pha
        dey
        bpl _clearDemoViewL2
        clc
        inx
        cpx #11
        bne _clearDemoViewL1
        pla                             ; discard "empty tile" id from stack
        rts


clearTileMap
        pha                             ; "empty tile" id

        lda #<tile_map_tile_window
        sta zpDstPtr+0

        lda #>tile_map_tile_window
        sta zpDstPtr+1
        ldx #14
clearTilemapL2
        ldy #2*22-1
clearTilemapL1
        lda #$00
        sta (zpDstPtr),y
        dey
        pla                             ; restore "empty tile" id
        ;;lda #11*11
        sta (zpDstPtr),y
        pha
        dey
        bpl clearTilemapL1
        clc
        lda zpDstPtr+0
        adc #2*22
        sta zpDstPtr+0
        lda zpDstPtr+1
        adc #$00
        sta zpDstPtr+1
        dex
        bne clearTilemapL2
        pla                             ; discard "empty tile" id from stack
        rts


setupTiBiMap

        ; re-organize the tilemap: tile_map_tile_window
        ; <row of empty tiles>
        ; <empty>, <empty>, 0,1,2,3,4,5,6,7,8,9,10, <empty>...
        ; <empty>, <empty>, 11,12,13, ....

        ; clear tilemap using tile #11*11
        lda #11*11
        jsr clearTileMap

;;;.comment
        lda #<tile_map_tile_window
        sta zpDstPtr+0
        lda #>tile_map_tile_window
        sta zpDstPtr+1
        ldx #14
_clearTilemapL2
        ldy #2*22-1
_clearTilemapL1
        lda #$00
        sta (zpDstPtr),y
        dey
        lda #11*11
        sta (zpDstPtr),y
        dey
        bpl _clearTilemapL1
        clc
        lda zpDstPtr+0
        adc #2*22
        sta zpDstPtr+0
        lda zpDstPtr+1
        adc #$00
        sta zpDstPtr+1
        dex
        bne _clearTilemapL2
;;;.endcomment


        lda #$00                ; start tile matrix with ID 0
        sta currentTile
        ldx #$00                ; index: row of tiles
_setBmTilemapL1
        clc
        lda tile_map_line_ptr_lb,x
        adc #<tile_map_tile_window
        sta zpDstPtr+0

        lda tile_map_line_ptr_hb,x
        adc #>tile_map_tile_window
        sta zpDstPtr+1

        ldy #$00                ; index: column of tiles
_setMbTilemapL2
        lda currentTile
        sta (zpDstPtr),y
        inc currentTile
        iny
        iny
        cpy #11*2
        bne _setMbTilemapL2

        inx
        cpx #11
        bne _setBmTilemapL1     ; repeat for all lines of map area

        ; switch the tileset to $018000 for pseudo-bitmap display

        lda #$00                ; tileset at $018000
        sta VKY_TS0_ADDR_L
        lda #$80
        sta VKY_TS0_ADDR_M
        lda #$01
        sta VKY_TS0_ADDR_H

        rts

currentTile
        .byte $00


setupSurfaceMap
        ; clear tilemap using tile #$24
        lda #$24
        jsr clearTileMap

        ; set tile set #0

        lda #$00                        ; tileset at $012000
        sta VKY_TS0_ADDR_L
        lda #$20
        sta VKY_TS0_ADDR_M
        lda #$01
        sta VKY_TS0_ADDR_H
        lda #$00                        ; tile set image is vertical
        sta $d283

        rts


showIntroExodus
        ; clear tilemap using tile #11*11
        lda #$24                        ; empty tile in tile set 0
        jsr clearTileMap

        lda #$00                        ; start tile matrix with ID 0
        sta currentTile
        ldx #$00                        ; index: row of tiles
_setBmTilemapL1
        clc
        lda tile_map_line_ptr_lb,x
        adc #<tile_map_tile_window
        sta zpDstPtr+0

        lda tile_map_line_ptr_hb,x
        adc #>tile_map_tile_window
        sta zpDstPtr+1

        ldy #$00                        ; index: column of tiles
_setMbTilemapL2
        lda currentTile
        sta (zpDstPtr),y                ; set tile number
        inc currentTile
        iny
        lda #$02                        ; tileset: 2 ("EXODUS" bitmap)
        sta (zpDstPtr),y                ; update tile attributes
        iny
        cpy #19*2
        bne _setMbTilemapL2

        inx
        cpx #5
        bne _setBmTilemapL1             ; repeat for all lines of map area
        rts
.endcomment


.comment
moveKernelToRam
        ; copy Kernel to RAM ($03e000-$03ffff)

        lda #$3e                        ; start at phys. memory $02e000
        jsr setSwapAreaA000             ; make physical memory $2e000 available at $a000
        lda #$e0                        ; source: $e000 (phys: $e000 ROM)
        ldy #$a0                        ; dest:   $a000 (phys: $e000 RAM)
        ldx #$20                        ; number of pages to copy
        jsr copyMemory

        jsr resetSwapAreaA000           ; restore original configuration for $a000

        ldx #$3                         ; update all 4 MLUTs
_moveKernelToRamL1
        lda _mmuMemCtrlValues,x
        sta MMU_MEM_CTRL
        lda #$3e >> 1                   ; convert address [24..31] to MMU bank
        sta MMU_MEM_BANK_7              ; MMU Edit Register for bank 7 ($E000 - $FFFF)
        dex
        bpl _moveKernelToRamL1

        lda #$03                        ; restore MLUT 3
        sta MMU_MEM_CTRL

        rts

_mmuMemCtrlValues
        .byte $b3,$a3,$93,$83

.endcomment


customIsr
        pha                     ; save registers a,x,y
        txa
        pha
        tya
        pha

        dec viaDelay
.if !FOENIX_IDE
        bpl _skipIrq                    ; Disabled for Foenix IDE workaround
.endif
        lda viaDelayFactor
        sta viaDelay
        jsr irq_handler                 ; handle Pitfall IRQ

_skipIrq
        pla                             ; restore registers y,x,a
        tay
        pla
        tax
        pla
        rts

viaDelay
        .byte $00


copyMemory
        sta zpSrcPtr+1          ; source page: A
        sty zpDstPtr+1          ; dest page: Y
        lda #$00                ; #pages: X
        sta zpSrcPtr+0
        sta zpDstPtr+0
        ldy #$00
_copyMemoryL1
        lda (zpSrcPtr),y
        sta (zpDstPtr),y
        iny
        bne _copyMemoryL1
        inc zpSrcPtr+1
        inc zpDstPtr+1
        dex                     ; copy all pages
        bne _copyMemoryL1
        rts


initViaTimer
        lda #$40                        ; T1 Timer: Continuous Interrupts
        sta VIA_ACR                     ; VIA: Auxiliary Control Register
        lda #<VIA_60_HZ_TIMER_INTERVAL  ; timer value, low byte
        sta VIA_T1C_L                   ; VIA: T1 Low-Order Counter/Latches
        lda #>VIA_60_HZ_TIMER_INTERVAL  ; timer value, high byte
        sta VIA_T1C_H                   ; VIA: T1 High-Order Counter - kick off the timer
        rts

enableViaIrq
        ; also enable VIA0 interrupt on Interrupt Controller
        lda INT_MASK_1
        and #~INT15_VIA                 ; unmask the VIA0 interrupt
        sta INT_MASK_1

        lda #INT15_VIA                  ; clear pending VIA interrupts
        sta INT_PEND_1
        rts

enableViaTimerIrq
        lda #$7f                        ; disable all VIA interrupts
        sta VIA_IER
        lda #$c0                        ; enable Timer1 interrupts
        sta VIA_IER                     ; VIA: Interrupt Enable Register
        lda VIA_T1C_L                   ; EXPERIMENTAL: clear timer1 interrupt flag
        lda #$7f
        sta VIA_IFR                     ; EXPERIMENTAL: clear interrupt flag
        lda #INT15_VIA                  ; EXPERIMENTAL: VIA interrupt flag
        sta INT_PEND_1                  ; EXPERIMENTAL: clear the flag for the VIA IRQ
        rts

setupPitfallIrq
        jsr setDelayFactor              ; set VIA timer delay factor according to machine type
        jsr initViaTimer
        sei
        jsr enableViaIrq
        jsr enableViaTimerIrq
        cli
        rts


setDelayFactor
        lda VKY_MID                     ; Machine ID
        and #$80                        ; check for extended core (uses twice the clock rate)
        beq _setDelayFactorFirstGen     ; no extended core ->
        lda #$03
        bne _setDelayFactor
_setDelayFactorFirstGen
        lda #$01
_setDelayFactor
        sta viaDelayFactor
        rts

viaDelayFactor
        .byte $01


joystickCode                            ; joystick code (no key: $ff)
        .byte $ff

joystickKbdCode                         ; joystick code from keyboard
        .byte $ff

keyboardCode                            ; keyboard matrix code (no key: $00)
        .byte $00

irqFrameCounter
        .byte $00                       ; irq frame counter


get_lineptr_tilemap_bg
        pha
        lda #>tilemap_bg
        bne get_lineptr_j1

get_lineptr_tilemap_fg
        pha
        lda #>tilemap_fg
        bne get_lineptr_j1

get_lineptr_j1
        clc
        adc tilemap_line_ptr_hb,y
        sta zpDstPtr+1
        lda tilemap_line_ptr_lb,y
        sta zpDstPtr+0
        pla
        rts

draw_tile_bg
        phy
        pha
        ldy zp_row
        jsr get_lineptr_tilemap_bg
        lda zp_column
        asl
        tay                             ; target tile column * 2
        pla                             ; restore tile to draw
        sta (zpDstPtr),y
        inc zp_column
        ply
        rts

draw_tile_fg
        phy
        pha
        ldy zp_row
        jsr get_lineptr_tilemap_fg
        lda zp_column
        asl
        tay                             ; target tile column * 2
        pla                             ; restore tile to draw
        sta (zpDstPtr),y
        inc zp_column
        ply
        rts


draw_tile_repeat
        phx                             ; x: # of repeats
        phy
        pha
        ldy zp_row
        jsr get_lineptr_tilemap_bg
        lda zp_column
        asl
        tay                             ; target tile column * 2
        pla                             ; restore tile to draw
_col_loop
        sta (zpDstPtr),y
        inc zp_column
        iny
        iny
        dex
        bne _col_loop
        ply
        plx
        rts


draw_tile_row                           ; draw a horizontal row of tiles
        phx
        ldx #40
        jsr draw_tile_repeat
        ldx #0
        stx zp_column
        inc zp_row
        plx
        rts


.comment
        jsr get_lineptr_tilemap_bg      ; a = tile #, y = row (0..24)
        phy
        ldy #$00
_row_loop
        sta (zpDstPtr),y
        iny
        iny
        cpy #40*2
        bcc _row_loop
        ply
        rts
.endcomment

; offset into text tilemap:
; - 40 characters per row,
; -  2 characters 'border' left and right
; -  2 bytes per tilemap entry (attributes/tile number)

tilemap_line_ptr_lb
        .for row in range(25)
        .byte <(row * 42 * 2 + 2) & $00ff
        .endfor

tilemap_line_ptr_hb
        .for row in range(25)
        .byte >(row * 42 * 2 + 2) & $ff00
        .endfor

spritedata_ptr_lb
        .for sprite_id in range(33)
        .byte <(sprite_id * 24 * 24) & $00ff
        .endfor

spritedata_ptr_hb
        .for sprite_id in range(33)
        .byte >(sprite_id * 24 * 24) & $ff00
        .endfor


        .align $100                     ; align tilemap_text to word
tilemap_bg
        ;.fill 42*25*2, [$20,$05]        ; reserve space for 8x8 tiles
        .fill 42*25*2, [$00,$00]        ; reserve space for 8x8 tiles
                                        ; default tile: blank tile, in tileset 0

        .align $100                     ; align tilemap_text to word
tilemap_fg
        ;.fill 42*25*2, [$20,$05]        ; reserve space for 8x8 tiles
        .fill 42*25*2, [$00,$00]        ; reserve space for 8x8 tiles
                                        ; default tile: blank tile, in tileset 0
