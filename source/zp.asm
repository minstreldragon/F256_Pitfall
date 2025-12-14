; F256 specific

; kernel structures

event   .dstruct    kernel.event.event_t

zpSrcPtr
        .word ?                         ; a pointer to data to read
zpDstPtr
        .word ?                         ; a pointer to data to write

zpBufferPtr                             ; read / write buffer
        .word ?

zpFileSize                              ; File size (to save)
        .word ?

zp_row                                  ; tile output row
        .byte ?

zp_column                               ; tile output column
        .byte ?

zp_ntsc_pal                             ; NTSC: $3b, PAL: $31
        .byte ?

zp_initialized                          ; 0: cold start, 1: game initialized, restart
        .byte ?

zp_lives                                ; # of lives left, including current
        .byte ?

zp_room                                 ; current room
        .byte ?

zp_random                               ; pseudo random number (used for object animation)
        .byte ?

zp_player_jumping                       ; 0: not jumping, 1: currently jumping
        .byte ?

zp_background_col_0                     ; VIC background color 0 (pit color)
        .byte ?

zp_vine_y_delta                         ; swinging vine delta y position relative to anchor
        .byte ?

zp_vine_swing_side                      ; 0: vine swings on right side, 1: left side
        .byte ?

zp_vine_x_delta_absolute                ; swinging vine delta x position relative to middle
        .byte ?

zp_vine_delay                           ; 0: don't delay, 1: delay swinging vine
        .byte ?

zp_vine_swing_direction                 ; 0: outward, 1: inward
        .byte ?

zp_room_has_vine
        .byte ?

zp_player_x_pos                         ; player x position (2)
        .word ?

zp_player_y_pos
        .byte ?

zp_player_run_animation                 ; Harry running animation phase (0-4)
        .byte ?

zp_treasure_x_pos                       ; treasure x position (2)
zp_log_0_x_pos                          ; rolling log 0 x position (2)
zp_croc_0_x_pos                         ; crocodile 0 x position (2)
        .word ?

zp_log_1_x_pos                          ; rolling log 1 x position (2)
zp_croc_1_x_pos                         ; crocodile 1 x position (2)
        .word ?

zp_log_2_x_pos                          ; rolling log 2 x position (2)
zp_croc_2_x_pos                         ; crocodile 2 x position (2)
        .word ?

zp_treasure_y_pos                       ; treasure y position
zp_log_0_y_pos                          ; rolling log 0 y position
zp_croc_0_y_pos                         ; crocodile 0 y position
        .byte ?

zp_log_1_y_pos                          ; rolling log 1 y position
zp_croc_1_y_pos                         ; crocodile 1 y position
        .byte ?

zp_log_2_y_pos                          ; rolling log 2 y position
zp_croc_2_y_pos                         ; crocodile 2 y position
        .byte ?

zp_scorpion_x_pos                       ; scorpion x position (2)
        .word ?

zp_scorpion_sprite_id
        .byte ?

zp_player_stunned                       ; >0: Harry is stunned by a rolling log
        .byte ?

zp_at_ladder                            ; >0: Harry is climbing the ladder
        .byte ?

zp_at_vine                              ; >0: Harry has grabbed the swinging vine
        .byte ?

zp_jump_index                           ; 0: not jumping, >0: jump index, counting up
        .byte ?

zp_player_orientation                   ; player orientation: 0: facing right, 1: facing left
        .byte ?

zp_not_directional_jump                 ; 0: directional jump or swinging, >0: otherwise
        .byte ?

zp_screen_saver_counter_hb              ; screen blanking counter (hb)
        .byte ?

zp_screen_saver_counter_lb              ; screen blanking counter (lb)
        .byte ?

zp_crocodile_timer                      ; crocodile timer (open/close jaws) (0..$28)
        .byte ?

zp_score                                ; score (BCD 3)
zp_score_10000
        .byte ?

zp_score_100
        .byte ?

zp_score_1
        .byte ?

zp_minutes
        .byte ?

zp_seconds
        .byte ?

zp_frame_counter                        ; counts down number of frames in a second
        .byte ?

zp_treasure_uncollected                 ; >=0: uncollected treasure objects, -1: all collected
        .byte ?

zp_treasure_collected_flags             ; each bit: 1 = treasure not collected (4)
        .byte ?
        .byte ?
        .byte ?
        .byte ?

zp_src                                  ; source pointer (2) ($36)
zp_dst2                                 ; destination pointer (alternative) (2)
zp_score_var_index                      ; index into score variable
zp_delay                                ; delay loop variable
zp_iterator_1 = $36
zp_sound_pitch_abs_value                ; sound pitch (absolute)
zp_or_mask2
zp_tree_column                          ; screen mem column for current tree trunk
zp_factor_1                             ; factor 1 in multiplication
        .byte ?

zp_factor_2                             ; factor 2 in multiplication ($37)
zp_score_index                          ; index for score/time digits
zp_debounce_counter                     ; debounce counter for keyboard
zp_sprite_data_index                    ; index into sprite data
zp_tree_pattern_offset                  ; offset of tree branch pattern
        .byte ?

zp_dst                                  ; destination pointer (2) ($38)
zp_src2                                 ; source pointer (alternative) (2)
zp_wall_pos                             ; wall position
zp_iterator_0
zp_vine_x
        .byte ?

zp_tree_index2                          ; 0..3 ($39)
        .byte ?

zp_leaves_layout                        ; randomized layout of the tree leaves
        .byte ?

zp_score_print_zero                     ; 0: pad zero with blank, 1: print actual zero
        .byte ?

zp_objects                              ; bits 0-2 of room
        .byte ?

zp_scene_type                           ; bits 3-5 of room
        .byte ?

zp_tree_transition_char                 ; character in tree transition line ($3e)
zp_tree_index                           ; 0..3
zp_tree_position                        ; horizontal position of tree
        .byte ?

zp_trees_layout                         ; randomized layout of the tree trunks, branches etc.
        .byte ?

zp_tree_offset                          ; horizontal offset of tree from default position
        .byte ?


zp_quicksand_direction                  ; 0: pit is opening, 1: pit is closing
        .byte ?

zp_quicksand_state                      ; 0: closed, 2-5 partially open, 6: open
        .byte ?

zp_quicksand_timer                      ; timer for keeping pit open or closed (0..$28)
        .byte ?

zp_or_mask
        .byte ?

zp_vine_dx                              ; dx value
        .byte ?

zp_player_x_pos_delta                   ; delta value to be added to or subtracted from zp_player_x_pos
        .byte ?

zp_log_bounce_counter                   ; counter for bouncing rolling logs (0..4)
        .byte ?

zp_product_lb                           ; multiplication product (lb)
        .byte ?

zp_divisor                              ; divisor in division
        .byte ?

zp_temp_x                               ; temporary backup of x register
zp_temp_y                               ; temporary backup of y register
zp_temp1
        .byte ?

zp_vine_y                               ; temporary: y pos within vine
zp_mirrored_byte                        ; temporary: mirrored mc byte
zp_temp2
        .byte ?

zp_vine_change_direction                ; 0: don't change direction, 1: vine changes direction
        .byte ?

zp_collision_surface                    ; sprite-to-sprite collisions on surface level
        .byte ?

zp_player_fall_counter                  ; 0: player not falling, >0: player falling, counting down from $39
        .byte ?

zp_sound_descending                     ; 0: sound sequence ascending, >=1: descending
        .byte ?

zp_collision_scorpion                   ; 0: no collision, 1: collision with scorpion
        .byte ?

zp_blocked_by_wall                      ; 0: not blocked, >=$80 blocked by wall, bit 1: orientation
        .byte ?

zp_bounce_off_wall                      ; 0: normal jump, >0: Harry just bounced off the wall
        .byte ?

zp_note_timer                           ; remaining note length
        .byte ?

zp_tune_ptr                             ; tune data pointer (2)
        .word ?

zp_sound_falling_counter                ; count down to zero when falling (sound: pitch)
        .byte ?

zp_sound_short_counter                  ; count down to zero for short sound
        .byte ?

zp_sound_short_pitch                    ; pitch for short sound
        .byte ?

zp_move_on_ladder_timer                 ; delay counter for moving on ladder
        .byte ?

zp_sound_jumping_counter                ; count down to zero when jumping (sound: pitch)
        .byte ?

zp_raster_scroll_x                      ; horizontal raster scroll
        .byte ?

zp_text_scroll_index                    ; index to current text scroll character
        .byte ?

zp_text_scroll_delay                    ; text scroll delay
        .byte ?

zp_game_paused                          ; 0: game is not paused, 1: game is paused
        .byte ?


zp_tree_force_middle                    ; 0: allow skipping of tree, 1: draw middle tree
        .byte ?

zp_tree_0_column                        ; $61-$64: start column of tree trunk x
        .byte ?
        .byte ?
        .byte ?
        .byte ?

zp_tree_0_width                         ; $65-$68: width of tree trunk x
        .byte ?
        .byte ?
        .byte ?
        .byte ?

zp_keyboard_read                        ; temporary variable (read_keyboard)
        .byte ?

zp_nmi_occurred                         ; 0: no NMI, >0: NMI has been triggered
        .byte ?

zp_vic_screen_ctrl_reg2
        .byte ?

zp_color_ram
        .byte ?

zp_vic_background_color_0
        .byte ?

zp_end

