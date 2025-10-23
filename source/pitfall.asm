DO_BUGFIX :?= false

COLOR_BLACK = $00
COLOR_WHITE = $01
COLOR_RED = $02
COLOR_CYAN = $03
COLOR_PURPLE = $04
COLOR_GREEN = $05
COLOR_BLUE = $06
COLOR_YELLOW = $07
COLOR_ORANGE = $08
COLOR_BROWN = $09
COLOR_LIGHTRED = $0a
COLOR_DARKGREY = $0b
COLOR_MIDGREY = $0c
COLOR_LIGHTGREEN = $0d
COLOR_LIGHTBLUE = $0e
COLOR_LIGHTGREY = $0f

CHAR_BLACK = $00
CHAR_SURFACE_FLOOR = $02
CHAR_SURFACE_EARTH = $03
CHAR_UPPER_TRANSITION = $04
CHAR_LADDER_LEFT = $1a
CHAR_LADDER_RIGHT = $1b
CHAR_BRICK_WALL = $1c
CHAR_UNDERGROUND_FLOOR = $1d
CHAR_DENSE_LEAVES = $1e
CHAR_HOLE_UPPER = $20
CHAR_HOLE_LOWER = $21
CHAR_JUNGLE_BACKGROUND = $4a
CHAR_TREE_TRUNK = $4b
CHAR_LOWER_TRANSITION = $4c

SPRITE_ID_PLAYER_JUMPING = $28
SPRITE_ID_PLAYER_STANDING_0 = $2a
SPRITE_ID_PLAYER_LIFE = SPRITE_ID_PLAYER_STANDING_0
SPRITE_ID_ROLLING_LOG_0 = $32
SPRITE_ID_FIRE_0 = $34
SPRITE_ID_SNAKE_0 = $36
SPRITE_ID_CROCODILE = $38
SPRITE_ID_SCORPION_RIGHT = $3b
SPRITE_ID_MONEY_BAG = $3e
SPRITE_ID_GOLD_SILVER_BAR = $40
SPRITE_ID_DIAMOND_RING = $42

VIDEO_NTSC = 60                         ; # of frames per second (NTSC)
VIDEO_PAL  = 50                         ; # of frames per second (PAL)

; Scene descriptions:

SCENE_1_HOLE  = 0                       ; one hole, ladder, wall, no vine, no scorpion
SCENE_3_HOLES = 1                       ; three holes, ladder, wall, no vine, no scorpion
; 2                                     ; fixed black pit, vine, scorpion
; 3                                     ; fixed blue pit, vine, scorpion
SCENE_CROCODILES = 4                    ; fixed blue pit, crocodiles, vine (if zp_objects&1), scorpion
SCENE_TREASURE = 5                      ; treasure, shifting tar pit, no vine, scorpion
; 6                                     ; shifting tar pit, vine, scropion
; 7                                     ; shifting blue pit, no vine, scorpion

X_POS_LADDER_LEFT = $9c                 ; x position left edge of ladder (in sprite coordinates)
X_POS_LADDER_RIGHT = $be                ; x position right edge of ladder (in sprite coordinates)
X_POS_CENTER_SWING_RIGHT = $a5          ; x position (center of screen) for Harry swinging to right
X_POS_LADDER_MIDDLE = $ac               ; x position center of ladder
X_POS_VINE_MIDDLE = X_POS_LADDER_MIDDLE ; x position (center of screen) for Harry swinging to left
X_POS_CROCODILE_0 = $86                 ; x position crocodile 0
X_POS_CROCODILE_1 = $ab                 ; x position crocodile 1
X_POS_CROCODILE_2 = $d0                 ; x position crocodile 2
X_POS_SCORPION_START = $b4              ; x position scorpion start

Y_POS_SCORE = $3c                       ; y position of score and lives indicator
Y_POS_LIFE_INDICATOR = $45
Y_POS_PLAYER_VINE_ANCHOR = $5c          ; y position of Harry at vine anchor (theoretical value)
Y_POS_JUNGLE_GROUND = $96
Y_POS_PLAYER_STUNNED = $99
Y_POS_ROLLING_LOG = $a3
Y_POS_CROCODILE = $a3                   ; y position crocodiles
Y_POS_TOP_OF_LADDER = $a5
Y_POS_NEW_LIFE_UNDERGROUND = $b1
Y_POS_WALL_BOUNCE_THRESHOLD = $c0
Y_POS_UNDER_GROUND = $cf
Y_POS_BOTTOM_OF_LADDER = $cc
Y_POS_TREASURE = $a0                    ; y position treasure (except ring)
Y_POS_TREASURE_RING = $a2               ; y position treasure (ring)

COL_LADDER = 19                         ; x position of ladder (in characters)
COL_WALL_LEFT = 3                       ; x position of wall (in characters)
COL_WALL_RIGHT = 35                     ; x position of wall (in characters)
;COL_HOLE_LEFT = $0d                     ; x position of left hole (right edge) (11-13)
;COL_HOLE_CENTER = $14                   ; x position of center hole (right edge) (19-20)
;COL_HOLE_RIGHT = $1c                    ; x position of right hole (right edge) (26-28)
COL_HOLE_LEFT = 10                      ; x position of left hole (left edge) (10-14)
COL_HOLE_CENTER = 18                    ; x position of center hole (left edge) (18-21)
COL_HOLE_RIGHT = 25                     ; x position of right hole (left edge) (25-29)

ROW_LADDER_TOP = $10

LADDER_LENGTH = 6
WALL_HEIGHT = 4

TEXT_WIDTH = 40

TUNE_TARZAN = 0
TUNE_DEATH = 1
TUNE_TREASURE = 2
TUNE_RUN_OVER_BY_LOG = 3

END_OF_TUNE = $ff

.comment
zp_ntsc_pal = $05                       ; NTSC: $3b, PAL: $31
zp_initialized = $06                    ; 0: cold start, 1: game initialized, restart
zp_lives = $07                          ; # of lives left, including current
zp_room = $08                           ; current room
zp_random = $09                         ; pseudo random number (used for object animation)
zp_player_jumping = $0a                 ; 0: not jumping, 1: currently jumping
zp_background_col_0 = $0b               ; VIC background color 0 (pit color)
zp_vine_y_delta = $0c                   ; swinging vine delta y position relative to anchor
zp_vine_swing_side = $0d                ; 0: vine swings on right side, 1: left side
zp_vine_x_delta_absolute = $0e          ; swinging vine delta x position relative to middle
zp_vine_delay = $0f                     ; 0: don't delay, 1: delay swinging vine
zp_vine_swing_direction = $10           ; 0: outward, 1: inward
zp_room_has_vine = $11
zp_player_x_pos = $12                   ; player x position (2)
zp_player_y_pos = $14
zp_player_run_animation = $15           ; Harry running animation phase (0-4)
zp_treasure_x_pos = $16                 ; treasure x position (2)
zp_treasure_y_pos = $1c                 ; treasure y position
zp_log_0_x_pos = $16                    ; rolling log 0 x position (2)
zp_log_1_x_pos = $18                    ; rolling log 1 x position (2)
zp_log_2_x_pos = $1a                    ; rolling log 2 x position (2)
zp_log_0_y_pos = $1c                    ; rolling log 0 y position
zp_log_1_y_pos = $1d                    ; rolling log 1 y position
zp_log_2_y_pos = $1e                    ; rolling log 2 y position
zp_croc_0_x_pos = zp_log_0_x_pos        ; crocodile 0 x position (2)
zp_croc_1_x_pos = zp_log_1_x_pos        ; crocodile 1 x position (2)
zp_croc_2_x_pos = zp_log_2_x_pos        ; crocodile 2 x position (2)
zp_croc_0_y_pos = zp_log_0_y_pos        ; crocodile 0 y position
zp_croc_1_y_pos = zp_log_1_y_pos        ; crocodile 1 y position
zp_croc_2_y_pos = zp_log_2_y_pos        ; crocodile 2 y position
zp_scorpion_x_pos = $1f                 ; scorpion x position (2)
zp_scorpion_sprite_id = $21
zp_player_stunned = $22                 ; >0: Harry is stunned by a rolling log
zp_at_ladder = $23                      ; >0: Harry is climbing the ladder
zp_at_vine = $24                        ; >0: Harry has grabbed the swinging vine
zp_jump_index = $25                     ; 0: not jumping, >0: jump index, counting up
zp_player_orientation = $26             ; player orientation: 0: facing right, 1: facing left
zp_not_directional_jump = $27           ; 0: directional jump or swinging, >0: otherwise
zp_screen_saver_counter_hb = $28        ; screen blanking counter (hb)
zp_screen_saver_counter_lb = $29        ; screen blanking counter (lb)
zp_crocodile_timer = $2a                ; crocodile timer (open/close jaws) (0..$28)
zp_score = $2b                          ; score (BCD 3)
zp_score_10000 = zp_score+0
zp_score_100   = zp_score+1
zp_score_1     = zp_score+2
zp_minutes = $2e
zp_seconds = $2f
zp_frame_counter = $30                  ; counts down number of frames in a second
zp_treasure_uncollected = $31           ; >=0: uncollected treasure objects, -1: all collected
zp_treasure_collected_flags = $32       ; each bit: 1 = treasure not collected (4)
zp_src = $36                            ; source pointer (2)
zp_dst2 = $36                           ; destination pointer (alternative) (2)
zp_score_var_index = $36                ; index into score variable
zp_delay = $36                          ; delay loop variable
zp_iterator_1 = $36
zp_sound_pitch_abs_value = $36          ; sound pitch (absolute)
zp_or_mask2 = $36
zp_tree_column = $36                    ; screen mem column for current tree trunk
zp_factor_1 = $36                       ; factor 1 in multiplication
zp_factor_2 = $37                       ; factor 2 in multiplication
zp_score_index = $37                    ; index for score/time digits
zp_debounce_counter = $37               ; debounce counter for keyboard
zp_sprite_data_index = $37              ; index into sprite data
zp_tree_pattern_offset = $37            ; offset of tree branch pattern
zp_dst = $38                            ; destination pointer (2)
zp_src2 = $38                           ; source pointer (alternative) (2)
zp_wall_pos = $38                       ; wall position
zp_iterator_0 = $38
zp_vine_x = $38
zp_tree_index2 = $39                    ; 0..3
zp_leaves_layout = $3a                  ; randomized layout of the tree leaves
zp_score_print_zero = $3b               ; 0: pad zero with blank, 1: print actual zero
zp_objects = $3c                        ; bits 0-2 of room
zp_scene_type = $3d                     ; bits 3-5 of room
zp_tree_transition_char = $3e           ; character in tree transition line
zp_tree_index = $3e                     ; 0..3
zp_tree_position = $3e                  ; horizontal position of tree
zp_trees_layout = $3f                   ; randomized layout of the tree trunks, branches etc.
zp_tree_offset = $40                    ; horizontal offset of tree from default position

zp_quicksand_direction = $41            ; 0: pit is opening, 1: pit is closing
zp_quicksand_state = $42                ; 0: closed, 2-5 partially open, 6: open
zp_quicksand_timer = $43                ; timer for keeping pit open or closed (0..$28)
zp_or_mask = $44
zp_vine_dx = $45                        ; dx value
zp_player_x_pos_delta = $46             ; delta value to be added to or subtracted from zp_player_x_pos
zp_log_bounce_counter = $47             ; counter for bouncing rolling logs (0..4)
zp_product_lb = $48                     ; multiplication product (lb)
zp_divisor = $49                        ; divisor in division
zp_temp_x = $4a                         ; temporary backup of x register
zp_temp_y = $4a                         ; temporary backup of y register
zp_vine_y = $4b                         ; temporary: y pos within vine
zp_mirrored_byte = $4b                  ; temporary: mirrored mc byte
zp_vine_change_direction = $4d          ; 0: don't change direction, 1: vine changes direction
zp_collision_surface = $4e              ; sprite-to-sprite collisions on surface level
zp_player_fall_counter = $4f            ; 0: player not falling, >0: player falling, counting down from $39

zp_sound_descending = $50               ; 0: sound sequence ascending, >=1: descending
zp_collision_scorpion = $51             ; 0: no collision, 1: collision with scorpion
zp_blocked_by_wall = $52                ; 0: not blocked, >=$80 blocked by wall, bit 1: orientation
zp_bounce_off_wall = $53                ; 0: normal jump, >0: Harry just bounced off the wall
zp_note_timer = $54                     ; remaining note length
zp_tune_ptr = $55                       ; tune data pointer (2)
zp_sound_falling_counter = $57          ; count down to zero when falling (sound: pitch)
zp_sound_short_counter = $58            ; count down to zero for short sound
zp_sound_short_pitch = $59              ; pitch for short sound
zp_move_on_ladder_timer = $5a           ; delay counter for moving on ladder
zp_sound_jumping_counter = $5b          ; count down to zero when jumping (sound: pitch)
zp_raster_scroll_x = $5c                ; horizontal raster scroll
zp_text_scroll_index = $5d              ; index to current text scroll character
zp_text_scroll_delay = $5e              ; text scroll delay
zp_game_paused = $5f                    ; 0: game is not paused, 1: game is paused

zp_tree_force_middle = $60              ; 0: allow skipping of tree, 1: draw middle tree
zp_tree_0_column = $61                  ; $61-$64: start column of tree trunk x
zp_tree_0_width = $65                   ; $65-$68: width of tree trunk x
zp_keyboard_read = $69                  ; temporary variable (read_keyboard)
zp_nmi_occurred = $6a                   ; 0: no NMI, >0: NMI has been triggered
zp_vic_screen_ctrl_reg2 = $6b
zp_color_ram = $6c
zp_vic_background_color_0 = $6d
.endcomment

sprite_buffer_vine = $0800
.comment
quicksand_screen_data = $1000
.endcomment

screenRAM = $4000
vic_base = $4000
screen_scroll_text = screenRAM + $3c0
sprite_0_pointer = $43f8
sprite_1_pointer = $43f9
sprite_2_pointer = $43fa
sprite_3_pointer = $43fb
sprite_4_pointer = $43fc
sprite_5_pointer = $43fd
sprite_6_pointer = $43fe
sprite_7_pointer = $43ff

sprite_data_ram = vic_base + $0800
character_set_ram = $6000
character_rom_copy = $6400              ; characters starting at $80: "@abcd..."
                                            ; numbers: $b0: "0123456789"
                                            ; upper case: $c1: "ABC..."

ColorRAM = $d800
CharacterROM = $d800

D6510 = $00                             ; Data direction: Processor Port
R6510 = $01                             ; Processor Port
NDX = $c6

KEYD = $0277
PALNTS = $02a6
MODE = $0291                            ; Commodore-Shift switch ($80 = lock character set switch)
CINV = $0314
NMINV = $0318

.comment
VicSprite0XPos = $d000
VicSprite0YPos = $d001
VicSprite1XPos = $d002
VicSprite1YPos = $d003
VicSprite2XPos = $d004
VicSprite2YPos = $d005
VicSprite3XPos = $d006
VicSprite3YPos = $d007
VicSprite4XPos = $d008
VicSprite4YPos = $d009
VicSprite5XPos = $d00a
VicSprite5YPos = $d00b
VicSprite6XPos = $d00c
VicSprite6YPos = $d00d
VicSprite7XPos = $d00e
VicSprite7YPos = $d00f
VicSpritesXPosMsb = $d010
VicScreenCtrlReg1 = $d011
VicRasterValue = $d012
VicLightPenLatchX = $d013
VicLightPenLatchY = $d014
VicSpriteEnable = $d015
VicScreenCtrlReg2 = $d016
VicSpriteExpandY = $d017
VicMemCtrlReg = $d018
VicIrqStatusReg = $d019
VicIrqCtrlReg = $d01a
VicSpritePriority = $d01b
VicSpriteMulticolor = $d01c
VicSpriteExpandX = $d01d
VicSpriteToSpriteCol = $d01e
VicSpriteToBckgndCol = $d01f
VicBorderColor = $d020
VicBackgroundColor0 = $d021
VicBackgroundColor1 = $d022
VicBackgroundColor2 = $d023
VicBackgroundColor3 = $d024
VicSpriteMultiColor0 = $d025
VicSpriteMultiColor1 = $d026
VicSprite0Color = $d027
VicSprite1Color = $d028
VicSprite2Color = $d029
VicSprite3Color = $d02a
VicSprite4Color = $d02b
VicSprite5Color = $d02c
VicSprite6Color = $d02d
VicSprite7Color = $d02e
SidVoice1FreqLb = $d400
SidVoice1FreqHb = $d401
SidVoice1PulseWidthLb = $d402
SidVoice1PulseWidthHb = $d403
SidVoice1CtrlReg = $d404
SidVoice1AttackDecay = $d405
SidVoice1SustainRelease = $d406
SidVoice2FreqLb = $d407
SidVoice2FreqHb = $d408
SidVoice2PulseWidthLb = $d409
SidVoice2PulseWidthHb = $d40a
SidVoice2CtrlReg = $d40b
SidVoice2AttackDecay = $d40c
SidVoice2SustainRelease = $d40d
SidVoice3FreqLb = $d40e
SidVoice3FreqHb = $d40f
SidVoice3PulseWidthLb = $d410
SidVoice3PulseWidthHb = $d411
SidVoice3CtrlReg = $d412
SidVoice3AttackDecay = $d413
SidVoice3SustainRelease = $d414
SidFilterCutoffLb = $d415
SidFilterCutoffHb = $d416
SidFilterCtrlReg = $d417
SidFilterModeVolume = $d418
SidAdPaddle1 = $d419
SidAdPaddle2 = $d41a
SidVoice3Output = $d41b
SidVoice3AdsrOutput = $d41c
Cia1PortA = $dc00
Cia1PortB = $dc01
Cia1PortADataDir = $dc02
Cia1PortBDataDir = $dc03
Cia1TimerALb = $dc04
Cia1TimerAHb = $dc05
Cia1TimerBLb = $dc06
Cia1TimerBHb = $dc07
Cia1TimeOfDayDseconds = $dc08
Cia1TimeOfDaySeconds = $dc09
Cia1TimeOfDayMinutes = $dc0a
Cia1TimeOfDayHours = $dc0b
Cia1SerialShiftReg = $dc0c
Cia1IrqCtrlReg = $dc0d
Cia1TimerACtrlReg = $dc0e
Cia1TimerBCtrlReg = $dc0f
Cia2PortA = $dd00
Cia2PortB = $dd01
Cia2PortADataDir = $dd02
Cia2PortBDataDir = $dd03
Cia2TimerALb = $dd04
Cia2TimerAHb = $dd05
Cia2TimerBLb = $dd06
Cia2TimerBHb = $dd07
Cia2TimeOfDayDseconds = $dd08
Cia2TimeOfDaySeconds = $dd09
Cia2TimeOfDayMinutes = $dd0a
Cia2TimeOfDayHours = $dd0b
Cia2SerialShiftReg = $dd0c
Cia2IrqCtrlReg = $dd0d
Cia2TimerACtrlReg = $dd0e
Cia2TimerBCtrlReg = $dd0f
.endcomment

.enc "high"
.cdef $00,$3f,$00
.cdef $40,$7f,$c0



Cartridge_Start
        sei
        cld
;;        jsr init_hardware               ; init CIAs, SID, Processor Port
        jsr initF256                    ; initialize F256 hardware

        ; determine the video mode: Are we running in NTSC or PAL?

        ; on F256 platform we don't differentiate between NTSC and PAL.
        ; For compatibility, simply set zp_ntsc_pal to #VIDEO_NTSC.

        ldx #VIDEO_NTSC
        stx zp_ntsc_pal                 ; NTSC: 60, PAL: 50
        lda #$00
        sta zp_initialized              ; 0: cold start, 1: game initialized, restart
        beq cold_start

warm_start
l8035
        lda #$01
        sta zp_initialized              ; 0: cold start, 1: game initialized, restart

cold_start
l8039
        lda #$00                        ; init value for variables
        tax                             ; iterator
        ldy zp_initialized              ; 0: cold start, 1: game initialized, restart
        bne _skip_zp_initialized        ; skip overwriting zp_initialized
_loop_clear_zp
        sta @w zp_initialized,x         ; clear zero page
_skip_zp_initialized
;;        sta VicSprite0XPos,x            ; clear VIC registers
        inx
        cpx #zp_end-zp_initialized
        bne _loop_clear_zp

        tax
_loop_init_SID
        sta SidVoice1FreqLb,x               ; clear SID registers
        inx
        cpx #SidVoice3AdsrOutput-SidVoice1FreqLb+1
        bne _loop_init_SID

        ldx #$ff                            ; x = $ff
        txs                                 ; reset stack pointer

        jsr setup_game                      ; initialize hardware and setup game data
;;        lda #$80                            ; lock character set (upper case letters only)
;;        sta MODE                            ; Commodore-Shift switch ($80 = lock character set switch)


        jsr init_game

the_end
        jmp the_end

        lda zp_initialized                  ; 0: cold start, 1: game initialized, restart
        bne _skip_wait_for_f1
        jsr display_scroll_text             ; scroll copyright text until player presses F1

_skip_wait_for_f1
        jsr display_activision_logo
_wait_for_joystick_input
        jsr read_joystick
        and #$0f                            ; extract joystick directions
        cmp #$0f                            ; any direction selected?
        beq _wait_for_joystick_input        ; no -> continue waiting, don't start game just yet

        lda zp_ntsc_pal
        sta zp_frame_counter                ; counts down number of frames in a second
        lda #$00                            ; initial game time: 20:00
        sta zp_seconds                      ; seconds = $00
        lda #$20
        sta zp_minutes                      ; minutes = $20

l8078
game_loop
        jsr player_move
        jsr sound_handler                   ; handle playback of sound effects
        jsr swinging_vine_move              ; move/update the swinging vine

        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        beq _game_loop_skip_1
        jsr player_move
        jsr sound_handler
_game_loop_skip_1
        jsr objects_move                    ; move/update objects:
                                            ; scorpion, crocodiles, quicksand, rolling logs
        jsr check_hazards

        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        beq _game_loop_skip_2
        jsr player_move
        jsr sound_handler
_game_loop_skip_2
        jsr print_score_and_timer

        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        beq _game_loop_skip_3
        jsr player_move
_game_loop_skip_3
        jsr sound_handler
        jsr handle_pause_game               ; handle RUN/STOP and pause the game accordingly

        lda zp_minutes                      ; running out of time?
        ora zp_seconds                      ; (minutes == seconds == 0)
        bne game_loop                       ; no -> continue game


        jsr display_scroll_text             ; scroll copyright text until player presses F1
        jmp warm_start


l80b7
player_move
        jsr read_joystick
        tay                                 ; y: joystick input
        lda zp_player_fall_counter          ; 0: player not falling, >0: player falling, counting down from $39
        beq _check_stunned_by_log
        jmp move_falling_player

_check_stunned_by_log
        lda zp_player_stunned               ; >0: Harry is stunned by a rolling log
        beq _check_at_vine                  ; no ->
        jmp move_stunned_player
_check_at_vine
        lda zp_at_vine                      ; >0: Harry has grabbed the swinging vine
        beq _check_at_ladder                ; no ->
        jmp move_on_vine

_check_at_ladder
        lda zp_at_ladder                    ; >0: Harry is climbing the ladder
        beq _check_is_jumping               ; no ->
        jmp move_on_ladder

_check_is_jumping
        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        beq _check_start_jump
        bne _continue_jump

_start_jump
        inc zp_player_jumping               ; start the jump (0: not jumping, 1: currently jumping)
        lda #$10
        sta zp_sound_jumping_counter        ; count down to zero when jumping (sound: pitch)
_continue_jump
        jmp move_continue_jump

_check_start_jump
        tya                                 ; joystick input
        and #$10                            ; fire button pressed?
        bne _not_jumping                    ; no ->
        lda zp_player_jumping               ; 0: not jumping, 1: currently jumping
        beq _start_jump                     ; not jumping yet -> start the jump
        bne _prevent_double_jump            ; fire button still pressed from previous jump?

_not_jumping
        lda #$00
        sta zp_player_jumping
_prevent_double_jump
;l80f5
        lda zp_collision_surface            ; sprite-to-sprite collisions on surface level
        and #$39                            ; collision with rolling log?
        sta zp_collision_surface            ; sprite-to-sprite collisions on surface level
        lda zp_player_y_pos
        cmp #Y_POS_UNDER_GROUND
        bne _check_joystick_down

        tya                                 ; y: joystick input
        ror                                 ; joystick up pressed?
        bcs _check_joystick_down            ; no ->
        ldx #Y_POS_BOTTOM_OF_LADDER
        jsr check_step_on_ladder
_check_joystick_down
        tya                                 ; y: joystick input
        and #$02                            ; joystick down pressed?
        bne check_joystick_horizontal       ; no ->
        ldx #Y_POS_TOP_OF_LADDER
        jsr check_step_on_ladder
        jmp check_joystick_horizontal

l8117
check_step_on_ladder                    ; parameter: x (target y position on ladder)
        lda zp_scene_type
        cmp #$02                            ; does scene have ladder?
        bcs _exit                           ; no ->
        cpx #Y_POS_TOP_OF_LADDER            ; (parameter) target y pos on ladder: top?
        bne _check_ladder_x_pos             ; no ->
        lda zp_player_y_pos
        cmp #Y_POS_JUNGLE_GROUND+1          ; player y pos > jungle ground? (Harry is jumping)
        bcs _exit                           ; BUG: should be bcc? while jumping can't climb down
_check_ladder_x_pos
        lda zp_player_x_pos+1
        bne _exit
        lda zp_player_x_pos
        cmp #X_POS_LADDER_LEFT              ; ladder left edge
        bcc _exit
        cmp #X_POS_LADDER_RIGHT+1           ; ladder right edge
        bcs _exit
        lda #X_POS_LADDER_MIDDLE            ; center of ladder
        sta zp_player_x_pos                 ; place Harry at middle of ladder
        txa                                 ; parameter: y ladder position (parameter)
        sta zp_player_y_pos                 ; place Harry on top or bottom of ladder
        inc zp_at_ladder                    ; flag: Harry is climbing the ladder
        pla
        pla                                 ; pull return address off stack
        jmp set_player_sprite_standing
_exit
        rts

check_joystick_horizontal
l8144
        tya                                 ; y: joystick input
        and #$0c                            ; isolate bits 2,3 (joystick left / right)
        cmp #$0c                            ; joystick left or right pressed?
        bne player_move_horizontal          ; yes ->
        jmp set_player_sprite_standing

player_move_horizontal
        sta zp_not_directional_jump         ; 0: directional jump or swinging, >0: otherwise
        ldx #$04
        stx zp_player_x_pos_delta           ; delta value to be added to or subtracted from zp_player_x_pos

joystick_left_right
l8154
        lsr                                 ; joystick right pressed? (yes: 0)
        lsr
        lsr
        sta zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
l8159
player_move_update_x_pos
        lda zp_blocked_by_wall              ; 0: not blocked, >=$80 blocked by wall, bit 1: orientation
        beq _move_not_blocked_by_wall       ; not blocked by wall ->
        and #$01
        cmp zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        beq animate_player_run_or_jump
_move_not_blocked_by_wall
        lda zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        beq _player_move_right
_player_move_left
        lda zp_player_x_pos                 ; decrement Harry's x pos
        sec
        sbc zp_player_x_pos_delta           ; delta value to be added to or subtracted from zp_player_x_pos
        sta zp_player_x_pos
.if DO_BUGFIX == false
        lda zp_player_x_pos+1
        lda zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
.endif
        lda zp_player_x_pos+1
        bne _player_move_left_adjust_x_hi   ; on right part of screen -> check/adjust x-pos high byte
        lda zp_player_x_pos
        cmp #$16
        bcs animate_player_run_or_jump
        bcc enter_new_room                  ; -> enter new room to the left
_player_move_left_adjust_x_hi
        bcs _skip_dec_x_pos_hi              ; no underflow ->
        dec zp_player_x_pos+1               ; adjust x-pos high byte
_skip_dec_x_pos_hi
        jmp animate_player_run_or_jump

_player_move_right
;l8185
        lda zp_player_x_pos                 ; increment Harry's x pos
        clc
        adc zp_player_x_pos_delta           ; delta value to be added to or subtracted from zp_player_x_pos
        sta zp_player_x_pos
        lda zp_player_x_pos+1               ; on right side of screen?
        beq _player_move_right_adjust_x_hi  ; no -> not entering new room to the right
        lda zp_player_x_pos
        cmp #$42                            ; player x pos >= $142?
        bcc animate_player_run_or_jump
        bcs enter_new_room                  ; -> enter new room to the right
_player_move_right_adjust_x_hi
        bcc _skip_inc_x_pos_hi              ; no overflow ->
        inc zp_player_x_pos+1               ; adjust x-pos high byte
_skip_inc_x_pos_hi
        jmp animate_player_run_or_jump

enter_new_room
        lda #$00                            ; hide player sprite during room transition
        sta zp_player_x_pos                 ; (hide Harry behind left border)
        sta zp_player_x_pos+1
        ldx #$01                            ; move one room (surface)
        lda zp_player_y_pos
        cmp #$9b                            ; player underground?
        bcc _calc_next_room                 ; no ->
        ldx #$03                            ; move three rooms (underground tunnel)
_calc_next_room
        jsr calculate_next_room

        ldx zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        lda player_x_start_pos_lb,x
        sta zp_player_x_pos                 ; set x start pos lb for new room
        lda player_x_start_pos_hb,x
        sta zp_player_x_pos+1               ; set x start pos hb for new room

_wait_vertical_blanking
        lda VicScreenCtrlReg1               ; wait for MSB raster line = 1
        bpl _wait_vertical_blanking

        lda #$00
        sta zp_collision_surface            ; sprite-to-sprite collisions on surface level
        sta zp_collision_scorpion           ; 0: no collision, 1: collision with scorpion
        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        beq animate_player_run_or_jump      ; not jumping ->
        lda #$14                            ; set to jump index of maximum height
        sta zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        lda #Y_POS_JUNGLE_GROUND-10         ; current jump level (new room, above ground)
        ldx zp_player_y_pos
        cpx #Y_POS_JUNGLE_GROUND+1          ; player on surface level?
        bcc _enter_room_extend_jump         ; yes ->
        lda #Y_POS_UNDER_GROUND-10          ; current jump level (new room, below ground)
_enter_room_extend_jump
        sta zp_player_y_pos

animate_player_run_or_jump
        jsr set_player_sprite_run_or_jump
        rts

player_x_start_pos_lb
        .byte $16,$42                       ; left start pos: $016, right start pos: $142

player_x_start_pos_hb
        .byte $00,$01

l81e5
set_player_sprite_standing
        lda #SPRITE_ID_PLAYER_STANDING_0    ; sprite id: Harry standing right
        ora zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        sta sprite_0_pointer
        sta zp_not_directional_jump         ; 0: directional jump or swinging, >0: otherwise
        lda #$00
        sta zp_player_run_animation         ; Harry running animation phase (0-4)
        rts

move_continue_jump
        ldx zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        lda zp_player_y_pos                 ; adjust y position according to jump phase
        sec
        sbc jump_y_delta_table,x            ; subtract delta according to jump index
        sta zp_player_y_pos
        inx                                 ; inc jump index
        stx zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        cpx #$24                            ; jump sequence ending?
        bne _move_try_to_catch_a_vine       ; no ->

        lda #$00                            ; set to: not jumping
        sta zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        sta zp_sound_descending             ; 0: sound sequence ascending, >=1: descending
        sta zp_bounce_off_wall              ; 0: normal jump, >0: Harry just bounced off the wall
        beq _move_jump_vine_not_caught

_move_try_to_catch_a_vine
        lda zp_sound_descending             ; 0: sound sequence ascending, >=1: descending
        bne _move_jump_vine_not_caught      ; currently jumping off a vine ->
        lda zp_room_has_vine                ; does the room contain a swinging vine?
        beq _move_jump_vine_not_caught      ; no ->
        lda zp_player_x_pos+1               ; player x pos > 255?
        bne _move_jump_vine_not_caught      ; yes -> out of reach for vine
        lda zp_player_y_pos
        cmp #Y_POS_JUNGLE_GROUND+1          ; player y pos below surface level?
        bcs _move_jump_vine_not_caught      ; yes -> out of reach for vine

        lda zp_not_directional_jump         ; 0: directional jump or swinging, >0: otherwise
        bne _vine_out_of_reach
        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        cmp #$0e                            ; jump index in range $0e..$16 (14-22) ?
        bcc _vine_out_of_reach              ; no -> can't catch swinging vine
        cmp #$17
        bcs _vine_out_of_reach              ; no -> can't catch swinging vine

        jsr get_vine_x_pos
        sec
        sbc zp_player_x_pos                 ; Harry x-pos >= swinging vine x-pos?
        bcs _compare_player_vine_x_pos      ; yes ->
        eor #$ff                            ; else, invert delta x
        clc
        adc #$01

_compare_player_vine_x_pos
        cmp #$0a                            ; delta x-pos < 10?
        bcc _grab_swinging_vine             ; yes -> grab swinging vine

_vine_out_of_reach                      ; Harry cannot grab vine at a distance, try sprite collision
_l823f
        lda zp_collision_surface            ; sprite-to-sprite collisions on surface level
        and #$c6                            ; collision with swinging vine?
        beq _move_jump_vine_not_caught

_grab_swinging_vine
_l8245
        lda #$00                            ; jump index: not jumping
        sta zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        inc zp_at_vine                      ; harry grabs the swinging vine
        lda #TUNE_TARZAN                    ; play tune: Tarzan yell
        jmp play_tune

_move_jump_vine_not_caught
_l8250
        ldx zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        cpx #$01                            ; just starting a jump?
        bne player_move_jump_update         ; yes ->

        jsr read_joystick
        tay                                 ; y: joystick input
        and #$04                            ; joystick left pressed?
        bne _start_jump_check_right         ; no ->
        lda #$01                            ; start a jump to the left!
        sta zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        lda #$00
        sta zp_not_directional_jump         ; 0: directional jump or swinging, >0: otherwise
        beq player_move_jump_update

_start_jump_check_right
        tya                                 ; joystick input
        and #$08                            ; joystick right pressed?
        bne player_move_jump_update         ; no ->
        lda #$00
        sta zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        sta zp_not_directional_jump         ; 0: directional jump or swinging, >0: otherwise

player_move_jump_update
l8273
        lda zp_not_directional_jump         ; 0: directional jump or swinging, >0: otherwise
        bne set_player_sprite_run_or_jump
        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        ror
        bcc set_player_sprite_run_or_jump
        lda #$02                            ; move 2 pixels at a time in x direction when jumping
        sta zp_player_x_pos_delta           ; delta value to be added to or subtracted from zp_player_x_pos
        jmp player_move_update_x_pos


l8283
set_player_sprite_run_or_jump
        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        ora zp_player_stunned               ; >0: Harry is stunned by a rolling log
        bne set_player_sprite_jumping

        inc zp_player_run_animation         ; Harry running animation phase (0-4)
        lda zp_player_run_animation         ; Harry running animation phase (0-4)
        cmp #$05
        bne _set_harry_running_sprite
        lda #$00                            ; reset animation cycle
        sta zp_player_run_animation         ; Harry running animation phase (0-4)
_set_harry_running_sprite
        tax                                 ; animation phase
        lda harry_run_animation_sprite_id,x
        ora zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        sta sprite_0_pointer
        rts

l829f
set_player_sprite_jumping
        lda #$00
        sta zp_player_run_animation         ; Harry running animation phase (0-4)
        lda #SPRITE_ID_PLAYER_JUMPING       ; sprite id: Harry jumping
        ora zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        sta sprite_0_pointer
        rts

l82ab
move_on_ladder
        inc zp_move_on_ladder_timer         ; delay counter for moving on ladder
        lda zp_move_on_ladder_timer         ; delay counter for moving on ladder
        cmp #$02
        beq _move_on_ladder_j1
        rts

_move_on_ladder_j1
        lda #$00
        sta zp_move_on_ladder_timer         ; delay counter for moving on ladder
        tya                                 ; joystick directions
        ror                                 ; joystick up pressed?
        bcs _joystick_not_up                ; no ->
        lda zp_player_y_pos
        cmp #Y_POS_TOP_OF_LADDER            ; at top of ladder?
        beq _joystick_not_down              ; yes ->
        dec zp_player_y_pos                 ; climb up three pixels
        dec zp_player_y_pos
        dec zp_player_y_pos
        bne set_player_sprite_climbing      ; always branch -> update Harry sprite

_joystick_not_up
        tya                                 ; joystick directions
        and #$02                            ; joystick down pressed?
        bne _joystick_not_down              ; no ->
        lda zp_player_y_pos
        cmp #Y_POS_UNDER_GROUND             ; at underground level?
        bne _climb_down_ladder              ; no -> climb down
                                            ; else: step off ladder

_leave_ladder                           ; move away from ladder
_l82d5
        lda #$00                            ; start a directional jump
        sta zp_not_directional_jump         ; 0: directional jump or swinging, >0: otherwise
        sta zp_at_ladder                    ; 0: harry not on ladder, >=1: harry is climbing the ladder
        lda zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        beq _step_off_ladder_right
_step_off_ladder_left
        dec zp_player_x_pos                 ; move one step to left
        dec zp_player_x_pos
        bne _exit
_step_off_ladder_right
        inc zp_player_x_pos                 ; move one step to right
        inc zp_player_x_pos
_exit
        rts

_climb_down_ladder
        inc zp_player_y_pos                 ; climb down three pixels
        inc zp_player_y_pos
        inc zp_player_y_pos
        bne set_player_sprite_climbing      ; always branch ->

_joystick_not_down
        lda zp_player_y_pos
        cmp #Y_POS_TOP_OF_LADDER
        bne set_player_sprite_climbing
        tya                                 ; y: joystick input
        and #$0c                            ; isolate bits 2,3 (joystick left / right)
        cmp #$0c                            ; joystick left or right pressed?
        beq set_player_sprite_climbing      ; no ->
                                            ; Harry jumps off ladder:
        ror                                 ; joystick left into bit 1
        ror
        and #$01                            ; isolate joystick left (0: yes, 1: no)
        eor #$01                            ; invert (1: left pressed, 0: left not pressed)
        sta zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
.if DO_BUGFIX == false
        inc zp_player_jumping               ; BUG: this clears the zero flag! BNE below always true!
.endif

        bne _jump_from_ladder_to_left       ; joystick left (jump to the left?) ->
        lda #X_POS_LADDER_MIDDLE+2          ; start value for jumping to the right
        bne _jump_from_ladder_adjust_x_pos
_jump_from_ladder_to_left
        lda #X_POS_LADDER_MIDDLE-2          ; start value for jumping to the left
_jump_from_ladder_adjust_x_pos
        sta zp_player_x_pos

.if DO_BUGFIX
        inc zp_player_jumping               ; BUGFIX: move the line here in order to fix the bug
.endif
        lda #$01                            ; start the jump sequence off the ladder
        sta zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        lda #$95
        sta zp_player_y_pos
        lda #$10
        sta zp_sound_jumping_counter        ; count down to zero when jumping (sound: pitch)
        bne _leave_ladder                   ; move away from ladder

set_player_sprite_climbing
        lda zp_player_y_pos                 ; get lowest bit of Harry y-position
        and #$01                            ; (decides on phase of climbing sprite)
        sta zp_or_mask2                     ; climbing phase
        lda #$2e                            ; sprite id: Harry climbing, phase 0
        ora zp_or_mask2                     ; modify climbing phase
        sta sprite_0_pointer                ; update Harry's sprite pointer
        rts


l832f
move_on_vine
        lda #$2c                            ; sprite id: Harry swinging on vine (facing right)
        ora zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        sta sprite_0_pointer                ; set Harry sprite to swinging
        jsr get_player_at_vine_x_pos
        sta zp_player_x_pos
        lda #Y_POS_PLAYER_VINE_ANCHOR       ; ($5c) y position of Harry at vine anchor (theoretical value)
        clc
        adc zp_vine_y_delta                 ; swinging vine delta y position relative to anchor
        sta zp_player_y_pos
        tya                                 ; joystick directions
        and #$02                            ; joystick down pressed?
        bne clear_vine_sprite_collision     ; clear sprite collision with vine and exit

_player_lets_go_of_vine                 ; Harry lets go of the swinging vine
        lda zp_vine_x_delta_absolute        ; delta x position relative to middle
        cmp #$37
        bcc _player_jump_off_vine_vertical  ; jump off vine straight down
_player_jump_off_vine_directional
_l834d
        lda #$2c                            ; sprite id: Harry swinging on vine (facing right)
        sec
        sbc zp_vine_swing_side              ; 0: vine swings on right side, 1: left side. BUG? should be adc?
        sta sprite_0_pointer                ; BUG? sprite either "swing right" or "stand left"
        lda #$00                            ; start a directional jump
        sta zp_not_directional_jump         ; 0: directional jump or swinging, >0: otherwise
        sta zp_at_vine                      ; harry lets go of the swinging vine
_player_jump_off_vine_common
        lda #$10
        sta zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        sta zp_sound_descending             ; 0: sound sequence ascending, >=1: descending
        lda #$10
        sta zp_sound_jumping_counter        ; count down to zero when jumping (sound: pitch)
        lda zp_vine_swing_side              ; 0: vine swings on right side, 1: left side
        sta zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        lda #$8c
        sta zp_player_y_pos
        bne clear_vine_sprite_collision     ; branch always -> clear sprite collision with vine and exit

_player_jump_off_vine_vertical
        inc zp_not_directional_jump         ; 0: directional jump or swinging, >0: otherwise
        lda #$00
        sta zp_at_vine                      ; harry lets go of the swinging vine
        beq _player_jump_off_vine_common

clear_vine_sprite_collision
        lda zp_collision_surface            ; sprite-to-sprite collisions on surface level
        and #$39                            ; clear collision with swinging vine
        sta zp_collision_surface            ; sprite-to-sprite collisions on surface level
        rts

get_player_at_vine_x_pos
l837e
        lda zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        ror                                 ; Harry facing right?
        lda #X_POS_CENTER_SWING_RIGHT       ; ($a5) center x-position for Harry swinging to right
        bcc get_player_at_vine_pos_j1

get_vine_x_pos
l8385
        lda #X_POS_VINE_MIDDLE              ; ($ac) center x-position for Harry swinging to left
get_player_at_vine_pos_j1
        ldx zp_vine_swing_side              ; 0: vine swings on right side, 1: left side
        beq _get_vine_x_pos_right_side      ; vine on right side -> (add x delta)
        sec                                 ; else: left side (subtract x delta)
        sbc zp_vine_x_delta_absolute        ; delta x position relative to middle
        bne _exit
_get_vine_x_pos_right_side
        clc
        adc zp_vine_x_delta_absolute        ; delta x position relative to middle
_exit
        rts                                 ; return with vine x position

move_falling_player
        inc zp_player_y_pos
        inc zp_player_y_pos
        inc zp_player_y_pos
        dec zp_player_fall_counter          ; 0: player not falling, >0: player falling, counting down from $39
        dec zp_player_fall_counter          ; 0: player not falling, >0: player falling, counting down from $39
        dec zp_player_fall_counter          ; 0: player not falling, >0: player falling, counting down from $39
        lda zp_player_fall_counter          ; 0: player not falling, >0: player falling, counting down from $39
        cmp #$18                            ; on last 24 pixels of fall, Harry switches
        bcs _use_player_sprite_standing     ;    from standing to a jumping stance...
        jmp set_player_sprite_jumping
_use_player_sprite_standing
        jmp set_player_sprite_standing

decrement_score
l83ac
        lda zp_score_10000                  ; score > 0?
        ora zp_score_100
        ora zp_score_1
        beq _exit                           ; no ->
        lda zp_score_1
        sed                                 ; decimal mode ON
        sec
        sbc #$01                            ; subtract 1 from current score
        sta zp_score_1                      ; score * 1
        lda zp_score_100
        sbc #$00
        sta zp_score_100                    ; score * 100
        lda zp_score_10000
        sbc #$00
        sta zp_score_10000                  ; score * 10000
        cld                                 ; decimal mode OFF
_exit
        rts


l83ca
move_stunned_player
        lda #Y_POS_PLAYER_STUNNED
        sta zp_player_y_pos
        jsr set_player_sprite_jumping
        jsr decrement_score
        jsr decrement_score
        jsr decrement_score
        lda zp_objects
        cmp #$04                            ; rolling or stationary logs in scene?
        bcc _exit                           ; rolling logs ->
        tya                                 ; y: joystick input
        and #$0c                            ; isolate bits 2,3 (joystick left / right)
        cmp #$0c                            ; joystick left or right pressed?
        beq _exit                           ; neither is pressed ->
        jmp joystick_left_right
_exit
        rts


l83eb
objects_move
        lda zp_scene_type
        cmp #$04                            ; room has crocodiles?
        bne _no_crocodiles                  ; no ->
        jsr crocodile_handle_jaws
        jsr scorpion_move
        rts

_no_crocodiles
        cmp #$02
        bcc _no_scorpion
        jsr scorpion_move

_no_scorpion
        lda zp_scene_type
        cmp #$05
        bcc _no_quicksand
        jsr quicksand_move

_no_quicksand
        lda zp_scene_type
        cmp #$05                            ; does scene contain treasure?
        beq _exit                           ; yes -> no enemy objects in this room

        ; scene_types: not 4 (crocodiles), not 5 (treasure)
        lda zp_objects
        cmp #$06                            ; fire (6) or snake (7)?
        bcs _exit                           ; yes -> no move required
        jsr rolling_log_move                ; move rolling logs (stationary logs return immediately)
_exit
        rts

crocodile_handle_jaws
        inc zp_crocodile_timer              ; timer: crocodile jaws open/close
        lda zp_crocodile_timer
        cmp #$28                            ; timer: toggle time reached?
        bne _exit                           ; no ->

        lda sprite_3_pointer                ; crocodiles: toggle jaws open/closed
        eor #$01                            ; toggle sprite id (open/closed)
        sta sprite_3_pointer
        sta sprite_4_pointer
        sta sprite_5_pointer
        lda #$00
        sta zp_crocodile_timer
_exit
        rts

scorpion_move
l8433
        lda zp_scorpion_x_pos+1             ; scorpion position, high bit
        cmp zp_player_x_pos+1               ; compare with player position
        bcc scorpion_move_right             ; scorpion_x < player_x ? ->
        bne scorpion_move_left              ; scorpion_x > player_x ? ->
        lda zp_scorpion_x_pos               ; scorpion position, low byte
        cmp zp_player_x_pos                 ;
        beq scorpion_move_exit              ; scorpion_x = player_x ? ->
        bcc scorpion_move_right             ; scorpion_x < player_x ? ->

scorpion_move_left
        lda zp_scorpion_x_pos
        sec
        sbc #$01
        sta zp_scorpion_x_pos
        bcs _no_underflow
        dec zp_scorpion_x_pos+1
_no_underflow
        and #$02                            ; position bit 1: animation phase
        lsr                                 ; convert to phase 0 or 1
        ora #$3c                            ; sprite id: scorpion left (phase 0)
        sta zp_scorpion_sprite_id
        rts

scorpion_move_right
        lda zp_scorpion_x_pos
        clc
        adc #$01
        sta zp_scorpion_x_pos
        bcc _no_overflow
        inc zp_scorpion_x_pos+1
_no_overflow
        and #$02                            ; position bit 1: animation phase
        lsr                                 ; convert to phase 0 or 1
        ora #$3a                            ; sprite id: scorpion right (phase 0)
        sta zp_scorpion_sprite_id
scorpion_move_exit
        rts

quicksand_move
l8469
        lda zp_quicksand_state              ; 0: closed, 2-5 partially open, 6: open
        beq _quicksand_process_timer        ; quicksand currently closed -> process timer
        cmp #$06                            ; quicksand currently open?
        bne _quicksand_process_state        ; no -> continue opening or closing
_quicksand_process_timer
        inc zp_quicksand_timer              ; timer for keeping pit open or closed ($00..$27)
        lda zp_quicksand_timer
        cmp #$28                            ; timer expired?
        beq _quicksand_process_state
        rts

_quicksand_process_state
        lda #$00                            ; reset quicksand timer
        sta zp_quicksand_timer              ; start timer for keeping pit open or closed ($00..$27)
        lda zp_quicksand_direction          ; 0: pit is opening, 1: pit is closing
        beq _quicksand_process_opening      ; pit opening ->
_quicksand_process_closing
        dec zp_quicksand_state              ; 0: closed, 2-5 partially open, 6: open
        bne _quicksand_move_exit            ; not closed yet ->
        lda #$00                            ; reverse direction: pit is opening
        sta zp_quicksand_direction          ; 0: pit is opening, 1: pit is closing
_quicksand_move_exit
        jsr draw_quicksand
        rts

_quicksand_process_opening
        inc zp_quicksand_state              ; 0: closed, 2-5 partially open, 6: open
        lda zp_quicksand_state              ; 0: closed, 2-5 partially open, 6: open
        cmp #$06                            ; pit completely open?
        bne _quicksand_move_exit_2          ; not open yet ->
        inc zp_quicksand_direction          ; reverse direction to 1: pit is closing
_quicksand_move_exit_2
        jsr draw_quicksand
        rts


swinging_vine_move
l849c
        ; The vine is swinging faster in the middle
        ; and slower when about to switch direction.
        ; The following code accounts to that slow-down.

        lda zp_vine_delay                   ; 0: don't delay, 1: delay swinging vine
        beq _vine_no_delay
        dec zp_vine_delay                   ; 0: don't delay, 1: delay swinging vine
        jsr draw_swinging_vine_sprites
        ldy #$07
        ldx #$00
_wait_loop
        dex
        bne _wait_loop
        dey
        bne _wait_loop
        rts

_vine_no_delay
        lda zp_vine_x_delta_absolute        ; delta x position relative to middle
        cmp #$32
        bcc _check_swing_direction
        inc zp_vine_delay                   ; 0: don't delay, 1: delay swinging vine
_check_swing_direction
        ldx zp_vine_swing_direction         ; 0: outward, 1: inward
        bne _vine_swing_inward
_vine_swing_outward
        clc
        adc #$04                            ; vine x pos += 4
        cmp #$46                            ; maximum of arc reached?
        bcs _change_vine_swing_dir_inward
        sta zp_vine_x_delta_absolute        ; delta x position relative to middle
        jsr draw_swinging_vine_sprites
        rts

_change_vine_swing_dir_inward
        inc zp_vine_swing_direction         ; 0: outward, 1: inward
_vine_swing_inward
        sec
        sbc #$04
        beq _change_vine_swing_dir_outward
        bmi _change_vine_swing_dir_outward
        sta zp_vine_x_delta_absolute        ; delta x position relative to middle
        jsr draw_swinging_vine_sprites
        rts

_change_vine_swing_dir_outward
        lda #$00                            ; swing direction: outward
        sta zp_vine_swing_direction         ; 0: outward, 1: inward
        inc zp_vine_change_direction        ; 0: don't change direction, 1: vine changes direction
        lda zp_vine_x_delta_absolute        ; delta x position relative to middle
        clc
        adc #$04
        sta zp_vine_x_delta_absolute        ; delta x position relative to middle
        jsr draw_swinging_vine_sprites
        rts

l84e9
rolling_log_move
        lda zp_objects
        cmp #$04                            ; rolling logs in room?
        bcc _room_has_rolling_logs          ; yes ->
        rts                                 ; don't move stationary logs
_room_has_rolling_logs
        and #$03                            ; preliminary # of rolling logs
        cmp #$02                            ; 2 or 3?
        bcs _no_extra_log                   ; yes ->
        clc                                 ; if 0 or 1:
        adc #$01                            ; add one to # of rolling logs
_no_extra_log
        tax                                 ; x = final # of rolling logs
        ldy #zp_log_0_x_pos                 ; index: rolling log 0 x position
_loop_move_rolling_log
        lda @w $0000,y                      ; current x position
        sec
        sbc #$04                            ; x position -= 4
        sta @w $0000,y                      ; write back x position
        bcs _no_underflow                   ; no underflow ->
        lda @w $0001,y                      ; handle underflow:
        sec                                 ; dec. high bit
        sbc #$01
        bpl _skip_reset_rolling_log         ; no underflow ->
_wait_vertical_blanking
        lda VicScreenCtrlReg1               ; wait for MSB raster line = 1
        bpl _wait_vertical_blanking
        lda #$5e                            ; reset rolling log x position to $015e
        sta @w $0000,y                      ; log (y) x pos (lb)
        lda #$01
_skip_reset_rolling_log
        sta @w $0001,y                      ; log (y) x pos (hb)
_no_underflow
        iny                                 ; inc index to next x position pair
        iny
        dex                                 ; dec rolling log counter
        bne _loop_move_rolling_log

        ldx #$02
_loop_toggle_sprite_phase
        lda sprite_3_pointer,x
        eor #$01                            ; toggle rolling log sprite id
        sta sprite_3_pointer,x
        dex
        bpl _loop_toggle_sprite_phase

        inc zp_log_bounce_counter           ; inc counter for bouncing rolling logs (0..4)
        lda zp_log_bounce_counter
        cmp #$02                            ; counter == 2?
        bne _check_log_bounce_down          ; no ->

        ; rolling log bounces up
        dec zp_log_0_y_pos                  ; rolling log 0 y position
        dec zp_log_1_y_pos                  ; rolling log 1 y position
        dec zp_log_2_y_pos                  ; rolling log 2 y position
        rts

_check_log_bounce_down
        cmp #$04                            ; counter == 4 (maximum)?
        bne _exit

        ; rolling log bounces down
        inc zp_log_0_y_pos                  ; rolling log 0 y position
        inc zp_log_1_y_pos                  ; rolling log 1 y position
        inc zp_log_2_y_pos                  ; rolling log 2 y position
        lda #$00                            ; reset log bounce counter
        sta zp_log_bounce_counter           ; counter for bouncing rolling logs (0..4)
_exit
        rts


check_hazards
        lda zp_player_y_pos
        ldy zp_scene_type
        cmp #Y_POS_JUNGLE_GROUND
        beq check_hazards_holes
        cmp #$9a
        beq check_hazards_holes
check_hazards_holes_safe_1
        jmp check_hazards_not_surface       ; check hazards on other levels than surface

check_hazards_holes
        cpy #$02                            ; scene: no holes in the ground?
        bcs check_hazards_pits              ; no holes ->

        lda zp_player_x_pos+1
        bne check_hazards_holes_safe_1

        lda zp_player_x_pos
        cmp #$a6                            ; x pos: center hole, left edge
        beq _fall_in_hole_left_edge
        bcc _check_hole_left
        cmp #$b2                            ; x pos: center hole, right edge
        beq _fall_in_hole_right_edge
        bcc _fall_in_hole_center

_check_hole_left
        cpy #$01                            ; scene: three holes in the ground?
        bne _check_hazards_holes_save_2     ; no ->
        cmp #$66                            ; x pos: left hole, left edge
        beq _fall_in_hole_left_edge
        bcc _check_hole_right               ; < left hole ->
        cmp #$7a                            ; x pos: left hole, right edge
        beq _fall_in_hole_right_edge
        bcc _fall_in_hole_center

_check_hole_right
        cmp #$de                            ; x pos: right hole, left edge
        beq _fall_in_hole_left_edge
        bcc _check_hazards_holes_save_2
        cmp #$f4
        beq _fall_in_hole_right_edge
        bcc _fall_in_hole_center

_check_hazards_holes_save_2
        jmp check_hazards_not_surface

_fall_in_hole_left_edge
        clc
        adc #$04                            ; adjust player x pos to the right
        bne _adjust_player_x_pos

_fall_in_hole_right_edge
        sec
        sbc #$04                            ; adjust player x pos to the left

_adjust_player_x_pos
        sta zp_player_x_pos

_fall_in_hole_center
        lda #$39
        sta zp_player_fall_counter          ; 0: player not falling, >0: player falling, counting down from $39
        lda #$24
        sta zp_sound_falling_counter        ; count down to zero when falling (sound: pitch)
        lda #Y_POS_JUNGLE_GROUND
        sta zp_player_y_pos
        lda #$00                            ; Harry not stunned
        sta zp_player_stunned               ; >0: Harry is stunned by a rolling log
        lda zp_score_100                    ; score -= 100 (for falling into trap)
        sed
        sec
        sbc #$01
        sta zp_score_100
        bcs _decrease_score_done            ; no underflow ->
        lda zp_score_10000                  ; handle underflow: score 10000 == 0?
        bne _decrement_score_10000          ; no ->
        sta zp_score_10000                  ; set all three score bytes to 0
        sta zp_score_100
        sta zp_score_1
        beq _decrease_score_done
_decrement_score_10000
        sbc #$00                            ; score -= 10000
        sta zp_score_10000
_decrease_score_done
        cld
decrease_score_rts
        rts

check_hazards_pits
        cmp #Y_POS_PLAYER_STUNNED
        beq _check_open_pit
        cmp #Y_POS_JUNGLE_GROUND
        beq _check_open_pit
        bcs check_hazards_not_surface

        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        cmp #$02
        bcs check_hazards_not_surface
_check_open_pit
        lda zp_player_x_pos
        ldx zp_quicksand_state              ; 0: closed, 2-5 partially open, 6: open
        beq check_hazards_not_surface
        dex                                 ; make open state zero based
        cmp quicksand_left_x_pos,x
        bcc check_hazards_not_surface
        cmp quicksand_right_x_pos,x
        bcs check_hazards_not_surface

        ; check whether Harry is standing on a crocodile

        cpy #$04                            ; scene: crocodiles in the water
        bne player_falls_into_pit           ; no crocodiles ->

        lda zp_collision_surface            ; sprite-to-sprite collisions on surface level
        and #$c6                            ; collision with swinging vine?
        sta zp_collision_surface            ; sprite-to-sprite collisions on surface level

        lda zp_player_x_pos
        ldx #$04                            ; iterator over crocodile coordinates
_loop_check_croc_pos
        cmp crocs_full_x_pos+0,x            ; Harry < left side of jaws?
        bcc _loop_check_croc_pos_cont       ; yes -> no death
        cmp crocs_full_x_pos+1,x            ; left side <= Harry <= right side of jaws?
        bcc _check_crock_jaws_open          ; yes -> check for open crocodile jaws
        beq _check_crock_jaws_open
_loop_check_croc_pos_cont
        dex
        dex
        bpl _loop_check_croc_pos
        bmi player_falls_into_pit

_check_crock_jaws_open
        lda sprite_3_pointer
        cmp #$39                            ; sprite id: crocodile jaws closed
        beq decrease_score_rts              ; jaws closed -> Harry is safe for now ...
        lda zp_player_x_pos
        ldx #$04
_loop_check_croc_head
        cmp crocs_head_x_pos+0,x            ; player x < crocodile head, left side?
        bcc _loop_check_croc_head_cont      ; yes -> player left of crocodile head, check next
        cmp crocs_head_x_pos+1,x            ; player x <= crocodile head, right side?
        bcc decrease_score_rts              ; yes -> player is safe on crocodile's head
        beq decrease_score_rts
_loop_check_croc_head_cont
        dex
        dex
        bpl _loop_check_croc_head

player_falls_into_pit                   ; Harry falls into water or tar trap or eaten by crocodile
l8624
        lda #$18
        jmp harry_dies

crocs_head_x_pos
        .byte $8a,$91                       ; x coordinates crocodile head (left)
        .byte $b2,$b6                       ; x coordinates crocodile head (middle)
        .byte $d6,$da                       ; x coordinates crocodile head (right)

crocs_full_x_pos
        .byte $7a,$91                       ; x coordinates crocodile (left)
        .byte $a2,$b6                       ; x coordinates crocodile (middle)
        .byte $c6,$da                       ; x coordinates crocodile (right)

check_hazards_not_surface
        lda zp_collision_scorpion           ; 0: no collision, 1: collision with scorpion
        beq _check_hazards_sprites          ; no collision with scorpion ->
        lda #$00                            ; clear collision
        sta zp_collision_scorpion           ; 0: no collision, 1: collision with scorpion
        jmp harry_dies

_check_hazards_sprites
        cpy #$04                            ; scene: crocodiles in the scene?
        beq check_hazards_exit              ; yes -> no other objects in scene
        lda zp_collision_surface            ; sprite-to-sprite collisions on surface level
        pha
        and #$c6                            ; collision with swinging vine?
        sta zp_collision_surface            ; save sprite-to-sprite collisions on surface level
        pla
        and #$38                            ; collision with rolling log?
        beq check_hazards_not_stunned       ; no -> release player from stunned state

        cpy #$05                            ; scene contains treasure?
        bne _check_hazards_fire_snake       ; no ->
        jmp check_collect_treasure          ; if treasure not collected yet, collect!

_check_hazards_fire_snake
        lda zp_objects
        cmp #$06                            ; 6: fire, 7: snake
        bcc _check_hazards_handle_log
        lda #$00                            ; Harry hit fire or snake:
        jmp harry_dies                      ; -> instant death!

_check_hazards_handle_log
        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        ora zp_player_fall_counter          ; 0: player not falling, >0: player falling, counting down from $39
        bne _exit
        lda zp_at_ladder                    ; harry is climbing the ladder
        bne push_player_down_ladder         ; log pushes Harry down the ladder

        ldx #$01                            ; set Harry as stunned
        stx zp_player_stunned               ; >0: Harry is stunned by a rolling log
        ldy #$00
        lda (zp_tune_ptr),y                 ; read current tune data byte
        cmp #END_OF_TUNE                    ; is tune currently playing?
        bne _exit                           ; yes -> skip
        lda #TUNE_RUN_OVER_BY_LOG           ; play tune: run over by log
        jsr play_tune
_exit
l867d
        rts

push_player_down_ladder
        lda zp_player_y_pos
        cmp #$ae
        bcs check_hazards_exit
        lda #$b1                            ; new position a bit down the ladder
        sta zp_player_y_pos
        lda #$03
        sta zp_sound_short_counter          ; count down to zero for short sound
        lda #$0a
        sta zp_sound_short_pitch            ; pitch for short sound
        jsr decrement_score
check_hazards_exit
        rts

check_hazards_not_stunned
        lda zp_player_stunned               ; >0: Harry is stunned by a rolling log
        beq check_wall                      ; not stunned ->
        lda #Y_POS_JUNGLE_GROUND            ; release player from stunned state:
        sta zp_player_y_pos                 ; set normal y position for jungle ground
        lda #$00                            ; value: not stunned
        sta zp_player_stunned               ; release Harry from stunned state

check_wall
        lda zp_player_y_pos
        cmp #Y_POS_WALL_BOUNCE_THRESHOLD    ; ($c0) on ladder above jump height
        bcs _check_room_for_wall
_check_wall_no_bounce
        jmp check_wall_exit_not_blocked
_check_room_for_wall
        lda zp_scene_type
        cmp #$02                            ; does room have a wall?
        bcs _check_wall_no_bounce           ; no ->

        ; handle the wall
        lda zp_bounce_off_wall              ; 0: normal jump, >0: Harry just bounced off the wall
        bne _check_wall_no_bounce           ; just bounced off the wall -> skip check for wall

        lda zp_room                         ; is the wall to the left?
        bpl _handle_left_wall               ; yes ->
_handle_right_wall                      ; wall on the right side of the room
        lda zp_player_x_pos+1               ; is player on the right part of the screen?
        beq _forward_to_exit_not_blocked    ; no (x pos < 256) -> far from right wall
        lda zp_player_x_pos
        ldx zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        bne _right_wall_facing_left         ; facing left ->
        cmp #$1e                            ; right wall (left edge)
        beq _player_touches_right_wall
        bcc _right_wall_check_for_jump
        cmp #$30                            ; right wall (right edge)
        bcs _right_wall_check_for_jump
        lda #$1e                            ; limit player x-pos to right wall (left edge)
        sta zp_player_x_pos                 ; set player x-pos to left edge of wall to the right
        bne _player_touches_right_wall
_right_wall_facing_left
        cmp #$3a                            ; check for right wall (right edge)
        bne _right_wall_check_for_jump
_player_touches_right_wall
        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        bne _right_wall_jump_next_to_wall
_handle_wall_block_player               ; wall blocks player from running
        txa                                 ; (player orientation)
        ora #$80                            ; wall blocks running
        sta zp_blocked_by_wall              ; 0: not blocked, >=$80 blocked by wall, bit 1: orientation
        lda zp_player_run_animation         ; Harry running animation phase (0-4)
        ror
        bcc _blocked_by_wall_exit
        jmp _play_sound_blocked_by_wall     ; every second time play a short sound
_blocked_by_wall_exit
        rts

_handle_left_wall                       ; wall on the left side of the room
_l86e7
        lda zp_player_x_pos+1               ; is player on the left part of the screen?
        bne check_wall_exit_not_blocked     ; no (x pos > 255) -> far from left wall
        lda zp_player_x_pos
        ldx zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        beq _left_wall_facing_right         ; facing right ->
        cmp #$3a                            ; left wall (right edge)
        beq _player_touches_left_wall
        bcs _left_wall_check_for_jump
        cmp #$28                            ; left wall (left edge)
        bcc _left_wall_check_for_jump
        lda #$3a                            ; limit player x-pos to left wall (right edge)
        sta zp_player_x_pos                 ; set player x-pos to left edge of wall to the right
        bne _player_touches_left_wall

_left_wall_facing_right
        cmp #$1e                            ; check for left wall (left edge)
        bne _left_wall_check_for_jump

_player_touches_left_wall
        lda zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        bne _left_wall_jump_next_to_wall
        beq _handle_wall_block_player

_right_wall_check_for_jump
;l870b
        ldx zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
_forward_to_exit_not_blocked            ; (when directly jumping to this label, beq is fulfilled!)
        beq check_wall_exit_not_blocked
        cmp #$1e                            ; < wall left edge?
        bcc check_wall_exit_not_blocked
        beq _right_wall_jump_next_to_wall
        cmp #$3b                            ; >= right edge?
        bcs check_wall_exit_not_blocked
_right_wall_jump_next_to_wall
        ldy zp_not_directional_jump         ; directional jump? (not just straight up)
        bne _jump_straight_up_at_wall       ; no ->

_l871d
_bounce_off_wall
        lda zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        tax
        eor #$01
        sta zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
_jump_straight_up_at_wall
        lda #$c5                            ; new y-position when bouncing off wall
        sta zp_player_y_pos
        lda #$14                            ; set jump index to middle of sequence
        sta zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        lda bounce_position,x               ; x position directly after bounce
        sta zp_player_x_pos                 ; set x position right next to the wall
        sta zp_bounce_off_wall              ; 0: normal jump, >0: Harry just bounced off the wall
        lda zp_not_directional_jump         ; directional jump? (not just straight up)
        bne _blocked_by_wall_no_sound_exit  ; no (straight up) ->

_play_sound_blocked_by_wall
        lda #$25
        sta zp_sound_short_pitch            ; pitch for short sound
        lda #$03
        sta zp_sound_short_counter          ; count down to zero for short sound
_blocked_by_wall_no_sound_exit
        rts

_left_wall_check_for_jump
_l8740
        ldx zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        beq check_wall_exit_not_blocked
        cmp #$1e                            ; < wall left edge?
        bcc check_wall_exit_not_blocked     ; yes ->
        beq _left_wall_jump_next_to_wall
        cmp #$3b                            ; >= right edge?
        bcs check_wall_exit_not_blocked     ; yes ->
_left_wall_jump_next_to_wall
        ldy zp_not_directional_jump         ; directional jump? (not just straight up)
        bne _jump_straight_up_at_wall       ; no ->
        beq _bounce_off_wall

check_wall_exit_not_blocked
        lda #$00
        sta zp_blocked_by_wall              ; 0: not blocked, >=$80 blocked by wall, bit 1: orientation
        rts

l8759
bounce_position
        .byte $1e,$3a                       ; x position directly after bounce (0: right wall $011e, 1: left wall $003a)

l875b
check_collect_treasure
        jsr check_treasure_collected
        bne _return                         ; treasure already collected? ->
        sta zp_treasure_collected_flags,x   ; each bit: 1 = treasure not collected (4)
        lda zp_objects                      ; low two bits describe treasure
        and #$03
        asl                                 ; value = treasure code * 4000 + 2000
        asl
        asl
        asl
        adc #$20                            ; minimum treasure: $2000
        sed                                 ; decimal mode ON
        adc zp_score_100                    ; add treasure to score
        sta zp_score_100
        lda #$00
        sta $1c
        adc zp_score_10000
        sta zp_score_10000
        cld                                 ; decimal mode OFF

        lda #TUNE_TREASURE                  ; play tune: treasure
        jsr play_tune

        dec zp_treasure_uncollected         ; >=0: uncollected treasure objects
        bpl _return                         ; more treasure to be collected ->
        ldy #$00

_wait_for_end_of_tune
        lda (zp_tune_ptr),y                 ; wait until treasure collected tune finishes
        cmp #END_OF_TUNE
        bne _wait_for_end_of_tune

        jsr display_scroll_text             ; scroll copyright text until player presses F1

        jmp warm_start

_return
        rts


harry_dies
l8792
        pha
        lda #$00
        sta zp_collision_surface            ; sprite-to-sprite collisions on surface level
        sta zp_collision_scorpion           ; 0: no collision, 1: collision with scorpion
        sta zp_sound_jumping_counter        ; count down to zero when jumping (sound: pitch)
        sta SidVoice1CtrlReg                ; select triangle, GATE = 0 (start release phase)
        lda #TUNE_DEATH                     ; play tune: death
        jsr play_tune
        pla
        beq _wait_death_tune_finished
        jsr set_player_sprite_standing
        lda #Y_POS_JUNGLE_GROUND
        sta zp_player_y_pos
        ldx #$18                            ; repeat 24 times
_loop_player_drowns
        jsr animate_drown_one_line          ; Harry drowns one line at a time
        dex
        bne _loop_player_drowns

        stx zp_player_y_pos                 ; player_x_pos = 0 (sprite invisible)
        jsr setup_sprite_data
        jsr print_score_and_timer
_wait_death_tune_finished
        ldy #$00
        lda (zp_tune_ptr),y                 ; current tune data byte
        cmp #END_OF_TUNE                    ; end of tune reached?
        bne _wait_death_tune_finished       ; no -> continue waiting

        dec zp_lives                        ; # of lives left, including current
        bne start_next_life                 ; at least one life left -> start next life
        jsr display_scroll_text             ; scroll copyright text until player presses F1
        jmp warm_start

start_next_life
l87cf
        jsr print_score_and_timer
        jsr update_lives_indicator
        ldy #Y_POS_NEW_LIFE_UNDERGROUND
        ldx #$0b
        lda zp_player_y_pos
        cmp #$97                            ; is player underground? (i.e. death by scorpion)?
        bcs _start_next_life_underground    ; yes ->

        ldy #Y_POS_LIFE_INDICATOR           ; start new life above ground
        ldx #$1c
_start_next_life_underground
        lda #SPRITE_ID_PLAYER_JUMPING
        sta sprite_0_pointer
        lda #$1e
        sta zp_player_x_pos
        lda #$00
        sta zp_player_x_pos+1
        sta zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        sta zp_jump_index                   ; 0: not jumping, >0: jump index, counting up
        cpy #Y_POS_LIFE_INDICATOR           ; start new life above ground?
        beq loop_drop_harry_into_jungle     ; yes ->

        sta zp_scorpion_x_pos+1             ; reset scorpion to make player safe
        lda #X_POS_SCORPION_START           ; scorpion: start x-pos
        sta zp_scorpion_x_pos
        lda #$3b                            ; sprite id: scorpion right (phase 1)
        sta zp_scorpion_sprite_id

loop_drop_harry_into_jungle
        sty zp_player_y_pos                 ; update y position of falling Harry
        tya
        pha
        txa
        pha
        jsr swinging_vine_move
        pla
        tax
        pla
        tay
        iny                                 ; Harry falls three pixels per iteration
        iny
        iny
        cpx #$07                            ; last seven iterations reached?
        bne _skip_change_sprite             ; no
        lda #SPRITE_ID_PLAYER_LIFE          ; change sprite from "jumping" to "standing"
        sta sprite_0_pointer
_skip_change_sprite
        dex
        bne loop_drop_harry_into_jungle
        stx zp_collision_scorpion           ; 0: no collision, 1: collision with scorpion
        stx zp_collision_surface            ; sprite-to-sprite collisions on surface level
        rts


animate_drown_one_line
l8823
        lda #>vic_base+$2a*$40              ; data for sprite $2a: Harry standing facing right
;;    lda #>$4a80                         ; data for sprite $2a: Harry standing facing right
        sta zp_src+1
        lda #<vic_base+$2a*$40
;;    lda #<$4a80
        ldy zp_player_orientation           ; player orientation: 0: facing right, 1: facing left
        beq _load_sprite_ptr_lb             ; orientation right? ->
        clc
        adc #$40                            ; set address for sprite $2b: facing left
_load_sprite_ptr_lb
        sta zp_src+0
        ldy #$39                            ; start offset: $39 (next to last line in sprite)
_loop_move_one_line
        lda #$03                            ; iterator: move three bytes
        sta zp_iterator_0
        tya
        pha                                 ; store iterator
_loop_move_one_byte
        lda (zp_src),y                      ; read source byte
        iny
        iny                                 ; move index one sprite row down
        iny
        sta (zp_src),y                      ; store byte one sprite row down
        dey                                 ; back up 3 bytes, move on byte forwards
        dey
        dec zp_iterator_0                   ; dec iterator (3..2..1)
        bne _loop_move_one_byte

        pla                                 ; restore iterator
        sec
        sbc #$03                            ; move one row up in sprite
        tay                                 ; as index
        bpl _loop_move_one_line

        lda #$00                            ; blank byte
        tay
        sta (zp_src),y                      ; clear first line in sprite
        iny
        sta (zp_src),y
        iny
        sta (zp_src),y

        ldy #$00
        lda #$07
        sta zp_delay                        ; delay loop variable
_loop_delay
        dey
        bne _loop_delay
        dec zp_delay                        ; delay loop variable
        bne _loop_delay
        rts


sound_handler                           ; handle playback of sound effects
l8867
        lda zp_sound_short_counter          ; count down to zero for short sound
        bne _continue_sound

        lda zp_player_run_animation         ; Harry running animation phase (0-4)
        cmp #$01
        bne _skip_start_sound_running

        lda #$19                            ; start sound: running
        sta SidVoice1FreqHb
        lda #$81
        sta SidVoice1CtrlReg                ; select noise, GATE = 1 (start attack phase)
        rts

_skip_start_sound_running
        lda zp_sound_jumping_counter        ; count down to zero when jumping (sound: pitch)
        beq _skip_handle_sound_jumping      ; not jumping ->
        dec zp_sound_jumping_counter        ; count down to zero when jumping (sound: pitch)
        lda #$10
        sec
        sbc zp_sound_jumping_counter        ; count down to zero when jumping (sound: pitch)
        sta zp_sound_pitch_abs_value        ; sound pitch (absolute value)
        lda zp_sound_descending             ; 0: sound sequence ascending, >=1: descending
        beq _start_ascending_sound_part     ; ascending? ->
        lda #$23                            ; highest SID freq value (hb) for descending sequence
        sec                                 ; descending sequence, subtract delta
        sbc zp_sound_pitch_abs_value        ; sound pitch (absolute value)
        bne _start_sound_part
_start_ascending_sound_part
        lda zp_sound_pitch_abs_value        ; sound pitch (absolute value)
        clc
        adc #$13                            ; convert to SID frequency value (hb)
_start_sound_part
        sta SidVoice1FreqHb
        lda #$41
        sta SidVoice1CtrlReg                ; select pulse, GATE = 1 (start attack phase)
        rts

_skip_handle_sound_jumping
        lda zp_sound_falling_counter        ; count down to zero when falling (sound: pitch)
        beq _skip_handle_sound_falling      ; not falling ->
        dec zp_sound_falling_counter        ; count down to zero when falling (sound: pitch)
        clc
        adc #$04                            ; SID freq value (hb) = $04 + zp_sound_falling_counter
        bne _start_sound_part

_skip_handle_sound_falling
_continue_sound
        lda zp_sound_short_counter          ; count down to zero for short sound
        beq _sound_start_release
        dec zp_sound_short_counter          ; count down to zero for short sound
        lda #$00
        sta zp_sound_jumping_counter        ; count down to zero when jumping (sound: pitch)
        lda zp_sound_short_pitch            ; pitch for short sound
        sta SidVoice1FreqHb
        cmp #$0a
        bne _start_sound_part
        lda #$21
        sta SidVoice1CtrlReg                ; select saw, GATE = 1 (start attack phase)
        rts

_sound_start_release
        lda #$00
        sta SidVoice1CtrlReg                ; select triangle, GATE = 0 (start release phase)
        rts


scroll_copyright_text
l88cc
        inc zp_text_scroll_delay            ; inc. text scroll delay
        lda zp_text_scroll_delay
        cmp #$40                            ; text scroll delay = max value?
        bne _exit                           ; no ->
        lda #$00
        sta zp_text_scroll_delay            ; reset text scroll delay

        ; soft scroll copyright text
_wait_vertical_blanking
        lda VicScreenCtrlReg1               ; wait for MSB raster line = 1
        bpl _wait_vertical_blanking

        lda zp_raster_scroll_x              ; horizontal raster scroll
        beq scroll_text_next_char           ; if 0 -> reload with 7
        dec zp_raster_scroll_x              ; else, decrement it
_exit
        rts

scroll_text_next_char
l88e4
        ldx #$07                            ; max soft scroll value (x)
        stx zp_raster_scroll_x
        ldx #$00                            ; index for text scroll loop
_loop_scroll_text
        lda screen_scroll_text+1,x          ; scroll one charater one cell to the left
        sta screen_scroll_text+0,x          ; scroll one charater one cell to the left
        lda ColorRAM+$03c1,x                ; scroll color RAM one cell to the left
        sta ColorRAM+$03c0,x
        inx                                 ; inc index
        cpx #TEXT_WIDTH                     ; index < # characters in line (40)?
        bne _loop_scroll_text

        ldx zp_text_scroll_index            ; index to current text scroll character
        inc zp_text_scroll_index            ; proceed to next character
        lda scroll_text_data,x              ; read character from text data
        cmp #$ff                            ; end of data reached?
        bne _print_next_scroll_char         ; no ->
        lda #$00                            ; reset index to text scroll character
        sta zp_text_scroll_index
        rts

_print_next_scroll_char
        sta screenRAM+$03e7                 ; store new character at end of scroll line
        ldx #COLOR_WHITE
        cmp #$3c                            ; Activision rainbow colors character?
        beq _set_rainbow_colors_cram        ; yes ->
        cmp #$3d                            ; rainbow color character / "A"?
        bne _set_color_ram                  ; no ->
_set_rainbow_colors_cram
        ldx #COLOR_BROWN
_set_color_ram
        stx ColorRAM+$03e7
        rts

scroll_text_data
l891e
        ; encoding for scroll text
.enc "scrolltext"
.cdef $00,$00,$ff
.cdef $01,$1f,$01
.cdef $20,$20,$00                       ; space
.cdef $21,$60,$a1                       ; symbols and upper case letters
.cdef $61,$7f,$81                       ; lower case letters
;;.cdef $21,$7f,$a1

        .text "Pitfall!"
        .byte $48,$49                       ; "TM"
        .text " by David Crane               "
        .text "Copyright 1982,1984  "
activision_logo_data
        .byte $3c,$3c,$3c,$3d,$3e,$3f,$40,$41,$42,$43,$44,$45,$46,$47
        .text "               "
        .text "Press F1 to Start"
        .text "               "
        .byte $ff


display_activision_logo
        lda #$00
        sta zp_raster_scroll_x              ; horizontal raster scroll
        tax
        tay                                 ; iterator (40 columns)
_loop_print_logo
        lda activision_logo_data,x
        cpx #$0e                            ; end of Activision logo reached?
        beq _print_blank_char               ; yes ->
        inx
        bne _print_char
_print_blank_char
        lda #$00                            ; blank character
_print_char
        sta screen_scroll_text,y            ; scroll one character one cell to the left
        cmp #$3c                            ; rainbow strip character
        beq _set_rainbow_color
        cmp #$3d                            ; another rainbow strip character (the A in Activision)
        bne _set_font_color
_set_rainbow_color
        lda #COLOR_BROWN
        bne _set_color
_set_font_color
        lda #COLOR_WHITE
_set_color
        sta ColorRAM+$03c1,y
        iny
        cpy #$28                            ; full line printed?
        bne _loop_print_logo                ; no -> continue loop
        rts


play_tune
l89c5
        asl                                 ; tune id as address offset
        tax

_wait_raster_40
        lda VicScreenCtrlReg1               ; wait for MSB raster line = 0
        bmi _wait_raster_40                 ; MSB raster = 1? ->
        lda VicRasterValue
        cmp #$40                            ; raster line = $040?
        bne _wait_raster_40                 ; no ->

        lda tune_start_table+0,x            ; tune start address (lb)
        sta zp_tune_ptr+0                   ; tune data pointer (lb)
        lda tune_start_table+1,x            ; tune start address (hb)
        sta zp_tune_ptr+1                   ; tune data pointer (hb)
        lda #$01                            ; fetch first note on next interrupt
        sta zp_note_timer                   ; remaining note length
        lda #$08                            ; GATE = 0 (start release phase)
        sta SidVoice2CtrlReg
        sta SidVoice3CtrlReg
        rts

read_keyboard
l89ea
        ; read the keyboard with the intent to check for a specific key.
        ; The expected key is encoded into
        ;   Y (keyboard matrix output) and
        ;   A (mask for keyboard matrix input)
        ; Return value:
        ;   C (0: no match, 1: expected key was pressed)

        sta zp_keyboard_read                ; mask for expected keyboard output value
        lda #$ff                            ; port data direction: write mode
        sta Cia1PortADataDir                ; Port A: allow writing
        ldx #$00                            ; port data direction: read mode
        stx Cia1PortBDataDir                ; Port B: read only

        sty Cia1PortA                       ; keyboard matrix output value
        ldx Cia1PortB                       ; read keyboard matrix input
        sta Cia1PortA                       ; ($ff) unselect keyboard matrix (for joystick reading)
        lda Cia1PortB                       ; read keyboard matrix input (input unselected)

        and zp_keyboard_read                ; select expected output bit
        beq _return_false                   ; bit is clear, but should be set -> incorrect read (e.g. due to joystick)
        txa                                 ; data read from keyboard input (with selected output line)
        and zp_keyboard_read                ; select expected output bit
        bne _return_false                   ; bit is set, but should be clear -> key was not pressed

        lda #$1b                            ; text mode, screen on, 25 rows, vert scroll: 3
        sta VicScreenCtrlReg1               ; set control register #1 ($d011)
        sec                                 ; return value: true
        bcs _return
_return_false
        clc                                 ; return value: true
_return
        lda #$00                            ; port data direction: read mode
        sta Cia1PortADataDir                ; Port A: read only
        rts


handle_pause_game                       ; handle RUN/STOP and pause the game accordingly
l8a1a
        jsr read_run_stop_key               ; read keyboard, check for RUN/STOP (C = 1: RUN/STOP pressed)
        bcs _pause_game                     ; RUN/STOP pressed -> pause game
        rts
_pause_game
        inc zp_game_paused                  ; 0: game is not paused, 1: game is paused
        lda #$00
        sta SidVoice1CtrlReg                ; select triangle, GATE = 0 (start release phase)
        ldx #$08                            ; initial value for debounce counter
        stx zp_debounce_counter             ; debounce counter for keyboard

_wait_release_run_stop
        jsr read_run_stop_key               ; read keyboard, check for RUN/STOP (C = 1: RUN/STOP pressed)
        bcs _wait_release_run_stop
        dec zp_debounce_counter             ; debounce counter for keyboard
        bne _wait_release_run_stop          ; debounce

_wait_press_run_stop
        jsr read_run_stop_key               ; read keyboard, check for RUN/STOP (C = 1: RUN/STOP pressed)
        bcc _wait_press_run_stop

        ldx #$08                            ; initial value for debounce counter
        stx zp_debounce_counter             ; debounce counter for keyboard
_debounce_run_stop
        jsr read_run_stop_key               ; read keyboard, check for RUN/STOP (C = 1: RUN/STOP pressed)
        bcs _debounce_run_stop
        dec zp_debounce_counter             ; debounce counter for keyboard
        bne _debounce_run_stop

        dec zp_game_paused                  ; 0: game is not paused, 1: game is paused
        rts


l8a49
read_run_stop_key                       ; read keyboard, check for RUN/STOP (C = 1: RUN/STOP pressed)
        ; check for RUN/STOP key
        lda #$80                            ; expected Port B input value (keyboard col)
        ldy #$7f                            ; output value Port A (keyboard row)
        jsr read_keyboard
        rts


read_joystick
        lda Cia1PortB                       ; read joystick 1 from CIA 1 Port B
        and #$1f                            ; mask out joystick direction and fire bits
        rts


l8a57
display_scroll_text                     ; scroll copyright text until player presses F1
        lda #$00
        sta zp_text_scroll_delay
        sta zp_text_scroll_index

_wait_for_f1                            ; wait for F1 key
        jsr scroll_copyright_text           ; await vertical blanking intervall, scroll text
        lda #$10                            ; expected Port B input value (keyboard col)
        ldy #$fe                            ; output value Port A (keyboard row)
        jsr read_keyboard                   ; check for F1 key
        bcc _wait_for_f1                    ; key not pressed ->

        ; debounce the key, i.e. check two times in a row

        lda #$10                            ; parameters for F1 key
        ldy #$fe
        jsr read_keyboard                   ; check for F1 key
        bcc _wait_for_f1                    ; key not pressed ->
        rts

Pitfall_NMI
        inc zp_nmi_occurred                 ; 0: no NMI, >0: NMI has been triggered
        rti

setup_game                              ; initialize hardware and setup game data
        lda #$08                        ; set duty cycle to 50%
        sta SidVoice1PulseWidthHb
        sta SidVoice2PulseWidthHb
        sta SidVoice3PulseWidthHb
.comment
        sta VicMemCtrlReg               ; offsets character mem $2000, screen mem $0000
        lda Cia2PortADataDir            ; Bits 0,1: VIC bank
        ora #$03                        ; enable write for VIC bank selection bits
        sta Cia2PortADataDir
        lda Cia2PortA                   ; VIC bank configuration, serial bus
        and #$fc
        ora #$02                        ; select VIC bank #1: $4000-$7fff
        sta Cia2PortA                   ; set VIC bank to $4000-$7fff
        lda #$2f
        sta D6510                       ; Data direction: Processor Port
        lda #$33
        sta R6510                       ; Processor Port

        ldx #$00                        ; index for character ROM copy loop
_loop_copy_character_rom
        lda CharacterROM+$0000,x        ; copy Character ROM to VIC bank
        sta character_rom_copy+$0000,x
        lda CharacterROM+$0100,x
        sta character_rom_copy+$0100,x
        lda CharacterROM+$0200,x
        sta character_rom_copy+$0200,x
        lda CharacterROM+$0300,x
        sta character_rom_copy+$0300,x
        inx
        bne _loop_copy_character_rom

        lda #$37
        sta R6510                       ; Processor Port
        lda #<charset_data_rom          ; RLE encoded data for character set
        sta zp_src+0
        lda #>charset_data_rom
        sta zp_src+1
        lda #<character_set_ram         ; destination: character set (RAM within VIC bank)
        sta zp_dst+0
        lda #>character_set_ram
        sta zp_dst+1
        jsr decompress_rle_data         ; decompress/copy character set data to destination

        ldx #$08
        lda #$00                        ; COLOR_BLACK
        sta VicBorderColor
        tay                             ; iterator for loop below: y = 0
l8ada
_loop_patch_characters
        lda #$00
        sta $65cf,x                         ; clear character $ba: colon character ':' (blank character in score display)
        lda $60ef,x
        eor #$ff                            ; invert character $1e: checkered pattern (trees)
        sta $60ef,x
        dex
        bne _loop_patch_characters


        ; set jungle background colors      ; (x = 0, y = 0)
l8aea

        lda zp_ntsc_pal
        cmp #VIDEO_NTSC
        beq _loop_set_video_standard_vars
        iny
_loop_set_video_standard_vars
        lda video_standard_dep_vars_table,y ; set the following three variables:
        sta zp_vic_screen_ctrl_reg2,x       ; multi-color mode, zp_color_ram, zp_vic_background_color_0
        inx
        iny
        iny
        cpy #$06
        bcc _loop_set_video_standard_vars

        ldx #$00
l8aff
_loop_reset_screen_data
        lda zp_color_ram
        sta ColorRAM+$0000,x                ; set color RAM
        sta ColorRAM+$0100,x                ; (upper part of screen)
        sta ColorRAM+$0200,x
        lda #COLOR_WHITE + $08              ; display character as multi-color (%11 = white)
        sta ColorRAM+$022f,x                ; (lower part of screen)
        sta ColorRAM+$0300,x
.endcomment
        ; draw dense leaves in the first four rows

        ldy #0                          ; row 0
        sty zp_row
        lda #0
        sta zp_column
        lda #CHAR_DENSE_LEAVES          ; tile: dense leaves
        jsr draw_tile_row               ; draw jungle ground (upper) (yellow)
        jsr draw_tile_row
        jsr draw_tile_row               ; draw jungle ground (lower) (red)
        jsr draw_tile_row

.comment
        lda #$1e
        sta screenRAM,x                     ; clear screenRAM
        lda #$00
        sta $50c0,x                         ; sprite data: score
        sta $4c00,x                         ; sprite data: lives left
        sta screen_scroll_text,x            ; scroll text area in screen RAM
        dex
        bne _loop_reset_screen_data

        jsr setup_sprite_data

        lda #<quicksand_data_rom            ; source: $9e21
        sta zp_src+0
        lda #>quicksand_data_rom
        sta zp_src+1
        lda #<quicksand_screen_data         ; destination: $1000
        sta zp_dst+0
        lda #>quicksand_screen_data
        sta zp_dst+1
        jsr decompress_rle_data

        lda #$18                            ; %00011000
        sta $5127                           ; sprite data time: colon
        sta $512a                           ; sprite data time: colon
        sta $5130                           ; sprite data time: colon
        sta $5133                           ; sprite data time: colon

        ldx #$3f
        ldy #$00
l8b4d
        lda $6020,x                         ; patch character set
        eor #$ff                            ; invert characters
        sta $6398,y
        iny
        dex
        bpl l8b4d

        ldx #$5f
l8b5b
        lda $6020,x                         ; patch character set
        eor #$ff                            ; invert characters
        sta $6020,x
        dex
        bpl l8b5b
.endcomment

        lda #$f5                            ; initialize various SID registers
        sta SidVoice1SustainRelease
        sta SidVoice2SustainRelease
        sta SidVoice3SustainRelease
        lda #$0f
        sta SidFilterModeVolume
        lda #<tune_silence
        sta zp_tune_ptr+0                   ; tune data pointer (lb)
        lda #>tune_silence
        sta zp_tune_ptr+1                   ; tune data pointer (hb)
.comment
        lda #$ff
        sta VicSpriteEnable                 ; initialize sprite display
        lda #COLOR_WHITE
        sta VicSprite0Color

        lda #<interrupt_raster_32           ; set up first raster interrupt
        sta CINV+0
        lda #>interrupt_raster_32
        sta CINV+1
.endcomment
        rts


setup_sprite_data
l8b93
        lda #<sprite_data_rom_player
        sta zp_src+0
        lda #>sprite_data_rom_player
        sta zp_src+1
        lda #<sprite_data_ram
        sta zp_dst+0
        lda #>sprite_data_ram
        sta zp_dst+1
l8ba3
_loop_setup_harry
        ldy #$3e                            ; loop index: (# bytes in sprite - 1)

        ldx #$00
_loop_copy_and_mirror_sprite
        lda (zp_src),y                      ; read byte from sprite source data
        sta (zp_dst),y                      ; store in sprite RAM (original orientation)
        stx zp_temp_x                       ; store x register
        ldx #$04                            ; loop index: 4 pixel pairs
_loop_flip_mc_byte
        rol
        php
        rol
        ror zp_mirrored_byte                ; rotate bit into mirrored byte
        plp
        ror zp_mirrored_byte                ; rotate bit into mirrored byte
        dex                                 ; dec # of pixel pairs
        bne _loop_flip_mc_byte              ; repeat for four pixel pairs

        ldx zp_temp_x                       ; restore x register
        tya
        clc
        adc zp_temp_x
        adc #$40-2
        sty zp_temp_y                       ; store y register
        tay
        lda zp_mirrored_byte
        sta (zp_dst),y                      ; store in mirrored sprite data
        ldy zp_temp_y                       ; restore y register
        inx
        inx
        cpx #$06
        bne _skip_reset_sprite_line
        ldx #$00                            ; reset byte offset within sprite line
_skip_reset_sprite_line
        dey
        bpl _loop_copy_and_mirror_sprite

        lda zp_dst+0
        clc
        adc #$80                            ; proceed to next destination sprite pair (right/left)
        sta zp_dst+0
        bcc _inc_dst_done
        inc zp_dst+1
_inc_dst_done

        lda zp_src+0
        clc
        adc #$40                            ; proceed to next source sprite
        sta zp_src+0
        bcc _inc_src_done
        inc zp_src+1
_inc_src_done

        cmp #<sprite_data_rom_others        ; source end address $9825 reached?
        bne _loop_setup_harry
        lda zp_src+1
        cmp #>sprite_data_rom_others
        bne _loop_setup_harry

        lda #<sprite_data_rom_others
        sta zp_src+0
        lda #>sprite_data_rom_others
        sta zp_src+1
        lda #$80                            ; sprite data RAM: rolling log
        sta zp_dst+0
        lda #$4c
        sta zp_dst+1
        jsr decompress_rle_data
        rts


init_game
l8c0a
        inc zp_random                   ; modify the random number
        lda #$1f                        ; start with 32 uncollected treasures
        sta zp_treasure_uncollected     ; >=0: uncollected treasure objects
        lda #$03                        ; start with 3 lives
        sta zp_lives                    ; # of lives left, including current
        lda #$c4                        ; start room: $c4 (seed)
        sta zp_room
        lda #$20
        sta zp_score_100
        sta zp_minutes
.comment
        lda #SPRITE_ID_PLAYER_STANDING_0    ; sprite id: Harry standing right
        sta sprite_0_pointer
.endcomment
        lda #$00
        sta zp_player_x_pos+1
        lda #$1e
        sta zp_player_x_pos
        lda #Y_POS_JUNGLE_GROUND
        sta zp_player_y_pos
        jsr print_score_and_timer       ; TODO: FOENIX DEBUG REMOVE
        jsr update_lives_indicator      ; TODO: FOENIX DEBUG REMOVE
        jsr init_scene

        jsr print_score_and_timer
        jsr update_lives_indicator
        lda #$00
        sta zp_player_run_animation         ; Harry running animation phase (0-4)
        inc zp_vine_x_delta_absolute        ; delta x position relative to middle
        sta zp_vine_swing_side              ; 0: vine swings on right side, 1: left side
        jsr draw_swinging_vine_sprites
        lda #$1b                            ; text mode, screen on, 25 rows, vert scroll: 3
        sta VicScreenCtrlReg1               ; set control register #1 ($d011)

_wait_vertical_blanking
        ldx VicScreenCtrlReg1               ; wait for MSB raster line = 1
        bpl _wait_vertical_blanking
_wait_visible_screen
        ldx VicScreenCtrlReg1               ; wait for MSB raster line = 0
        bmi _wait_visible_screen

        lda #$20                            ; generate interrupt at raster line $20
        sta VicRasterValue                  ; raster line to generate interrupt at (bits 0-7)
        lda #$81                            ; Raster interrupt enabled
        sta VicIrqCtrlReg                   ; enable raster interrupts
        cli
        rts


l8c5e
print_score_and_timer
        ldx #$00
        stx zp_score_print_zero             ; 0: pad zero with blank, 1: print actual zero
        stx zp_score_var_index              ; index into score variable
        stx zp_score_index                  ; index for score/time digits
_loop_print_score_and_time
        ldx zp_score_var_index              ; index into score variable
        lda zp_score_index                  ; index for score/time digits
        ror                                 ; divide by 2 (two digits per zp variable)
        lda zp_score,x                      ; score hi, mid, lo, minutes, seconds
        bcc _get_hi_nibble                  ; switch high/low nibble
        and #$0f                            ; isolate BCD digit from low nibble
        bcs _handle_digit
_get_hi_nibble
        lsr                                 ; isolate BCD digit from high nibble
        lsr
        lsr
        lsr
_handle_digit
        bne _print_digit_not_padding        ; if digit > 0, print it
        ldx zp_score_print_zero             ; 0: pad zero with blank, 1: print actual zero
        bne _print_digit
        ldx zp_score_var_index              ; index into score variable
        cpx #$02                            ; < zp_score_1?
        bcc _print_blank_char               ; yes -> first four digits of the score may be padded with blanks
        cpx #$04                            ; == zp_seconds?
        beq _print_digit                    ; yes -> always print the seconds
        tax                                 ; temporarily buffer the digit
        lda zp_score_index                  ; index for score_1 or minute digits
        ror                                 ; carry: if least significant digit in byte
        txa                                 ; restore digit from temp buffer
        bcs _print_digit                    ; least significant digit in score or minutes -> print it
                                            ; else, pad the digit with a blank:
_print_blank_char
        lda #$0a                            ; code for empty field (9+1)
        bne _print_digit

_print_digit_not_padding
        inc zp_score_print_zero             ; 0: pad zero with blank, 1: print actual zero
_print_digit
        ldx zp_score_index
        jsr updateNumberSpriteF256

        inc zp_score_index                  ; index for score/time digits
        lda zp_score_index                  ; index for score/time digits
        ror
        bcs _loop_print_score_and_time
        inc zp_score_var_index              ; index into score variable
        lda zp_score_var_index              ; index into score variable
        cmp #$03                            ; first digit of minutes?
        bne _skip_reset_padding             ; no ->
        lda #$00                            ; request zero-padding with blanks
        sta zp_score_print_zero             ; 0: pad zero with blank, 1: print actual zero
_skip_reset_padding
        cmp #$05                            ; finished printing score and timer?
        bne _loop_print_score_and_time      ; no ->
        rts


update_lives_indicator
        lda #2                              ; iterator: # lives positions
        sta zp_iterator_1
        lda #$00
        sta zp_sprite_data_index            ; index into sprite data
        ldx zp_lives                        ; # of lives left, including current
loop_fill_lives_indicator
        dex                                 ; dec # of lives
        lda #$01                            ; default: show life in indicator
        cpx #$01                            ; one or more extra lives left? (total: 2)
        bpl _indicate_lives_1               ; yes -> draw left bonus life indicator
        lda #$00                            ; else: clear left sprite area
_indicate_lives_1
        phx
        ldx zp_sprite_data_index            ; index into sprite data
        jsr updateLifeIndicatorSpriteF256
        plx
        inc zp_sprite_data_index            ; inc. index to right column of sprite data

        dec zp_iterator_1                   ; dec iterator
        bne loop_fill_lives_indicator
        rts


calculate_next_room
l8d07
        lda zp_player_orientation       ; player orientation: 0: facing right, 1: facing left
        bne loop_move_room_left
loop_move_room_right                    ; room = room << 1 | (bit3 ^ bit4 ^ bit5 ^ bit7)
        lda zp_room                     ; bit3
        asl
        eor zp_room                     ; eor bit4
        asl
        eor zp_room                     ; eor bit5
        asl
        asl
        eor zp_room                     ; eor bit7
        asl                             ; into carry
        rol zp_room                     ; rotate carry into room
        dex                             ; if underground, repeat four times
        bne loop_move_room_right
        beq init_scene

l8d1f
loop_move_room_left                     ; room = room >> 1 | bit0 ^ bit4 ^ bit5 ^ bit6
        lda zp_room                     ; bit4
        asl
        eor zp_room                     ; eor bit5
        asl
        eor zp_room                     ; eor bit6
        asl
        asl
        rol
        eor zp_room                     ; eor bit0
        lsr                             ; into carry
        ror zp_room                     ; rotate carry into room
        dex
        bne loop_move_room_left

l8d32
init_scene
        lda zp_room                         ; current room
        lsr
        lsr                                 ; extract bits 3-5 (scene type)
        lsr
        and #$07
        sta zp_scene_type                   ; set scene type variable

        cmp #$07                            ; does room have shifting quicksand?
        bne _check_for_vine                 ; no ->
        lda #$00                            ; yes: room does not have a vine
_check_for_vine
        and #$02                            ; room has a vine if scene type bit 1 is set
        sta zp_room_has_vine                ; set vine flag

        lda zp_room                         ; current room
        and #$07                            ; extract bits 0-2 (objects)
        sta zp_objects                      ; set objects variable

        lda #$00
        sta SidVoice1CtrlReg                ; select triangle, GATE = 0 (start release phase)
        sta zp_sound_jumping_counter        ; count down to zero when jumping (sound: pitch)
        jsr draw_jungle_background          ; draw the jungle background

        ; draw jungle ground
        ; - two yellow rows
        ; - two light red rows

        ldy #14                         ; row 14
        sty zp_row
        lda #0
        sta zp_column
        lda #CHAR_SURFACE_FLOOR         ; tile: jungle surface floor
        jsr draw_tile_row               ; draw jungle ground (upper) (yellow)
        jsr draw_tile_row
        lda #CHAR_SURFACE_EARTH         ; tile: jungle surface earth
        jsr draw_tile_row               ; draw jungle ground (lower) (red)
        jsr draw_tile_row

        ; draw underground cavern (black background color area)

        ldx #6                          ; # of lines to draw: 6
        lda #CHAR_BLACK                 ; tile: underground passage background (black)
_draw_passage_loop
                                        ; rows 18-23
        jsr draw_tile_row               ; clear underground passage and below
        dex
        bne _draw_passage_loop

        ; draw underground floor (brown row at bottom)

        ldy #22                         ; row 22
        sty zp_row
        lda #CHAR_UNDERGROUND_FLOOR     ; tile: underground passage floor (brown)
        jsr draw_tile_row

.comment
        ldx #$4f                        ; iterate over two rows of character graphics
_loop_draw_jungle_ground
        lda #CHAR_SURFACE_FLOOR         ; char: solid (multi color 2)
        sta screenRAM+$0230,x           ; draw jungle ground (upper) (yellow)
        lda #CHAR_SURFACE_EARTH
        sta screenRAM+$0280,x           ; draw jungle ground (lower) (red)
        lda #COLOR_LIGHTRED             ; display character as multi color (%11 = light red)
        sta ColorRAM+$0280,x            ; set color for jungle ground (lower)
        dex
        bpl _loop_draw_jungle_ground

        ; draw underground cavern (black background color area)

        ldx #$a0                        ; iterate over four rows of character graphics
        lda #$00                        ; char: background color (multi color 0)
_loop_draw_underground_cavern
        sta screenRAM+$02cf,x           ; underground cavern (black) (line 18 - 21)
        sta screenRAM+$0320,x           ; underground cavern (black) (line 20 - 23)
        dex
        bne _loop_draw_underground_cavern

        ; draw underground floor (brown row at bottom)

        ldx #$27                        ; iterator: draw 40 characters
        lda #CHAR_UNDERGROUND_FLOOR     ; char: solid (multi color 1)
_loop_draw_underground_floor
        sta screenRAM+$0370,x           ; underground floor (row 22)
        dex
        bpl _loop_draw_underground_floor
.endcomment

        ; initialize rolling logs and scorpion

        lda #$00                            ; clear 10 zero page variables:
        ldx #$0a                            ; rolling log x,y, scorpion
_loop_init_object_coords
        sta zp_log_0_x_pos,x                ; rolling log positions
        dex
        bne _loop_init_object_coords        ; BUG: does not init zp_log_0_x_pos itself!

        sta zp_blocked_by_wall              ; 0: not blocked, >=$80 blocked by wall, bit 1: orientation
.comment
        sta VicSpriteToSpriteCol            ; turn off sprite-to-sprite collisions
.endcomment

        ; draw central hole, ladder and underground wall (if included in the scene)

        lda zp_scene_type
        cmp #$02                            ; does scene have holes in the ground?
        bcc _draw_center_hole_and_ladder    ; scene < 2:  holes in the ground
        jmp init_scorpion                   ; scene >= 2: scorpion enabled
_draw_center_hole_and_ladder
.if DO_BUGFIX == false
        lda #$39                            ; (ignored, can be removed?)
.endif

        ; draw the center hole

        ldy #COL_HOLE_CENTER                ; pit position (x): middle ($14)
        ldx #$02                            ; pit width: 2 characters
        jsr draw_hole                       ; draw center hole


        ; determine the wall position (left or right)

        ldy #COL_WALL_LEFT                  ; screen column: wall to the left
        lda zp_room
        bpl _wall_to_the_left               ; room bit 7: 0: wall to left, 1: wall to right
        ldy #COL_WALL_RIGHT                 ; screen column: wall to the right
_wall_to_the_left
        sty zp_wall_pos

        ; draw the ladder and the wall

        ldx #LADDER_LENGTH              ; iterator: length of ladder (6)
        ldy #ROW_LADDER_TOP             ; row 16
        sty zp_row
_loop_draw_ladder_and_wall
        ldy #COL_LADDER                 ; x position of ladder (in characters)
        sty zp_column
        lda #CHAR_LADDER_LEFT           ; draw left part of ladder
        jsr draw_tile_bg
        lda #CHAR_LADDER_RIGHT          ; draw right part of ladder
        jsr draw_tile_bg
        cpx #WALL_HEIGHT+1              ; last four rows in iterator?
        bcs _skip_brick_wall            ; no ->
        ldy zp_wall_pos                 ; wall position
        sty zp_column
        lda #CHAR_BRICK_WALL
        jsr draw_tile_bg                ; draw brick wall (1st byte in row)
        jsr draw_tile_bg                ; draw brick wall (2nd byte in row)
_skip_brick_wall
        inc zp_row
        dex                             ; dec. iterator
        bne _loop_draw_ladder_and_wall


_break
        jmp _break


        ; draw additional holes left and right (if included in the scene)

        lda zp_scene_type                   ; examine scene
        cmp #SCENE_3_HOLES                  ; three holes in the ground?
        bne init_skip_scorpion_quicksand    ; no ->

        ldx #$03                            ; hole width: 3 characters
        ldy #COL_HOLE_LEFT                  ; hole position (column): left ($0d)
        jsr draw_hole                       ; draw left hole

        ldx #$03                            ; hole width: 3 characters
        ldy #COL_HOLE_RIGHT                 ; hole position (column): right ($1c)
        jsr draw_hole                       ; draw right hole

        bne init_skip_scorpion_quicksand    ; (always) skip scorpion

init_scorpion
        lda #X_POS_SCORPION_START           ; scorpion: start x-pos
        sta zp_scorpion_x_pos
        lda #SPRITE_ID_SCORPION_RIGHT       ; sprite id: scorpion right
        sta zp_scorpion_sprite_id

        ; init quicksand

        lda zp_scene_type
        cmp #SCENE_TREASURE                 ; shifting pit or quicksand?
        bcs _keep_pit_state                 ; yes -> keep previous state of shifting pit
        lda #$01                            ; pit initially is open
        sta zp_quicksand_direction          ; 0: pit is opening, 1: pit is closing
_keep_pit_state
        jsr init_quicksand

init_skip_scorpion_quicksand
        ldy #COLOR_LIGHTBLUE                ; color of water
        ldx zp_scene_type
        cpx #SCENE_CROCODILES               ; crocodiles in the water?
        bne init_skip_crocodiles            ; no ->
        jmp init_crocodiles                 ; yes -> initialize crocodiles

init_skip_crocodiles
        txa                                 ; zp_scene_type
        and #$03                            ; if scene_type AND 3 == 3: blue pit
        cmp #$03                            ; pit color is blue?
        beq _no_tar_pit                     ; yes -> color = blue
        ldy #COLOR_BLACK                    ; color for tar pit
_no_tar_pit
        sty zp_background_col_0             ; VIC background color 0 (pit color)

        cpx #SCENE_TREASURE                 ; shifting tar pit with treasure?
        bne _init_skip_treasure
        jsr check_treasure_collected        ; has treasure been collected already?
        beq _init_treasure                  ; treasure not collected ->
        bne init_treasure_rts               ; treasure already collected -> (rts)

_init_skip_treasure
_wait_raster_offscreen
        lda VicScreenCtrlReg1               ; wait for MSB raster line = 1
        bpl _wait_raster_offscreen          ; MSB raster = 0? ->

        ; init objects like rolling/static logs, fire, snake

;l8e78
        lda zp_objects                      ; contains objects for current room
        asl                                 ; (rolling logs, static logs, fire, snake)
        asl
        asl                                 ; as index into table of 8 byte records
        tax
        ldy #$00                            ; iterator
_loop_set_objects_x_pos
        lda objects_x_pos_table,x           ; get x pos byte for object
        sta @w zp_log_0_x_pos,y             ; store in object's x pos byte
        inx                                 ; next source location
        iny                                 ; inc iterator/dest location
        cpy #$06                            ; set x pos for 3 objects (some may be 0)
        bne _loop_set_objects_x_pos         ; (each pos has two bytes)

        ldx zp_objects
        lda number_logs_table,x             ; get # of rolling logs
        tax                                 ; as index/iterator
        lda #Y_POS_ROLLING_LOG
_loop_set_log_y_pos
        sta zp_log_0_y_pos-1,x              ; rolling log sprites y pos
        dex
        bne _loop_set_log_y_pos

        ldx zp_objects
        cpx #$07                            ; object = snake?
        bne _skip_objects_are_hires         ; BUG: fire should be multi-color, potentially also log
        lda VicSpriteMulticolor
        ora #$39                            ; set snake as multi-color
        sta VicSpriteMulticolor

_skip_objects_are_hires
        lda object_color_table,x            ; get color for object type
        tay
        lda object_sprite_id_table,x
        jsr objects_set_sprite_id_and_color ; set id and color for sprites 3,4,5
        bne init_treasure_rts


_init_treasure
        lda zp_objects
        and #$03                            ; isolate treasure type: money=0, silver=1, gold=2, ring=3
        tax                                 ; x = treasure type index
        lda zp_ntsc_pal
        cmp #VIDEO_NTSC
        bne _init_treasure_multicolor_pal
        cpx #$00                            ; treasure = money?
        bne _init_treasure_multicolor_ntsc  ; no -> use hires
_init_treasure_multicolor_pal
        lda VicSpriteMulticolor
        ora #$39                            ; Player, Snake/Fire/log0, log1, log2: Multi color
        sta VicSpriteMulticolor

_init_treasure_multicolor_ntsc
        lda treasure_color_table,x
        tay
        lda treasure_sprite_id_table,x
        jsr objects_set_sprite_id_and_color ; set id and color for sprites 3,4,5

        lda #$0e
        sta zp_treasure_x_pos               ; treasure x position (2)
        inc zp_treasure_x_pos+1             ; treasure x position hi byte
        ldx #Y_POS_TREASURE                 ; y position treasure (except ring)
        lda zp_objects
        and #$03                            ; treasure kind
        cmp #$03                            ; treasure == ring?
        bne _init_treasure_set_y_pos        ; no ->
        ldx #Y_POS_TREASURE_RING            ; y position treasure (ring)
_init_treasure_set_y_pos
        stx zp_treasure_y_pos               ; treasure y position

init_treasure_rts
        rts


init_crocodiles
l8ee9
        sty zp_background_col_0             ; VIC background color 0 (pit color)
        lda #SPRITE_ID_CROCODILE            ; sprite id: crocodile
        ldy #COLOR_BLACK                    ; sprite color
        jsr objects_set_sprite_id_and_color ; set id and color for sprites 3,4,5
        sty zp_crocodile_timer
        lda #$01                            ; pit (water) is open!
        sta zp_quicksand_direction          ; 0: pit is opening, 1: pit is closing
        lda #X_POS_CROCODILE_0
        sta zp_croc_0_x_pos                 ; crocodile 0 x position (2)
        lda #X_POS_CROCODILE_1
        sta zp_croc_1_x_pos                 ; crocodile 1 x position (2)
        lda #X_POS_CROCODILE_2
        sta zp_croc_2_x_pos                 ; crocodile 2 x position (2)
        lda #Y_POS_CROCODILE                ; crocodile y position
        sta zp_croc_0_y_pos                 ; crocodile 0 y position
        sta zp_croc_1_y_pos                 ; crocodile 1 y position
        sta zp_croc_2_y_pos                 ; crocodile 2 y position

        ; set swinging vine flag

        lda zp_objects
        and #$02                            ; flag. vine present in this room
        sta zp_room_has_vine


init_quicksand
l8f12
        ldx #$00                            ; constant: pit is closed
        lda zp_quicksand_direction          ; 0: pit is opening, 1: pit is closing
        beq _set_quicksand_state            ; pit is initially closed ->
        ldx #$06                            ; constant: pit is open
_set_quicksand_state
        stx zp_quicksand_state              ; 0: closed, 2-5 partially open, 6: open
        lda #$00
        sta zp_quicksand_timer              ; start timer for keeping pit open or closed ($00..$27)
        sta zp_collision_surface            ; sprite-to-sprite collisions on surface level
        sta zp_collision_scorpion           ; 0: no collision, 1: collision with scorpion
        sta zp_blocked_by_wall              ; 0: not blocked, >=$80 blocked by wall, bit 1: orientation


draw_quicksand
        lda zp_quicksand_state          ; 0: closed, 2-5 partially open, 6: open
        asl                             ; as 16 bit index
        tax
        lda quicksand_char_data_ptr+0,x
        sta zp_src+0
        lda quicksand_char_data_ptr+1,x
        sta zp_src+1
        lda #14                         ; start drawing at line 14
        sta zp_row
        ldy #$00
_draw_quicksand_row_loop
        lda #10
        sta zp_column
_draw_quicksand_col_loop
        lda (zp_src),y                  ; quicksand character phase x, column y
        jsr draw_tile_bg                ; draw the tile
        iny
        cpy #20                         ; switch to second row?
        bne _continue                   ; no ->
        inc zp_row
        bne _draw_quicksand_row_loop
_continue
        cpy #40                         ; copy two times 20 bytes
        bne _draw_quicksand_col_loop
        rts


.comment                                    ; original C64
        lda zp_quicksand_state              ; 0: closed, 2-5 partially open, 6: open
        asl                                 ; as 16 bit index
        tax
        lda quicksand_char_data_ptr+0,x
        sta $36
        lda quicksand_char_data_ptr+1,x
        sta $37
        ldy #$00
        ldx #$00
_loop_draw_quicksand
        lda ($36),y                         ; quicksand character phase x, column y
        cpy #$14                            ; index >= total width?
        bcs _lower_row                      ; yes, store in lower row
        sta $423a,x                         ; store in row 14, start at column 10
        bne _continue
_lower_row
        sta $424e,x                         ; store in row 15, start at column 10
_continue
        iny
        inx
        cpy #$28                            ; copy two times $14 bytes
        bne _loop_draw_quicksand
        rts
.endcomment


draw_hole
        lda #14                             ; draw upper edge of hole
        sta zp_row
        sty zp_column

        lda #$24                            ; char: upper left edge of hole
        jsr draw_tile_bg
        lda #CHAR_HOLE_UPPER                ; char: hole upper part
        jsr draw_tile_repeat
        lda #$22                            ; char: upper right edge of hole
        jsr draw_tile_bg

        inc zp_row                          ; draw lower edge of hole
        sty zp_column

        lda #$25                            ; char: lower left edge of hole
        jsr draw_tile_bg
        lda #CHAR_HOLE_LOWER                ; char: hole lower part
        jsr draw_tile_repeat
        lda #$23                            ; char: lower right edge of hole
        jsr draw_tile_bg

        inc zp_row                          ; draw upper part of earth
        sty zp_column

        lda #$27                            ; left edge of hole (earth)
        jsr draw_tile_bg
        lda #CHAR_BLACK                     ; char: blank
        jsr draw_tile_repeat
        lda #$26                            ; right edge of hole (earth)
        jsr draw_tile_bg

        inc zp_row                          ; draw upper part of earth
        sty zp_column

        lda #$27                            ; left edge of hole (earth)
        jsr draw_tile_bg
        lda #CHAR_BLACK                     ; char: blank
        jsr draw_tile_repeat
        lda #$26                            ; right edge of hole (earth)
        jsr draw_tile_bg
        

.comment
        lda #CHAR_HOLE_UPPER                ; char: hole upper part
        sta screenRAM+$0230,y               ; draw in screen RAM at column y
        lda #CHAR_HOLE_LOWER                ; char: hole lower part
        sta screenRAM+$0258,y
        lda #CHAR_BLACK                     ; char: blank
        sta screenRAM+$0280,y
        sta screenRAM+$02a8,y
        dey                                 ; decrement screen column
        dex                                 ; iterate over hole width
        bne draw_hole
.endcomment
        rts


l8f64
objects_set_sprite_id_and_color         ; parameters: A: sprite ID, Y: sprite color
        ldx #$02
_loop_over_three_sprites
        sta sprite_3_pointer,x              ; set sprite pointer
        pha
        tya
        sta VicSprite3Color,x               ; set sprite color
        pla
        dex
        bpl _loop_over_three_sprites
        rts

randomize_jungle
l8f73
        lda zp_trees_layout                 ; randomized layout of the tree trunks, branches etc.
        asl
        eor zp_trees_layout
        asl
        rol zp_trees_layout
        lsr
        lsr
        lsr
        sta zp_leaves_layout                ; randomized layout of the tree leaves
        lda zp_trees_layout
        and #$f0
        ora zp_leaves_layout
        sta zp_leaves_layout
        rts


multiply_by_8
        asl zp_dst+0                        ; zp_dst (zp_src2) *= 8
        rol zp_dst+1
        asl zp_dst+0
        rol zp_dst+1
        asl zp_dst+0
        rol zp_dst+1
        rts

l8f96
draw_jungle_background
        lda zp_room
        sta zp_trees_layout             ; seed for jungle randomization

        lda #6                          ; draw line 4-6, backward
        sta zp_row
        lda #39
        sta zp_column

        ldx #3*40-1                     ; iterator: screen memory offsets for 3 lines
        clc
_loop_draw_treetop
        jsr randomize_jungle            ; (random generator $3a/$3f, returns zp_leaves_layout)
        and #$14                        ; select two bits in leaves layout
        beq _thin_leaves                ; 75% probability to be 0
        lda #CHAR_DENSE_LEAVES          ; character: "default tree leaves"
        bne _thick_leaves
_thin_leaves
        lda zp_leaves_layout            ; randomized layout of the tree leaves
        and #$03                        ; select a "random" number 0-3 based on zp_leaves_layout
        php
        clc
        adc #$0c                        ; convert to a character in range $0c..$0f
        plp
_thick_leaves
        jsr draw_tile_bg
        dec zp_column
        dec zp_column
        bpl _continue_treetop
        dec zp_row
        lda #39
        sta zp_column
_continue_treetop
        dex
        bpl _loop_draw_treetop

        ; draw treetop transition in row 7

        ; originally: fill screen mem with chars $4a..$71
        ; F256: we directly fill the randomized tiles of the leaves here
        ;       the branches will go to the foreground tilemap

        ; randomize the 40 characters in the transition zone
        ; the characters are printed left to right

        lda #7                          ; draw line 7, backwards
        sta zp_row
        lda #0
        sta zp_column

        lda zp_trees_layout
        and #$03                            ; start transition char = (layout & 3) + 4
        ora #$04                            ; ($04..$07)
        sta zp_tree_transition_char         ; character in tree transition line

        ldx #$27
_loop_randomize_transition_zones
        ; first, select a random character in range $04..$0b
        jsr randomize_jungle                ; (random generator $3a/$3f, returns $3a)
        ldy zp_tree_transition_char         ; character in tree transition line
        cpy #$04                            ; minimum character id for transition zone
        bne _limit_transition_char_max
_inc_transition_char
        iny
        bne _randomize_transition_char_cont ; -> character selected
_limit_transition_char_max
        cpy #$0b                            ; limit effective char id to range $04..$0b
        bne _randomize_char_by_layout
        dey                                 ; limit reached -> use character $0a
        bne _randomize_transition_char_cont ; -> character selected
_randomize_char_by_layout
        rol                                 ; (based on zp_leaves_layout)
        bcc _inc_transition_char            ; bit = 0: increment transition character

        dey                                 ; bit = 1: decrement transition character
_randomize_transition_char_cont
_randomiz_transition_char_cont
        sty zp_tree_transition_char         ; character in tree transition line

        tya
        jsr draw_tile_bg
        sta jungle_transition_chars,x   ; store for later use in lower transition zone
        dex
        bpl _loop_randomize_transition_zones


        ; clear the jungle background behind the tree trunks

        lda #0
        sta zp_column
        lda #8                          ; row 8
        sta zp_row
        ldx #5                          ; # of lines to draw: 6
        lda #CHAR_JUNGLE_BACKGROUND     ; char: jungle background (green)
_draw_jungle_background_loop
        jsr draw_tile_row               ; clear jungle background (behind trunks)
        dex
        bne _draw_jungle_background_loop


        ; draw the trees

        lda #7                          ; row 7 (transition zone)
        sta zp_row
l9029
        lda #$03                            ; iterator: # of tree trunks
        sta zp_tree_index
        lda #$00                            ; allow skipping of middle tree
        sta zp_tree_force_middle            ; 0: allow skipping of tree, 1: draw middle tree

_loop_draw_tree_branches
        jsr randomize_jungle                ; (random generator $3a/$3f, returns $3a)
        ldx zp_tree_index
        beq _draw_tree_branches             ; tree #0 -> always draw
        cpx #$03
        beq _draw_tree_branches             ; tree #3 -> always draw
        lda zp_tree_force_middle            ; 0: allow skipping of tree, 1: draw middle tree
        bne _draw_tree_branches             ; skipping not allowed? -> draw tree
        lda zp_trees_layout
        and #$c0
        cmp #$c0
        bne _draw_tree_branches
        inc zp_tree_force_middle            ; force drawing of next middle tree (if any)
        lda #$ff                            ; marker: skip tree
        sta zp_tree_0_column,x              ; $61-$64: start column of tree trunk x
        jmp _draw_tree_branches_continue    ; continue with next tree

_draw_tree_branches
_l9051
        lda #$00                            ; offset for tree #3
        cpx #$03                            ; tree index == 3? (first iteration, i.e. first tree)
        beq _use_default_tree_offset

        lda zp_trees_layout                 ; pseudo random number
        and #$07                            ; range: 0-7
        cmp #$06                            ; limit range to 0..5
        bcs _loop_draw_tree_branches
_use_default_tree_offset
        sta zp_tree_offset                  ; horizontal offset of tree from default position (0..5)


        lda zp_tree_index
        tax
        clc
        lda col_tree_offset_table,x         ; tree default offset
        adc zp_tree_offset                  ; add delta position 
        sta zp_tree_0_column,x              ; $61-$64: start column of tree trunk x
        sta zp_column

        lda zp_trees_layout                 ; select a tree branches pattern based on zp_trees_layout
        and #$30                            ; isolate two bits
        lsr
        lsr                                 ; make it a 16 bit offset based on number 0..3
        lsr
        lsr                                 ; F256 (make it 8 bit offset rather than 16 bit) (pattern id: 0..3)
        sta zp_tree_0_width,x               ; $65-$68: width of tree trunk x
        tax
        phx                                 ; F256: removed for now, is this needed further down?

        lda small_branch_pattern_char_start,x ; F256

        ldy #5-1                            ; repeat for 5 character definitions
_loop_copy_tree_branch_char
        jsr draw_tile_fg
        clc
        adc #$01
        dey
        bpl _loop_copy_tree_branch_char


        inc zp_row                          ; inc row for big branches (8)
        lda zp_column
        sec
        sbc #5
        sta zp_column

        plx                                 ; branch pattern (0..3)
        lda big_branch_pattern_char_start,x ; F256
        tax

        ldy #5-1                            ; repeat for 5 character definitions
_loop_copy_tree_big_branch_char
        lda branch_screen_mem_patterns,x    ; read character part of branches
        jsr draw_tile_bg
        inx
        dey
        bpl _loop_copy_tree_big_branch_char
        dec zp_row                          ; dec row back to transition zone

_draw_tree_branches_continue
        dec zp_tree_index
        bmi draw_lower_transition_zone
        jmp _loop_draw_tree_branches


draw_lower_transition_zone

        ; draw the lower transition zone

        lda #39
        sta zp_column
        lda #12                             ; row 12
        sta zp_row

        ldx #39
_loop_draw_lower_transition_zone
        lda jungle_transition_chars,x
        clc
        adc #CHAR_LOWER_TRANSITION-CHAR_UPPER_TRANSITION
        jsr draw_tile_bg
        dec zp_column
        dec zp_column
        dex
        bpl _loop_draw_lower_transition_zone


draw_grass_zone

        ; draw the grass, the lowest zone in the jungle background

        lda #0
        sta zp_column
        lda #13                         ; row 13
        sta zp_row

        ldx #40-1                       ; iterator: screen memory offsets for 1 line
        clc
_loop_draw_grass
        jsr randomize_jungle            ; (random generator $3a/$3f, returns zp_leaves_layout)
        and #$14                        ; select two bits in leaves layout
        beq _thin_grass                 ; 75% probability to be 0
        lda #CHAR_DENSE_LEAVES          ; character: "default tree leaves"
        bne _thick_grass
_thin_grass
        lda zp_leaves_layout            ; randomized layout of the tree leaves
        and #$03                        ; select a "random" number 0-3 based on zp_leaves_layout
        php
        clc
        adc #$0c                        ; convert to a character in range $0c..$0f
        plp
_thick_grass
        jsr draw_tile_bg
        dex
        bpl _loop_draw_grass


draw_tree_trunks

        ; draw the tree trunks

        lda #9
        sta zp_row

        lda #$05                            ; tree trunk height
        sta zp_iterator_0                   ; iterator: tree trunk height
_loop_draw_tree_trunks
        lda #4-1                            ; iterator: # of tree trunks
        sta zp_tree_index2                  ; 0..3

_loop_draw_tree_trunk_line
        ldx zp_tree_index2                  ; 0..3
        lda zp_tree_0_column,x              ; $61-$64: start column of tree trunk x
        cmp #$ff                            ; skip this tree?
        beq _skip_tree                      ; yes ->
        sta zp_tree_position                ; horizontal position of tree
        lda zp_tree_0_width,x               ; $65-$68: pattern id 0..3 (width of tree trunk x)
        and #$02                            ; 0 or 2
        lsr                                 ; 0 or 1
        clc
        adc #$02                            ; tree width: 2 or 3 columns
        tax                                 ; as index
        clc
        adc zp_tree_position                ; add width to horizontal position of tree
        tay
        lda #CHAR_TREE_TRUNK                ; char: tree trunk
_loop_tree_draw_trunk
        sty zp_column
        jsr draw_tile_bg
        dey
        dex
        bne _loop_tree_draw_trunk
_skip_tree
        dec zp_tree_index2                  ; 0..3
        bpl _loop_draw_tree_trunk_line

        ; prepare to draw next line of tree trunks

_skip_inc
        inc zp_row
        dec zp_iterator_0                   ; iterate over tree trunk length
        bne _loop_draw_tree_trunks

        rts


l913c
check_treasure_collected                ; return: "not equal": treasure collected, A: bitmask, X: treasure byte
        lda zp_room                         ; current room
        rol
        rol                                 ; extract bits 6-7 (zp_treasure_collected_flags offset)
        rol
        and #$03
        tax
        ldy zp_objects                      ; treasure kind
        lda treasure_bit_mask,y
        tay
        and zp_treasure_collected_flags,x   ; each bit: 1 = treasure not collected (4)
        php
        tya
        ora zp_treasure_collected_flags,x   ; each bit: 1 = treasure not collected (4)
        plp
        rts


l9152
decompress_rle_data
        ldy #$00
_loop_next_rle_byte
        lda (zp_src),y                      ; read next RLE encoded byte
        bmi _rle_handle_command             ; >= $80? -> handle command
        sta (zp_dst),y                      ; directly store byte in destination
        inc zp_src+0                        ; increment source pointer
        bne _inc_dst_ptr
        inc zp_src+1
_inc_dst_ptr
        inc zp_dst+0                        ; increment destination pointer
        bne _continue
        inc zp_dst+1
_continue
        jmp _loop_next_rle_byte

_rle_handle_command
        cmp #$ff                            ; RLE end of input
        beq _exit
        and #$7f                            ; strip command indicator bit
        tax                                 ; x = run length - 1
        inc zp_src+0                        ; increment source pointer
        bne _loop_store_byte_run
        inc zp_src+1
_loop_store_byte_run
        lda (zp_src),y                      ; read byte run value
        sta (zp_dst),y                      ; store in destination
        inc zp_dst+0                        ; increment destination pointer
        bne _continue_byte_run
        inc zp_dst+1
_continue_byte_run
        dex                                 ; iterate over byte run length
        bpl _loop_store_byte_run            ; write to next destination

        inc zp_src+0                        ; increment source pointer
        bne _continue_rle_decompression
        inc zp_src+1
_continue_rle_decompression
        jmp _loop_next_rle_byte
_exit
        rts

; the following two tables describe the x/y curve the swinging vine traverses

swinging_vine_dy_sections
l918d
        .byte $45,$40,$3a,$31,$24,$19,$10,$09,$04

swinging_vine_dy_amount
l9196
        .byte $02,$02,$02,$02,$02,$01,$01,$01,$01


draw_swinging_vine_sprites
l919f
        ldx #$00                            ; clear destination buffer
        txa
_loop_clear_vine_sprite_data
        sta sprite_buffer_vine+$0000,x      ; clear sprite data buffer ($0800-$0aff)
        sta sprite_buffer_vine+$0100,x
        sta sprite_buffer_vine+$0200,x
        dex
        bne _loop_clear_vine_sprite_data

        ; calculate the y-delta (extend) of the swinging vine

        lda #$29                            ; minimum y-extend of vine (at maximum angle)
        sta zp_vine_y_delta                 ; swinging vine delta y position relative to anchor
        ldx #$00                            ; iterator: index into dy delta sections table
_loop_calc_vine_y_delta
        lda zp_vine_x_delta_absolute        ; delta x position relative to middle
        cmp swinging_vine_dy_sections,x     ; vine x > delta x vine section?
        beq _vine_increase_y_extend         ; no -> extend vine_y_delta
        bcs _finish_calc_vine_y_delta       ; yes -> no more extension
_vine_increase_y_extend
        lda swinging_vine_dy_amount,x       ; delta y between vine sections
        clc
        adc zp_vine_y_delta                 ; extend swinging vine delta y position relative to anchor
        sta zp_vine_y_delta
        inx                                 ; next y-extend section
        cpx #$09                            ; finished?
        bne _loop_calc_vine_y_delta         ; no ->

_finish_calc_vine_y_delta
        ldy zp_vine_y_delta                 ; swinging vine delta y position relative to anchor
_loop_draw_vine
_l91cc
        ; calculate: dx = (dy * zp_vine_x_delta_absolute) / zp_vine_y_delta

        lda zp_vine_y_delta                 ; swinging vine delta y position relative to anchor
        sta zp_divisor                      ; divisor in division
        sty zp_factor_1                     ; factor 1 in multiplication: delta y
        lda zp_vine_x_delta_absolute        ; delta x position relative to middle
        sta zp_factor_2                     ; factor 2 in multiplication: delta x

        ; perform multiplication of factor_1 and factor_2
        ; "shift and add" algorithm

        lda #$00                            ; initialize result (hi)
        ldx #$08                            ; iterator for loop (8 bits)
_loop_multiply
        lsr zp_factor_1                     ; bit x set in factor 1?
        bcc _no_add                         ; bit not set -> don't add factor 2
        clc
        adc zp_factor_2
_no_add
        ror                                 ; multiplication result (hb)
        ror zp_product_lb                   ; multiplication result (lb)
        dex
        bne _loop_multiply                  ; repeat for 8 bits

        ; perform division: dividend = A (hb) / zp_product_lb (lb)

        ; we get away with only handling 8 bits (rather than 16) because
        ; the divisor (zp_vine_y_delta) is always larger than the
        ; factor (zp_vine_x_delta_absolute) in the multiplication above 

        ldx #$08                            ; iterator for loop (8 bits)
        sec
        sbc zp_divisor                      ; subtract divisor
_loop_divide
        php
        rol zp_vine_dx                      ; dx = product / delta_y
        asl zp_product_lb                   ; multiplication result (lb)
        rol
        plp
        bcc _division_underflow             ; dividend > divisor -> add back, subtract $49
        sbc zp_divisor                      ; subtract divisor
        jmp _division_no_underflow
_division_underflow
        adc zp_divisor                      ; add divisor
_division_no_underflow
        dex
        bne _loop_divide

        bcs _division_last_bit
        adc zp_divisor                      ; add divisor
        clc
_division_last_bit
        rol zp_vine_dx                      ; final iteration
        inc zp_vine_dx

_draw_vine_pixel
        sty zp_vine_y
        lda zp_vine_swing_side              ; 0: vine swings on right side, 1: left side
        ldx zp_vine_change_direction        ; 0: don't change direction, 1: vine changes direction
        beq _skip_change_swing_side
        eor #$01
_skip_change_swing_side
        cmp #$00
        beq _calc_vine_x_on_right_side

                                            ; calc x pos for vine swinging on left side
        lda #$5f                            ; maximum x pos for vine pixel
        sec                                 ; invert the x position (mirrors the sprite)
        sbc zp_vine_dx                      ; dx value of swinging vine
        bcs _set_vine_x_pos                 ; (always) ->
_calc_vine_x_on_right_side              ; calc x pos for vine swinging on right side
        lda zp_vine_dx                      ; dx value of swinging vine
_set_vine_x_pos
        sta zp_vine_x                       ; vine pixel: x pos
        and #$07                            ; extract pixel position in sprite data byte
        tax                                 ; as index

        lda zp_vine_x                       ; y position of pixel
        lsr                                 ; make 16 bit offset: (y / 4) && $fe
        lsr
        and #$fe
        tay
        lda sprite_field_data_col_ptr+0,y   ; line 0, column y data pointer in sprite field (lb)
        sta zp_dst+0
        lda sprite_field_data_col_ptr+1,y   ; line 0, column y data pointer in sprite field (lb)
        sta zp_dst+1
        ldy zp_vine_y                       ; vine pixel: y pos
        tya                                 ; A = 3 * zp_vine_y
        asl
        clc
        adc zp_vine_y
        cpy #$15                            ; line within row 0 sprite?
        bcc _set_vine_sprite_pixel          ; yes ->
        clc
        adc #$01                            ; (skip extra byte at end of row 0 sprite data)
        cpy #$2a                            ; line within row 1 sprite?
        bcc _set_vine_sprite_pixel          ; yes ->
        clc
        adc #$01                            ; (skip extra byte at end of row 1 sprite data)

_set_vine_sprite_pixel
        tay                                 ; byte offset into sprite field
        lda (zp_dst),y                      ; read current destination byte
        ora pixel_mask_for_x_pos,x          ; set pixel in destination byte
        sta (zp_dst),y                      ; write back destination byte

        ldy zp_vine_y
        dey                                 ; vine y: move one pixel up
        cpy #$0c                            ; minimum y pos: 13
        beq _wait_raster_c0                 ; finished drawing line ->
        tya
        ror                                 ; is zp_vine_y odd?
        bcs _continue_loop_draw_vine        ; yes -> calculate next dx

        ; else: draw another pixel without recalculating dx
        lda zp_vine_x_delta_absolute        ; delta x position relative to middle
        cmp #$10                            ; small angle? (delta_x_absolute < 10)
        bcc _small_angle                    ; yes -> use same value for zp_vine_dx
        dec zp_vine_dx                      ; large angle: decrement zp_vine_dx
_small_angle
        jmp _draw_vine_pixel
_continue_loop_draw_vine
        jmp _loop_draw_vine

_wait_raster_c0
;l926b
        lda VicScreenCtrlReg1               ; wait for MSB raster line = 0
        bmi _wait_raster_c0                 ; MSB raster = 1? ->
        lda VicRasterValue
        cmp #$c0                            ; raster line >= $0c0?
        bcc _wait_raster_c0                 ; no ->

        lda zp_vine_change_direction        ; 0: don't change direction, 1: vine changes direction
        beq _skip_update_swing_side         ; don't change swing side ->
        lda zp_vine_swing_side              ; 0: vine swings on right side, 1: left side
        eor #$01                            ; change side of swinging vine
        sta zp_vine_swing_side              ; 0: vine swings on right side, 1: left side
_skip_update_swing_side
        ldx #$00
_loop_update_sprite_data_vine
        lda $0800,x
        sta $5140,x                         ; copy to sprite id $45-$48
        lda $0900,x
        sta $5240,x                         ; copy to sprite id $49-$4c
        lda $0a00,x
        sta $5340,x                         ; copy to sprite id $4d-$50
        inx
        bne _loop_update_sprite_data_vine
                                            ; x = 0
        stx zp_vine_change_direction        ; 0: don't change direction, 1: vine changes direction
        rts

.comment
init_hardware                           ; init CIAs, SID, Processor Port
l929b
        lda #$7f                            ; clear all interrupt sources
        sta Cia1IrqCtrlReg                  ; clear all interrupt sources CIA 1
        sta Cia2IrqCtrlReg                  ; clear all interrupt sources CIA 1
        sta Cia1PortA                       ; deselect all keyboard matrix columns

        lda #$08                            ; initialize timers:
        sta Cia1TimerACtrlReg               ; stop timer, stop on underflow
        sta Cia2TimerACtrlReg               ; stop timer, stop on underflow
        sta Cia1TimerBCtrlReg               ; stop timer, stop on underflow
        sta Cia2TimerBCtrlReg               ; stop timer, stop on underflow

        ldx #$00
        stx Cia1PortBDataDir                ; Port B can only be read
        stx Cia2PortBDataDir                ; Port B can only be read
        stx SidFilterModeVolume
        dex                                 ; x = $ff
        stx Cia1PortADataDir                ; Port A can be written and read
        lda #$07                            ; select VIC bank #3: $0000-$3fff, RS232 TXD
        sta Cia2PortA
        lda #$3f                            ; VIC bank, RS232 TXD, Serial ATN OUT, CLK OUT, DATA OUT
        sta Cia2PortADataDir                ; enable write for bits as above
        lda #$e7
        sta R6510                           ; Processor Port
        lda #$2f
        sta D6510                           ; Data direction: Processor Port
        rts
.endcomment


interrupt_raster_32
l92d6
        lda zp_vic_screen_ctrl_reg2
        sta VicScreenCtrlReg2
        lda #COLOR_WHITE
        sta VicSprite1Color
        sta VicSprite2Color
        lda #$00                            ; COLOR_BLACK
        sta VicSpritePriority               ; give sprites priority over background
        sta VicSpriteMultiColor1
        lda #COLOR_LIGHTBLUE
        sta VicSpriteMultiColor0
        lda #Y_POS_SCORE                    ; y position of score and lives indicator
        sta VicSprite1YPos                  ; (score/timer)
        sta VicSprite2YPos                  ; (score/timer)
        sta VicSprite7YPos                  ; (# of lives)
        lda #$50
        sta VicSprite1XPos
        lda #$80
        sta VicSprite2XPos
        lda #$28
        sta VicSprite7XPos
        ldx #$43                            ; score sprite (0)
        stx sprite_1_pointer
        inx                                 ; score sprite (1) (#$29)
        stx sprite_2_pointer
        lda #$30
        sta sprite_7_pointer                ; # of lives sprite
        lda VicSpriteMulticolor
        ora #$80                            ; set sprite 7 to multicolor (# of lives)
        sta VicSpriteMulticolor
        lda #COLOR_WHITE
        sta VicSprite7Color
        lda zp_vic_background_color_0
        sta VicBackgroundColor0
        lda #COLOR_GREEN
        sta VicBackgroundColor1
        sta VicBackgroundColor2
        lda zp_player_x_pos
        sta VicSprite0XPos
        lda zp_player_y_pos
        sta VicSprite0YPos
        lda zp_log_0_x_pos                  ; rolling log/crocodile 0: x position
        sta VicSprite3XPos
        lda zp_log_0_y_pos                  ; rolling log/crocodile 0: x position
        sta VicSprite3YPos
        lda zp_log_1_x_pos                  ; rolling log/crocodile 1: x position
        sta VicSprite4XPos
        lda zp_log_1_y_pos                  ; rolling log/crocodile 1: x position
        sta VicSprite4YPos
        lda zp_log_2_x_pos                  ; rolling log/crocodile 2 x position
        sta VicSprite5XPos
        lda zp_log_2_y_pos                  ; rolling log/crocodile 2 y position
        sta VicSprite5YPos
        lda #$00                            ; calculate value for VicSpritexXPosMsb:
        ldy zp_player_x_pos+1               ; x-pos player sprite > 256?
        beq _skip_msb_sprite_0
        ora #$01                            ; set msb flag for sprite 0
_skip_msb_sprite_0
        ldy zp_log_0_x_pos+1                ; x-pos object sprite 3 > 256 (log or crocodile)
        beq _skip_msb_sprite_3
        ora #$08
_skip_msb_sprite_3
        ldy zp_log_1_x_pos+1                ; x-pos object sprite 4 > 256 (log or crocodile)
        beq _skip_msb_sprite_4
        ora #$10
_skip_msb_sprite_4
        ldy zp_log_2_x_pos+1                ; x-pos object sprite 5 > 256 (log or crocodile)
        beq _skip_msb_sprite_5
        ora #$20
_skip_msb_sprite_5
        sta VicSpritesXPosMsb               ; write Vic Sprite Msb flags (for all sprites)
        lda VicSpriteExpandX
        ora #$06                            ; expand sprites for Score/Timer
        sta VicSpriteExpandX
        ldx #$02                            ; next interrupt: pointer offset
        lda #$50                            ; next interrupt at raster line $50 (80)
        sta VicRasterValue

finish_interrupt
l9386
        lda raster_interrupt_entry_table+0,x
        sta CINV+0
        lda raster_interrupt_entry_table+1,x
        sta CINV+1
        lda #$81
        sta VicIrqStatusReg
        pla
        tay
        pla
        tax
        pla
        rti


interrupt_raster_80
        ; display the swinging vine if required by the room.
        ; The swinging vine is realized using sprites 1,2,6,7.
        ; In order to cover the whole arc of the vine, the
        ; 4 sprites are multiplexed three times in order to
        ; form a "carpet" of reused sprites, i.e. the resulting
        ; sprite field looks like this:
        ;
        ; line:   sprite ids:
        ;  60     45 48 4b 4e
        ;  75     46 49 4c 4f
        ;  8a     47 4a 4d 50

l939d
        cld
        ldx #COLOR_BLACK                    ; swinging vine color: black
        stx VicSprite1Color
        stx VicSprite2Color
        stx VicSprite7Color
        lda zp_vine_swing_side              ; 0: vine swings on right side, 1: left side
        beq _vine_swings_right              ; vine swing on right side ->
        lda #$57                            ; x-pos for vine swinging on the left side
        bne _vine_set_x_pos
_vine_swings_right
        lda #$b5                            ; x-pos for vine swinging on the right side
_vine_set_x_pos
        clc
        sta VicSprite1XPos                  ; x-pos 1st sprite of block
        adc #$18                            ; add width of sprite
        sta VicSprite2XPos                  ; x-pos 2nd sprite of block
        adc #$18                            ; add width of sprite
        sta VicSprite6XPos                  ; x-pos 3rd sprite of block
        adc #$18                            ; add width of sprite
        sta VicSprite7XPos                  ; x-pos 4th sprite of block
        ldy #$60                            ; start line of first row of sprites
        lda zp_room_has_vine                ; does room have vine?
        bne _set_vine_sprite_positions      ; yes ->

        ldy #$00                            ; else, hide vine
_set_vine_sprite_positions
        sty VicSprite1YPos
        sty VicSprite2YPos
        sty VicSprite6YPos
        sty VicSprite7YPos
        bne _first_vine_row_done
        sty VicSprite1XPos                  ; clear sprite x position to hide vine
        sty VicSprite2XPos
        sty VicSprite6XPos
        sty VicSprite7XPos

_first_vine_row_done
        lda #$c6                            ; give vine priority over background
        sta VicSpritePriority
        lda VicSpriteExpandX
        and #$39                            ; do not expand sprites for vine
        sta VicSpriteExpandX
        lda VicSpriteMulticolor
        and #$7f                            ; make re-used sprite 7 single color (part of vine)
        sta VicSpriteMulticolor
        lda #$45
        sta sprite_1_pointer                ; ($45)
        lda #$48
        sta sprite_2_pointer                ; ($48)
        lda #$4b
        sta sprite_6_pointer                ; ($4b)
        lda #$4e
        sta sprite_7_pointer                ; ($4e)
        lda VicSpriteToSpriteCol

        lda #$00                            ; all sprites have priority over background
        ldx #$6b
_wait_raster_107                        ; wait for raster line 107
        cpx VicRasterValue
        bcs _wait_raster_107

        sta VicSpritePriority               ; give sprites priority over background

        lda #$75                            ; y position of next row of sprites
_wait_raster_117                        ; wait for raster line 117
        cmp VicRasterValue
        bne _wait_raster_117

        sta VicSprite1YPos                  ; update y positions (multiplexed)
        inc sprite_1_pointer                ; ($46)
        sta VicSprite2YPos
        inc sprite_2_pointer                ; ($49)
        sta VicSprite6YPos
        inc sprite_6_pointer                ; ($4c)
        sta VicSprite7YPos
        inc sprite_7_pointer                ; ($4f)

        lda #$8a                            ; y position of next row of sprites
_wait_raster_138                        ; wait for raster line 138
        cmp VicRasterValue
        bne _wait_raster_138

        sta VicSprite1YPos                  ; update y positions (multiplexed)
        inc sprite_1_pointer                ; ($47)
        sta VicSprite2YPos
        inc sprite_2_pointer                ; ($4a)
        sta VicSprite6YPos
        inc sprite_6_pointer                ; ($4d)
        sta VicSprite7YPos
        inc sprite_7_pointer                ; ($50)

        lda #$a2                            ; next interrupt at raster line $a2 (162)
        sta VicRasterValue
        ldx #$04                            ; next interrupt: pointer offset
        jmp finish_interrupt


interrupt_raster_162
l9468
        pha
        pla
        ldx #$18                            ; MC-mode on, 40 columns, hor scroll 0
        lda #COLOR_YELLOW
        sta VicBackgroundColor2             ; make jungle floor yellow
        stx VicScreenCtrlReg2               ; MC-mode on, 40 columns, hor scroll 0
        ldy #COLOR_ORANGE
        sty VicBackgroundColor1
        lda zp_background_col_0             ; VIC background color 0 (pit color)
        sta VicBackgroundColor0
        lda #$00                            ; all sprites have priority over background
        sta VicSpritePriority               ; give sprites priority over background
        ldx VicRasterValue                  ; current raster value > 162 (normal operation)?
        cpx #$a2                            ; >= 162?
        bcs _continue                       ; yes ->
        jmp Cartridge_Start                 ; something is dodgy, restart!
_continue
        lda #$ab                            ; next interrupt at raster line $ab (171)
        sta VicRasterValue
        ldx #$06                            ; next interrupt: pointer offset
        jmp finish_interrupt


interrupt_raster_171
l9497
        lda #$01                            ; background has priority over Harry sprite
        sta VicSpritePriority               ; (allows Harry to sink into the pit
                                            ;  and climb through hole)
        lda #COLOR_BLACK                    ; color for water pit
        ldy #COLOR_BLUE                     ; color for tar pit

        ldx #$b0
_wait_raster_176
        cpx VicRasterValue
        bne _wait_raster_176

        sta VicBackgroundColor0             ; (COLOR_BLACK)
        sty VicSpriteMultiColor0            ; (COLOR_BLUE)

        lda #COLOR_BROWN                    ; color for Harry's hair and pants underground
        ldy #COLOR_RED                      ; color for lower jungle ground

        ldx #$b2
_wait_raster_178
        cpx VicRasterValue
        bcs _wait_raster_178

        sty VicBackgroundColor2             ; (COLOR_RED)
        sta VicSpriteMultiColor1            ; (COLOR_BROWN)

        lda #$00                            ; all sprites unexpanded
        sta VicSpriteExpandX

        lda VicSpriteToSpriteCol            ; read sprite-to-sprite collisions
        ora zp_collision_surface            ; update sprite-to-sprite collisions on surface level
        sta zp_collision_surface

        lda zp_scorpion_x_pos               ; update Sprite 1 position for scorpion
        sta VicSprite1XPos
        lda zp_scorpion_x_pos+1
        asl                                 ; as bitmask for VicSpritesXPosMsb
        sta zp_or_mask
        lda VicSpritesXPosMsb
        and #$df                            ; clear Sprite 1 MSB bit
        ora zp_or_mask                      ; set Sprite 1 MSB according to x pos
        sta VicSpritesXPosMsb

        lda zp_scorpion_x_pos
        ora zp_scorpion_x_pos+1
        beq scorpion_not_on_screen          ; x position = 0? -> don't show it
        lda #$d9                            ; scorpion y position = $d9
scorpion_not_on_screen
        sta VicSprite1YPos                  ; $d9 (on screen) or $00 (not on screen)
        lda zp_scorpion_sprite_id
        sta sprite_1_pointer
        lda #COLOR_WHITE                    ; color for scorpion: white
        sta VicSprite1Color

        lda zp_minutes
        ldx zp_game_paused                  ; 0: game is not paused, 1: game is paused
        bne _dec_time_done                  ; game paused -> don't decrease time
        ora zp_seconds                      ; timer = 00:00?
        beq _dec_time_done                  ; yes ->
        dec zp_frame_counter                ; counts down number of frames in a second
        bne _dec_time_done                  ; frames left in current second ->
        lda zp_ntsc_pal
        sta zp_frame_counter                ; counts down number of frames in a second

        sed                                 ; decimal mode ON
        lda zp_seconds                      ; decrement seconds
        sec
        sbc #$01
        sta zp_seconds                      ; seconds >= 0?
        bpl _dec_time_done
        lda #$59                            ; reset seconds to 59
        sta zp_seconds
        lda zp_minutes                      ; decrement minutes
        sec
        sbc #$01
        sta zp_minutes

_dec_time_done
        lda #$ea                            ; next interrupt at raster line $ea (234)
        sta VicRasterValue
        ldx #$08                            ; next interrupt: pointer offset
        jmp finish_interrupt


interrupt_raster_234
l9524
        lda #COLOR_BLACK
        sta VicBackgroundColor0
        lda #$10                            ; MC-mode on, 38 columns, hor scroll 0
        ora zp_raster_scroll_x              ; add horizontal scroll value

        ldx #$ed
_wait_raster_237
        cpx VicRasterValue
        bne _wait_raster_237

        sta VicScreenCtrlReg2               ; update horizontal scroll

        ldx #$f3                            ; (243)
_loop_set_rainbow_colors
        lda rainbow_stripes_colors-$f3+1,x  ; the colors in the Activision rainbow stripes logo
        tay
        lda rainbow_stripes_colors-$f3+0,x  ; the colors in the Activision rainbow stripes logo

_wait_rainbow_raster
        cpx VicRasterValue                  ; wait for raster lines 243, 245, 247, 249
        bne _wait_rainbow_raster

        sta VicBackgroundColor2             ; set color for rainbow stripe
        sty VicBackgroundColor1             ; set color for rainbow stripe
        inx                                 ; proceed to next rainbow raster line
        inx
        cpx #$fa                            ; raster line > 250?
        bcc _loop_set_rainbow_colors        ; no -> set color at next rainbow raster line

        lda VicSpriteToSpriteCol            ; read out sprite to sprite collision register:
        ora zp_collision_scorpion           ; 0: no collision, 1: collision with scorpion
        sta zp_collision_scorpion           ; 0: no collision, 1: collision with scorpion
        cld

        ; musical tune playback

        ldy #$00
        lda (zp_tune_ptr),y                 ; current tune byte
        cmp #END_OF_TUNE                    ; end of tune?
        beq _stop_tune_playback             ; yes -> stop the tunen playback
        dec zp_note_timer                   ; decrement remaining note length
        bne _tune_playback_done

        ; start next note in tune

        lda zp_tune_ptr+0                   ; tune data pointer (lb)
        clc
        adc #$04                            ; increase pointer to next tune event
        sta zp_tune_ptr+0                   ; tune data pointer (lb)
        bcc _skip_tune_ptr_hb
        inc zp_tune_ptr+1                   ; tune data pointer (hb)
_skip_tune_ptr_hb

        lda (zp_tune_ptr),y
        cmp #END_OF_TUNE                    ; end of tune reached?
        beq _stop_tune_playback

        sta SidVoice2FreqLb                 ; tune event byte 0: Voice 2 Freq lb
        iny
        lda (zp_tune_ptr),y
        sta SidVoice3FreqLb                 ; tune event byte 1: Voice 3 Freq lb
        iny
        lda (zp_tune_ptr),y
        sta SidVoice2FreqHb                 ; tune event byte 2: Voice 2 Freq hb
        sta SidVoice3FreqHb                 ;   (still byte2)    Voice 3 Freq hb
        iny
        lda (zp_tune_ptr),y                 ; tune event byte 3: note duration
        cmp #$01                            ; note duration = 1 (minimum duration)?
        beq _set_note_timer                 ; yes -> don't shorten minimum duration notes

        ldy zp_ntsc_pal                     ; else, check whether we play back on PAL machine
        cpy #VIDEO_NTSC
        beq _set_note_timer                 ; NTSC: do not shorten note ->
        sec                                 ; PAL:  shorten note by 1 tick
        sbc #$01

_set_note_timer
        sta zp_note_timer                   ; remaining note length
        ldy #$41                            ; GATE = 1, wave form: PULSE

_stop_tune_playback
        cpy #$00
        bne _set_adsr
        ldy #$08                            ; GATE = 0 (start release phase)

_set_adsr
        sty SidVoice2CtrlReg
        sty SidVoice3CtrlReg

_tune_playback_done
        lda zp_random                       ; calculate the next pseudo random number
        asl
        eor zp_random
        asl
        rol zp_random

        ldx zp_scene_type
        lda zp_objects
        cpx #$05                            ; does room cotain treasure (scene == 5)?
        beq _animate_treasure               ; yes ->
        cpx #$04
        beq _update_screen_saver
        cmp #$06                            ; object == fire or snake?
        bcs _animate_fire_or_snake
        bcc _update_screen_saver
_animate_treasure
        and #$03                            ; treasure type == ring?
        cmp #$03                            ; (either %011 or %111)
        bne _animate_fire_or_snake          ; no ->
        ; animate ring
        lda zp_random                       ; pseudo random number
        ora #$9f
        sta $5087                           ; make the diamond ring sparkle
        lda zp_random                       ; pseudo random number
        ora #$f9
        sta $508a                           ; make the diamond ring sparkle
        bne _update_screen_saver

_animate_fire_or_snake
        lda zp_random                       ; pseudo random number
        and #$01
        sta zp_or_mask
        lda sprite_3_pointer                ; (sprite id: fire or snake)
        and #$fe                            ; animate sprite phase using random number
        ora zp_or_mask
        sta sprite_3_pointer

_update_screen_saver
        inc zp_screen_saver_counter_lb      ; screen blanking counter (lb)
        bne _skip_screen_blanking
        inc zp_screen_saver_counter_hb      ; screen blanking counter (hb)
        bne _skip_screen_blanking

        lda #$0b                            ; text mode, screen OFF, 25 rows, vert scroll: 3
        bne _update_screen_on_off           ; -> turn screen off
_skip_screen_blanking
        jsr read_joystick
        cmp #$1f                            ; any joystick input?
        beq _screen_saver_done              ; no ->
        lda #$00                            ; reset screen blanking counter
        sta zp_screen_saver_counter_hb      ; screen blanking counter (hb)
        sta zp_screen_saver_counter_lb      ; screen blanking counter (lb)
        lda #$1b                            ; text mode, screen on, 25 rows, vert scroll: 3
_update_screen_on_off
        sta VicScreenCtrlReg1               ; set control register #1 ($d011)

_screen_saver_done
        lda #$20                            ; next interrupt at raster line $20 (32)
        sta VicRasterValue
.if DO_BUGFIX == false
        lda #$4c                            ; opcode: jmp
        sta interrupt_raster_32             ; copy protection: prevent running from RAM
.endif
        lda zp_nmi_occurred                 ; 0: no NMI, >0: NMI has been triggered
        beq _nmi_handling_done
        lda #$00
        sta $6a
        jsr read_run_stop_key               ; read keyboard, check for RUN/STOP (C = 1: RUN/STOP pressed)
        bcc _nmi_handling_done
        jmp Cartridge_Start                 ; RUN/STOP RESTORE hit -> restart

_nmi_handling_done
        ldx #$00                            ; next interrupt: pointer offset
        jmp finish_interrupt


l9625
sprite_data_rom_player
        .byte $00,$fc,$00   ; ........######..........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$e8,$00   ; ........###.#...........
        .byte $00,$10,$00   ; ...........#............
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$54,$00   ; .........#.#.#..........
        .byte $00,$54,$00   ; .........#.#.#..........
        .byte $00,$54,$00   ; .........#.#.#..........
        .byte $00,$56,$00   ; .........#.#.##.........
        .byte $00,$24,$00   ; ..........#..#..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3f,$00   ; ..........######........
        .byte $00,$3f,$00   ; ..........######........
        .byte $00,$33,$00   ; ..........##..##........
        .byte $03,$f3,$00   ; ......######..##........
        .byte $03,$03,$00   ; ......##......##........
        .byte $03,$00,$f0   ; ......##........####....
        .byte $00,$00,$c0   ; ................##......
        .byte $00,$00,$00   ; ........................
        .byte $00

l9665
        .byte $00,$fc,$00   ; ........######..........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$e8,$00   ; ........###.#...........
        .byte $00,$10,$00   ; ...........#............
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$16,$00   ; ...........#.##.........
        .byte $00,$16,$00   ; ...........#.##.........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3f,$00   ; ..........######........
        .byte $00,$0f,$c0   ; ............######......
        .byte $00,$0c,$c0   ; ............##..##......
        .byte $00,$ff,$c0   ; ........##########......
        .byte $00,$cc,$00   ; ........##..##..........
        .byte $00,$cc,$00   ; ........##..##..........
        .byte $00,$0c,$00   ; ............##..........
        .byte $00,$0f,$00   ; ............####........
        .byte $00

l96a5
        .byte $00,$fc,$00   ; ........######..........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$e8,$00   ; ........###.#...........
        .byte $00,$10,$00   ; ...........#............
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$54,$00   ; .........#.#.#..........
        .byte $00,$54,$80   ; .........#.#.#..#.......
        .byte $00,$55,$40   ; .........#.#.#.#.#......
        .byte $00,$55,$00   ; .........#.#.#.#........
        .byte $00,$24,$00   ; ..........#..#..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3f,$00   ; ..........######........
        .byte $00,$3f,$c0   ; ..........########......
        .byte $00,$33,$c0   ; ..........##..####......
        .byte $00,$f0,$c0   ; ........####....##......
        .byte $00,$f3,$00   ; ........####..##........
        .byte $00,$c3,$00   ; ........##....##........
        .byte $00,$c0,$c0   ; ........##......##......
        .byte $00,$c0,$00   ; ........##..............
        .byte $00,$30,$00   ; ..........##............
        .byte $00

l96e5
        .byte $00,$fc,$00   ; ........######..........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$e8,$00   ; ........###.#...........
        .byte $00,$10,$00   ; ...........#............
        .byte $00,$14,$80   ; ...........#.#..#.......
        .byte $00,$55,$40   ; .........#.#.#.#.#......
        .byte $01,$55,$00   ; .......#.#.#.#.#........
        .byte $01,$14,$00   ; .......#...#.#..........
        .byte $02,$14,$00   ; ......#....#.#..........
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3f,$00   ; ..........######........
        .byte $00,$ff,$c0   ; ........##########......
        .byte $00,$f3,$c0   ; ........####..####......
        .byte $03,$c0,$c0   ; ......####......##......
        .byte $03,$c0,$c0   ; ......####......##......
        .byte $0f,$00,$f0   ; ....####........####....
        .byte $0c,$00,$00   ; ....##..................
        .byte $0c,$00,$00   ; ....##..................
        .byte $00,$00,$00   ; ........................
        .byte $00

l9725
        .byte $00,$fc,$00   ; ........######..........  ; id: $28, $29
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$e8,$00   ; ........###.#...........
        .byte $00,$10,$80   ; ...........#....#.......
        .byte $00,$15,$40   ; ...........#.#.#.#......
        .byte $00,$55,$00   ; .........#.#.#.#........
        .byte $01,$54,$00   ; .......#.#.#.#..........
        .byte $05,$14,$00   ; .....#.#...#.#..........
        .byte $08,$14,$00   ; ....#......#.#..........
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$3f,$00   ; ..........######........
        .byte $00,$3f,$c0   ; ..........########......
        .byte $0f,$3c,$c0   ; ....####..####..##......
        .byte $03,$f0,$c0   ; ......######....##......
        .byte $00,$f0,$f0   ; ........####....####....
        .byte $00,$00,$00   ; ........................
        .byte $00,$00,$00   ; ........................
        .byte $00,$00,$00   ; ........................
        .byte $00,$00,$00   ; ........................
        .byte $00,$00,$00   ; ........................
        .byte $00

l9765
sprite_player_life
        .byte $00,$fc,$00   ; ........######..........  ; id: $2a, $2b
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$f8,$00   ; ........#####...........
        .byte $00,$e8,$00   ; ........###.#...........
        .byte $00,$10,$00   ; ...........#............
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$14,$80   ; ...........#.#..#.......
        .byte $00,$15,$80   ; ...........#.#.##.......
        .byte $00,$15,$00   ; ...........#.#.#........
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3f,$00   ; ..........######........
        .byte $00,$30,$00   ; ..........##............
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00

l97a5
        .byte $03,$f0,$00   ; ......######............  ; id: $2c, $2d
        .byte $03,$e2,$00   ; ......#####...#.........
        .byte $03,$e1,$00   ; ......#####....#........
        .byte $03,$a1,$00   ; ......###.#....#........
        .byte $00,$41,$00   ; .........#.....#........
        .byte $00,$55,$00   ; .........#.#.#.#........
        .byte $00,$50,$00   ; .........#.#............
        .byte $00,$50,$00   ; .........#.#............
        .byte $00,$50,$00   ; .........#.#............
        .byte $00,$50,$00   ; .........#.#............
        .byte $00,$50,$00   ; .........#.#............
        .byte $00,$f3,$f0   ; ........####..######....
        .byte $00,$ff,$3c   ; ........########..####..
        .byte $00,$ff,$0c   ; ........########....##..
        .byte $00,$3c,$0f   ; ..........####......####
        .byte $00,$00,$00   ; ........................
        .byte $00,$00,$00   ; ........................
        .byte $00,$00,$00   ; ........................
        .byte $00,$00,$00   ; ........................
        .byte $00,$00,$00   ; ........................
        .byte $00,$00,$00   ; ........................
        .byte $00

l97e5
        .byte $00,$3c,$00   ; ..........####..........  ; id: $2e, $2f
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$3c,$00   ; ..........####..........
        .byte $00,$00,$80   ; ................#.......
        .byte $00,$14,$40   ; ...........#.#...#......
        .byte $00,$15,$40   ; ...........#.#.#.#......
        .byte $00,$55,$00   ; .........#.#.#.#........
        .byte $00,$54,$00   ; .........#.#.#..........
        .byte $00,$54,$00   ; .........#.#.#..........
        .byte $00,$14,$00   ; ...........#.#..........
        .byte $00,$3f,$00   ; ..........######........
        .byte $00,$3f,$c0   ; ..........########......
        .byte $00,$33,$c0   ; ..........##..####......
        .byte $00,$30,$c0   ; ..........##....##......
        .byte $00,$33,$c0   ; ..........##..####......
        .byte $00,$33,$00   ; ..........##..##........
        .byte $00,$33,$00   ; ..........##..##........
        .byte $00,$33,$c0   ; ..........##..####......
        .byte $00,$30,$00   ; ..........##............
        .byte $00,$30,$00   ; ..........##............
        .byte $00,$f0,$00   ; ........####............
        .byte $00

sprite_data_rom_others
l9825
        .byte $00,$3c,$81,$00,$80,$ff,$00,$03   ; $32: rolling log
        .byte $80,$f3,$80,$c0,$03,$3f,$80,$c0   ; (phase 0)
        .byte $03,$80,$ff,$80,$c0,$03,$80,$f3
        .byte $80,$c0,$03,$3f,$80,$c0,$03,$80
        .byte $ff,$80,$c0,$03,$80,$c3,$80,$c0
        .byte $03,$3c,$80,$c0,$03,$3c,$80,$c0
        .byte $03,$3c,$80,$c0,$00,$80,$c3,$81
        .byte $00,$3c,$97,$00

        .byte $3c,$81,$00,$80,$ff,$00,$03,$80   ; $33: rolling log
        .byte $cf,$80,$c0,$03,$80,$fc,$80,$c0   ; (phase 1)
        .byte $03,$80,$ff,$80,$c0,$03,$80,$cf
        .byte $80,$c0,$03,$80,$fc,$80,$c0,$03
        .byte $80,$ff,$80,$c0,$03,$80,$c3,$80
        .byte $c0,$03,$3c,$80,$c0,$03,$3c,$80
        .byte $c0,$03,$3c,$80,$c0,$00,$80,$c3
        .byte $81,$00,$3c,$97,$00

        .byte $0c,$81,$00,$0c,$81,$00,$0f,$81   ; $34: fire (phase 0)
        .byte $00,$0f,$81,$00,$3f,$81,$00,$3f
        .byte $81,$00,$3f,$80,$c0,$00,$80,$ff
        .byte $80,$c0,$00,$80,$dd,$80,$c0,$00
        .byte $80,$d7,$81,$00,$34,$81,$00,$80
        .byte $aa,$00,$02,$80,$aa,$80,$80,$0a
        .byte $80,$82,$80,$a0,$0a,$00,$80,$a0
        .byte $93,$00

        .byte $30,$81,$00,$30,$81,$00,$80,$f0   ; $35: fire (phase 1)
        .byte $81,$00,$80,$f0,$81,$00,$80,$fc
        .byte $81,$00,$80,$fc,$00,$03,$80,$fc
        .byte $00,$03,$77,$00,$03,$80,$d7,$81
        .byte $00,$80,$df,$81,$00,$3c,$81,$00
        .byte $80,$aa,$00,$02,$80,$aa,$80,$80
        .byte $0a,$80,$82,$80,$a0,$0a,$00,$80
        .byte $a0,$95,$00

        .byte $0c,$80,$f0,$00,$03,$80,$fc,$81   ; $36: cobra rattler (phase 0)
        .byte $00,$80,$ff,$81,$00,$0f,$81,$00   ; sprite RAM: $4d80
        .byte $0f,$81,$00,$3c,$81,$00,$80,$f0
        .byte $00,$03,$80,$c0,$00,$0f,$80,$fc
        .byte $30,$0a,$80,$a8,$30,$0f,$80,$fc
        .byte $30,$0a,$80,$a8,$30,$0f,$80,$ff
        .byte $80,$c0,$95,$00

        .byte $30,$82,$00,$80,$f0,$00,$03,$80   ; $37: cobra rattler (phase 1)
        .byte $fc,$81,$00,$80,$ff,$81,$00,$0f
        .byte $81,$00,$0f,$81,$00,$3c,$81,$00
        .byte $80,$f0,$00,$03,$80,$c0,$00,$0f
        .byte $80,$fc,$80,$c0,$0a,$80,$a8,$80
        .byte $c0,$0f,$80,$fc,$30,$0a,$80,$a8
        .byte $30,$0f,$80,$ff,$80,$c0,$95,$00

        .byte $80,$e0,$81,$00,$80,$ff,$80,$80   ; $38: crocodile (phase 0)
        .byte $00,$80,$e3,$80,$fe,$38,$03,$80   ; (jaws open)
        .byte $8f,$80,$f8,$00,$0e,$3f,$81,$00
        .byte $3f,$81,$00,$3f,$80,$e3,$80,$8e
        .byte $3f,$82,$ff,$7f,$81,$ff,$ab,$00

        .byte $01,$80,$c0,$00,$01,$80,$f8,$82   ; $39: crocodile (phase 1)
        .byte $ff,$1c,$71,$80,$ff,$80,$e3,$80   ; (jaws closed)
        .byte $8e,$3f,$82,$ff,$7f,$81,$ff,$a4
        .byte $00

        .byte $07,$80,$f8,$00,$3f,$14,$00,$38   ; $3a: scorpion right
        .byte $1c,$00,$38,$00,$80,$e0,$3f,$07   ; (phase 0)
        .byte $00,$0f,$80,$f0,$80,$e0,$07,$80
        .byte $f8,$81,$00,$80,$ff,$81,$00,$60
        .byte $80,$f0,$03,$80,$9c,$78,$9e,$00

        .byte $03,$80,$f8,$00,$0f,$06,$00,$3c   ; $3b: scorpion right
        .byte $18,$00,$38,$81,$00,$3c,$00,$80   ; (phase 0)
        .byte $e0,$3e,$03,$80,$c0,$0f,$80,$fc
        .byte $00,$07,$80,$fc,$81,$00,$80,$ff
        .byte $80,$9c,$81,$00,$60,$07,$03,$80
        .byte $bc,$a2,$00

        .byte $1f,$80,$e0,$00,$30,$80,$fc,$00   ; $3c: scorpion left
        .byte $38,$1c,$07,$00,$1c,$00,$80,$e0   ; (phase 0)
        .byte $80,$fc,$07,$0f,$80,$f0,$00,$1f
        .byte $80,$e0,$00,$80,$ff,$00,$0f,$06
        .byte $00,$1e,$39,$80,$c0,$9f,$00

        .byte $1f,$80,$c0,$00,$60,$80,$f0,$00   ; $3d: scorpion left
        .byte $18,$3c,$81,$00,$1c,$07,$00,$3c   ; (phase 1)
        .byte $03,$80,$c0,$7c,$00,$3f,$80,$f0
        .byte $00,$3f,$80,$e0,$39,$80,$ff,$00
        .byte $06,$81,$00,$3d,$80,$c0,$80,$e0
        .byte $9e,$00

        .byte $01,$45,$81,$00,$54,$81,$00,$10   ; $3e: money bag
        .byte $81,$00,$54,$00,$01,$65,$00,$05   ; (phase 0)
        .byte $65,$40,$05,$80,$a9,$40,$15,$80
        .byte $95,$50,$15,$80,$a9,$50,$15,$59
        .byte $50,$15,$80,$a9,$50,$15,$65,$50
        .byte $05,$65,$40,$01,$55,$96,$00

        .byte $01,$45,$81,$00,$54,$81,$00,$10   ; $3f: money bag
        .byte $81,$00,$54,$00,$01,$55,$00,$05   ; (phase 1)
        .byte $55,$40,$05,$55,$40,$15,$55,$50
        .byte $15,$55,$50,$15,$55,$50,$15,$55
        .byte $50,$15,$55,$50,$05,$55,$40,$01
        .byte $55,$97,$00

        .byte $30,$83,$00,$03,$33,$84,$00,$80   ; $40: gold/silver bar
        .byte $cc,$8a,$00,$80,$aa,$80,$a0,$02   ; (phase 0)
        .byte $80,$aa,$80,$a0,$0a,$80,$aa,$80
        .byte $a0,$2a,$80,$aa,$80,$a0,$2a,$80
        .byte $aa,$80,$80,$2a,$80,$aa,$00,$2a
        .byte $80,$a8,$94,$00

        .byte $30,$83,$00,$0c,$30,$80,$c0,$82   ; $41: gold/silver bar
        .byte $00,$03,$33,$84,$00,$30,$84,$00   ; (phase 1)
        .byte $80,$aa,$80,$a0,$02,$80,$aa,$80
        .byte $a0,$0a,$80,$aa,$80,$a0,$2a,$80
        .byte $aa,$80,$a0,$2a,$80,$aa,$80,$80
        .byte $2a,$80,$aa,$00,$2a,$80,$a8,$99
        .byte $00

        .byte $03,$80,$ff,$00,$0b,$80,$ff,$80   ; $42: diamond ring
        .byte $80,$02,$80,$fe,$81,$00,$80,$a8
        .byte $00,$81,$02,$00,$08,$00,$80,$80
        .byte $08,$00,$80,$80,$08,$00,$80,$80
        .byte $81,$02,$81,$00,$80,$a8,$81,$00
        .byte $20,$98,$00

        .byte $ff                               ; end of RLE encoded block


charset_data_rom
l9b47                                   ; Character set (RLE encoded)
                                            ; destination: $6000

        .byte $87,$00                           ; $00: solid color 0

        .byte $87,$55                           ; $01: solid color 1

        .byte $87,$aa                           ; $02: solid color 2 (yellow jungle floor)

        .byte $87,$ff                           ; $03: solid color 3 (green background between tree trunks)

        .byte $55,$80,$aa,$55,$2a,$51,$80,$aa   ; $04
        .byte $45,$80,$82

        .byte $55,$80,$aa,$51,$80,$8a,$55,$80   ; $05
        .byte $a2,$50,$00

        .byte $55,$80,$aa,$54,$80,$aa,$51,$80   ; $06
        .byte $82,$81,$00

        .byte $55,$80,$a2,$51,$2a,$41,$80,$80   ; $07
        .byte $81,$00

        .byte $55,$80,$a2,$55,$80,$a2,$40,$82   ; $08
        .byte $00

        .byte $55,$80,$a2,$55,$08,$83,$00       ; $09

        .byte $54,$80,$aa,$14,$84,$00           ; $0a

        .byte $45,$80,$8a,$85,$00               ; $0b

        .byte $55,$80,$a8,$55,$80,$8a,$41,$80   ; $0c
        .byte $a8,$55,$80,$aa

        .byte $55,$2a,$55,$80,$a2,$45,$0a,$55   ; $0d
        .byte $80,$8a

        .byte $45,$80,$a8,$55,$80,$8a,$45,$28   ; $0e
        .byte $55,$80,$8a

        .byte $55,$80,$aa,$55,$80,$82,$10,$28   ; $0f
        .byte $55,$80,$aa

        .byte $80,$a0,$8d,$aa                   ; $10

        .byte $80,$a0                           ; $11

        .byte $00,$80,$a0,$8b,$aa               ; $12

        .byte $80,$a0,$82,$00                   ; $13

        .byte $8b,$aa                           ; $14

        .byte $84,$00                           ; $15

        .byte $89,$aa                           ; $16

        .byte $86,$00                           ; $17

        .byte $87,$aa                           ; $18

        .byte $83,$00                           ; $19

        .byte $81,$15,$81,$00,$81,$15,$81,$00   ; $1a: CHAR_LADDER_LEFT

        .byte $81,$54,$81,$00,$81,$54,$81,$00   ; $1b: CHAR_LADDER_RIGHT

        .byte $81,$ba,$80,$ff,$82,$ae,$80,$ff   ; $1c: CHAR_BRICK_WALL
        .byte $80,$ba

        .byte $88,$55                           ; $1d: solid color 1

        .byte $80,$aa,$55,$80,$aa,$55,$80,$aa   ; $1e
        .byte $55,$81,$aa

        .byte $55,$80,$aa,$55,$80,$aa,$55,$80   ; $1f
        .byte $aa,$55

        .byte $84,$aa,$85,$00                   ; $20

        .byte $89,$aa                           ; $21

        .byte $85,$2a                           ; $22

        .byte $89,$aa                           ; $23

        .byte $85,$a8                           ; $24

        .byte $84,$aa                           ; $25

        .byte $87,$3f                           ; $26

        .byte $87,$fc                           ; $27

        .byte $84,$00,$85,$aa                   ; $28

        .byte $85,$00                           ; $29

        .byte $0a,$8b,$aa                       ; $2a

        .byte $0a,$00                           ; $2b

        .byte $0a,$8d,$aa                       ; $2c

        .byte $0a                               ; $2d

        .byte $85,$fe,$81,$ff                   ; $2e

        .byte $01,$86,$00                       ; $2f

        .byte $80,$c0,$80,$e0,$40,$84,$00       ; $30

        .byte $81,$3f,$7f,$84,$ff               ; $31

        .byte $80,$fc,$81,$fe,$84,$ff           ; $32

        .byte $01,$86,$00                       ; $33

        .byte $82,$ff,$7f,$3e,$18,$81,$00       ; $34

        .byte $80,$e0,$80,$80,$85,$00           ; $35

        .byte $0f,$1f,$3f,$82,$7f,$81,$ff       ; $36

        .byte $81,$fe,$85,$ff                   ; $37

        .byte $97,$00                           ; $38 (empty)

                                                ; $39 (empty)

                                                ; $3a (empty)

        .byte $85,$7f,$81,$ff                   ; $3b

        .byte $80,$aa,$55,$80,$aa,$55,$80,$aa   ; $3c (Activision rainbow flag character)
        .byte $55,$80,$aa,$55

        .byte $80,$ab,$5f,$80,$ac,$5c,$80,$bf   ; $3d (Activision: A)
        .byte $70,$80,$e0,$80,$c0

        .byte $81,$e0,$60,$63,$83,$e3           ; $3e (Activision: Ac)

        .byte $80,$ff,$81,$00,$80,$fc,$82,$c0   ; $3f (Activision: c)
        .byte $80,$fc

        .byte $80,$ff,$81,$e0,$84,$e3           ; $40 (Activision: ti)

        .byte $80,$fc,$81,$0c,$81,$8c,$81,$8f   ; $41 (Activision: iv)
        .byte $80,$8e

        .byte $0f,$18,$30,$63,$80,$c3,$80,$83   ; $42 (Activision: vi)
        .byte $81,$03

        .byte $80,$ff,$81,$00,$80,$9f,$80,$98   ; $42 (Activision: is)
        .byte $80,$9f,$80,$80,$80,$9f

        .byte $80,$ff,$81,$00,$80,$e7,$07,$80   ; $43 (Activision: si)
        .byte $e7,$67,$80,$e7

        .byte $82,$00,$3f,$82,$33,$3f           ; $44 (Activision: o)

        .byte $82,$00,$38,$3c,$36,$33,$31       ; $45 (Activision: n)

        .byte $82,$00,$84,$c0                   ; $46 (Activision: n)

        .byte $80,$fc,$82,$30,$83,$00           ; $46 (Trademark: T)

        .byte $80,$ff,$82,$db,$83,$00           ; $46 (Trademark: M) RAM: $6284

        .byte $ff                               ; end of RLE encoded block


small_branch_pattern_char_start               ; F256
        .byte $e0
        .byte $e5
        .byte $ea
        .byte $ef

big_branch_pattern_char_start               ; F256
        .byte 0
        .byte 5
        .byte 10
        .byte 15

l9ce3
branch_pattern_char_def_0
        .byte $ff   ; ########
        .byte $c2   ; ##....#.
        .byte $e0   ; ###.....
        .byte $f0   ; ####....
        .byte $f8   ; #####...
        .byte $f8   ; #####...
        .byte $f8   ; #####...
        .byte $fc   ; ######..

        .byte $1f   ; ...#####
        .byte $3a   ; ..###.#.
        .byte $10   ; ...#....
        .byte $00   ; ........
        .byte $07   ; .....###
        .byte $03   ; ......##
        .byte $07   ; .....###
        .byte $03   ; ......##

        .byte $ff   ; ########
        .byte $e3   ; ###...##
        .byte $71   ; .###...#
        .byte $e0   ; ###.....
        .byte $f1   ; ####...#
        .byte $f8   ; #####...
        .byte $f0   ; ####....
        .byte $e0   ; ###.....

        .byte $fd   ; ######.#
        .byte $e8   ; ###.#...
        .byte $c1   ; ##.....#
        .byte $e1   ; ###....#
        .byte $07   ; .....###
        .byte $0f   ; ....####
        .byte $1f   ; ...#####
        .byte $3f   ; ..######

        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########

l9d0b
branch_pattern_char_def_1
        .byte $f8   ; #####...
        .byte $fc   ; ######..
        .byte $fe   ; #######.
        .byte $fc   ; ######..
        .byte $fe   ; #######.
        .byte $fe   ; #######.
        .byte $ff   ; ########
        .byte $ff   ; ########

        .byte $66   ; .##..##.
        .byte $44   ; .#...#..
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........

        .byte $e3   ; ###...##
        .byte $11   ; ...#...#
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........

        .byte $ff   ; ########
        .byte $1f   ; ...#####
        .byte $7f   ; .#######
        .byte $7f   ; .#######
        .byte $7f   ; .#######
        .byte $7f   ; .#######
        .byte $7f   ; .#######
        .byte $ff   ; ########

        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########

l9d33
branch_pattern_char_def_2
        .byte $e3   ; ###...##
        .byte $f0   ; ####....
        .byte $f0   ; ####....
        .byte $f8   ; #####...
        .byte $98   ; #..##...
        .byte $cc   ; ##..##..
        .byte $e0   ; ###.....
        .byte $f0   ; ####....

        .byte $e7   ; ###..###
        .byte $f3   ; ####..##
        .byte $78   ; .####...
        .byte $30   ; ..##....
        .byte $01   ; .......#
        .byte $03   ; ......##
        .byte $03   ; ......##
        .byte $01   ; .......#

        .byte $ff   ; ########
        .byte $1f   ; ...#####
        .byte $7f   ; .#######
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########
        .byte $ff   ; ########

        .byte $fe   ; #######.
        .byte $e4   ; ###..#..
        .byte $f0   ; ####....
        .byte $f9   ; #####..#
        .byte $f8   ; #####...
        .byte $f8   ; #####...
        .byte $f0   ; ####....
        .byte $f0   ; ####....

        .byte $78   ; .####...
        .byte $f1   ; ####...#
        .byte $c3   ; ##....##
        .byte $83   ; #.....##
        .byte $07   ; .....###
        .byte $0c   ; ....##..
        .byte $00   ; ........
        .byte $01   ; .......#

l9d5b
branch_pattern_char_def_3
        .byte $f1   ; ####...#
        .byte $f8   ; #####...
        .byte $fc   ; ######..
        .byte $fc   ; ######..
        .byte $fc   ; ######..
        .byte $fc   ; ######..
        .byte $fe   ; #######.
        .byte $fe   ; #######.

        .byte $cf   ; ##..####
        .byte $67   ; .##..###
        .byte $03   ; ......##
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........

        .byte $ff   ; ########
        .byte $3c   ; ..####..
        .byte $98   ; #..##...
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........

        .byte $3c   ; ..####..
        .byte $70   ; .###....
        .byte $60   ; .##.....
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........
        .byte $00   ; ........

        .byte $07   ; .....###
        .byte $0f   ; ....####
        .byte $1f   ; ...#####
        .byte $1f   ; ...#####
        .byte $3f   ; ..######
        .byte $3f   ; ..######
        .byte $3f   ; ..######
        .byte $3f   ; ..######

l9d83
branch_pattern_char_ptrs
        .word branch_pattern_char_def_0     ; tree 0
        .word branch_pattern_char_def_1     ; tree 1
        .word branch_pattern_char_def_2     ; tree 2
        .word branch_pattern_char_def_3     ; tree 3

l9d8b
branch_screen_mem_patterns
;        .byte $2e,$2f,$30,$31,$03           ; tree branch pattern 0
;        .byte $03,$00,$00,$03,$03           ; tree branch pattern 1
;        .byte $32,$33,$34,$35,$36           ; tree branch pattern 2
;        .byte $37,$38,$39,$3a,$3b           ; tree branch pattern 3
        .byte $2e,$2f,$30,$31,$4a           ; tree branch pattern 0
        .byte $4a,$4b,$4b,$4a,$4a           ; tree branch pattern 1
        .byte $32,$33,$34,$35,$36           ; tree branch pattern 2
        .byte $37,$38,$39,$3a,$3b           ; tree branch pattern 3

l9d9f
branch_chardef_shadow_ptrs
        l9da0 = * + 1
        .word $2000
        .word $2050
        .word $20a0
        .word $20f0

col_tree_offset_table
        .byte 0,10,20,30


l9dbb
objects_x_pos_table
        ; datagram: log0 xpos(2), log1 xpos(2), log2 xpos(2), ignored (2)
        .byte $0e,$01,$00,$00,$00,$00,$00,$00
        .byte $0e,$01,$e6,$00,$00,$00,$00,$00
        .byte $0e,$01,$56,$01,$00,$00,$00,$00
        .byte $0e,$01,$56,$01,$36,$00,$00,$00
        .byte $1e,$01,$00,$00,$00,$00,$00,$00
        .byte $1e,$01,$36,$00,$00,$00,$00,$00
        .byte $1e,$01,$00,$00,$00,$00,$00,$00
        .byte $1e,$01,$00,$00,$00,$00

l9df9
number_logs_table
        .byte $01,$02,$02,$03,$01,$02,$01,$01

pixel_mask_for_x_pos
treasure_bit_mask
l9e01
        .byte $80,$40,$20,$10,$08,$04,$02,$01

l9e09
object_sprite_id_table
        .byte SPRITE_ID_ROLLING_LOG_0
        .byte SPRITE_ID_ROLLING_LOG_0
        .byte SPRITE_ID_ROLLING_LOG_0
        .byte SPRITE_ID_ROLLING_LOG_0
        .byte SPRITE_ID_ROLLING_LOG_0
        .byte SPRITE_ID_ROLLING_LOG_0
        .byte SPRITE_ID_FIRE_0
        .byte SPRITE_ID_SNAKE_0

l9e11
object_color_table
        .byte COLOR_BROWN                   ; rolling log (one)
        .byte COLOR_BROWN                   ; rolling log (two)
        .byte COLOR_BROWN                   ; rolling log (two)
        .byte COLOR_BROWN                   ; rolling log (three)
        .byte COLOR_BROWN                   ; stationary log (one)
        .byte COLOR_BROWN                   ; stationary log (three)
        .byte COLOR_RED                     ; fire
        .byte COLOR_DARKGREY                ; snake

l9e19
treasure_sprite_id_table
        .byte SPRITE_ID_MONEY_BAG
        .byte SPRITE_ID_GOLD_SILVER_BAR
        .byte SPRITE_ID_GOLD_SILVER_BAR
        .byte SPRITE_ID_DIAMOND_RING

l9e1d
treasure_color_table
        .byte COLOR_WHITE                   ; money
        .byte COLOR_DARKGREY                ; silver
        .byte COLOR_BROWN                   ; gold
        .byte COLOR_RED                     ; ring

quicksand_data_rom                      ; compressed screen data for pits
l9e21
        .byte     $af,$02,$11,$13,$2b,$2d,$8f,$02,$10,$12,$2a,$2c,$8d,$02,$11
        .byte $13,$15,$81,$17,$15,$2b,$2d,$8b,$02,$10,$12,$14,$81,$16,$14,$2a
        .byte $2c,$8a,$02,$11,$13,$15,$83,$17,$15,$2b,$2d,$89,$02,$10,$12,$14
        .byte $83,$16,$14,$2a,$2c,$87,$02,$11,$13,$15,$82,$17,$81,$19,$82,$17
        .byte $15,$2b,$2d,$85,$02,$10,$12,$14,$82,$16,$81,$18,$82,$16,$14,$2a
        .byte $2c,$84,$02,$11,$13,$15,$82,$17,$83,$19,$82,$17,$15,$2b,$2d,$83
        .byte $02,$10,$12,$14,$82,$16,$83,$18,$82,$16,$14,$2a,$2c,$81,$02,$11
        .byte $13,$15,$82,$17,$82,$19,$81,$29,$82,$19,$82,$17,$15,$2b,$2d,$10
        .byte $12,$14,$82,$16,$82,$18,$81,$28,$82,$18,$82,$16,$14,$2a,$2c,$ff

quicksand_char_data_ptr
        .word quicksand_screen_data+$00     ; 0: closed
        .word quicksand_screen_data+$28     ; 1: partially open
        .word quicksand_screen_data+$50     ; 2: partially open
        .word quicksand_screen_data+$78     ; 3: partially open
        .word quicksand_screen_data+$a0     ; 4: partially open
        .word quicksand_screen_data+$c8     ; 5: partially open
        .word quicksand_screen_data+$f0     ; 6: open

sprite_field_data_col_ptr
l9ebe
        .word $0800,$0801,$0802             ; swinging vine, sprite 1, column 0-2
        .word $08c0,$08c1,$08c2             ; swinging vine, sprite 2, column 3-5
        .word $0980,$0981,$0982             ; swinging vine, sprite 6, column 6-8
        .word $0a40,$0a41,$0a42             ; swinging vine, sprite 7, column 9-11

harry_run_animation_sprite_id
        .byte $20,$22,$24,$26,$28

jump_y_delta_table
l9edb
        .byte $01,$01,$01,$01,$01,$01,$01,$00
        .byte $01,$00,$00,$01,$00,$00,$00,$01
        .byte $00,$00,$00,$00,$ff,$00,$00,$00
        .byte $ff,$00,$00,$ff,$00,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$ff

raster_interrupt_entry_table
l9eff
        l9f00 = * + 1
        .word interrupt_raster_32   ; x = 0
        .word interrupt_raster_80   ; x = 2
        .word interrupt_raster_162  ; x = 4
        .word interrupt_raster_171  ; x = 6
        .word interrupt_raster_234  ; x = 8

quicksand_left_x_pos
l9f09
        .byte $a2,$92,$8a,$7a,$72,$5f

quicksand_right_x_pos
l9f0f
        .byte $ba,$ca,$d2,$e2,$ea,$fa


        ; Tune data
        ;
        ; each tune consists of a sequence of events
        ; each event contains 4 bytes:
        ;   byte 0: Voice 2 Freq lb
        ;   byte 1: Voice 3 Freq lb
        ;   byte 2: both Voice 2 and Voice 3 Freq hb
        ;   byte 3: note duration
        ; the tune ends with an end of tune marker $ff

tune_data_tarzan
l9f15
        .byte $32,$1e,$0d,$20
        .byte $32,$00,$1b,$04
        .byte $32,$00,$16,$30
        .byte $32,$00,$1b,$05
        .byte $32,$00,$16,$05
        .byte $32,$00,$1b,$05
        .byte $32,$00,$16,$18
tune_silence
        .byte $ff                           ; end of tune

tune_data_treasure
l9f32
        .byte $00,$00,$09,$20
        .byte $00,$00,$0a,$07
        .byte $96,$96,$0a,$10
        .byte $00,$00,$09,$10
        .byte $96,$96,$0c,$04
        .byte $00,$00,$0c,$04
        .byte $96,$96,$0c,$04
        .byte $00,$00,$0c,$04
        .byte $96,$96,$0c,$04
        .byte $00,$00,$0c,$04
        .byte $96,$96,$0c,$04
        .byte $00,$00,$0c,$04
        .byte $96,$96,$0c,$04
        .byte $00,$00,$0c,$04
        .byte $96,$96,$0c,$04
        .byte $ff                           ; end of tune

tune_data_death
l9f6f
        .byte $c3,$f0,$10,$07
        .byte $1f,$80,$15,$07
        .byte $1e,$80,$19,$07
        .byte $87,$f0,$21,$0c
        .byte $31,$b0,$1c,$07
        .byte $87,$f0,$21,$10
        .byte $ff                           ; end of tune

tune_data_run_over_by_log
l9f88
        .byte $00,$1f,$0b,$05
        .byte $00,$1f,$11,$04
        .byte $00,$1f,$0e,$04
        .byte $00,$1f,$11,$03
        .byte $00,$1f,$0e,$03
        .byte $00,$1f,$11,$02
        .byte $00,$1f,$0e,$02
        .byte $00,$1f,$11,$01
        .byte $00,$1f,$0e,$01
        .byte $ff                           ; end of tune

tune_start_table
l9fad
        .word tune_data_tarzan-4
        .word tune_data_treasure-4
        .word tune_data_death-4
        .word tune_data_run_over_by_log-4


l9fb5
video_standard_dep_vars_table
        .byte $08,$18                       ; multi color mode: NTSC - off, PAL - on
        .byte COLOR_GREEN,COLOR_DARKGREY    ; zp_color_ram
        .byte COLOR_BROWN,COLOR_BROWN       ; zp_vic_background_color_0

l9fbb
rainbow_stripes_colors                  ; the colors in the Activision rainbow stripes logo
        .byte COLOR_RED,COLOR_RED
        .byte COLOR_YELLOW,COLOR_YELLOW
        .byte COLOR_GREEN,COLOR_GREEN
        .byte COLOR_BLUE,COLOR_BLUE

l9fc3:
.enc "none"
        .text "BY: Peter Filiberti 4/1/84"
        .text "Applied Computer Technology."
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff


quicksand_screen_data
        .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
        .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

        .byte $02,$02,$02,$02,$02,$02,$02,$02,$11,$13,$2b,$2d,$02,$02,$02,$02,$02,$02,$02,$02
        .byte $02,$02,$02,$02,$02,$02,$02,$02,$10,$12,$2a,$2c,$02,$02,$02,$02,$02,$02,$02,$02

        .byte $02,$02,$02,$02,$02,$02,$11,$13,$15,$17,$17,$15,$2b,$2d,$02,$02,$02,$02,$02,$02
        .byte $02,$02,$02,$02,$02,$02,$10,$12,$14,$16,$16,$14,$2a,$2c,$02,$02,$02,$02,$02,$02

        .byte $02,$02,$02,$02,$02,$11,$13,$15,$17,$17,$17,$17,$15,$2b,$2d,$02,$02,$02,$02,$02
        .byte $02,$02,$02,$02,$02,$10,$12,$14,$16,$16,$16,$16,$14,$2a,$2c,$02,$02,$02,$02,$02

        .byte $02,$02,$02,$11,$13,$15,$17,$17,$17,$19,$19,$17,$17,$17,$15,$2b,$2d,$02,$02,$02
        .byte $02,$02,$02,$10,$12,$14,$16,$16,$16,$18,$18,$16,$16,$16,$14,$2a,$2c,$02,$02,$02

        .byte $02,$02,$11,$13,$15,$17,$17,$17,$19,$19,$19,$19,$17,$17,$17,$15,$2b,$2d,$02,$02
        .byte $02,$02,$10,$12,$14,$16,$16,$16,$18,$18,$18,$18,$16,$16,$16,$14,$2a,$2c,$02,$02

        .byte $11,$13,$15,$17,$17,$17,$19,$19,$19,$29,$29,$19,$19,$19,$17,$17,$17,$15,$2b,$2d
        .byte $10,$12,$14,$16,$16,$16,$18,$18,$18,$28,$28,$18,$18,$18,$16,$16,$16,$14,$2a,$2c

jungle_transition_chars
        .fill 40,$00

jungle_grass_chars
        .fill 40,$00
