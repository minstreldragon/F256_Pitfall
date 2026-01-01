;
; LCD Display Registers
;

LCD_CMD_CMD     = $dd40 ; write command here
LCD_CMD_DTA     = $dd41 ; write data (for command) here
LCD_PIX_LO      = $dd42 ; {G[2:0], B[4:0]}
LCD_PIX_HI      = $dd43 ; {R[4:0], G[5:3]}
LCD_CTRL_REG    = $dd44


LCD_CMD_CASET = $2a     ; CASET - Column Address Set
LCD_CMD_RASET = $2b     ; RASET - Row Address Set
LCD_CMD_RAMWR = $2c     ; RAMWR - Memory Write
LCD_CMD_MAD = $36       ; MADCTL register, which controls in which direction pixel writing occurs

LCD_IMAGE_WIDTH = 240
LCD_IMAGE_HEIGHT = 280
LCD_IMAGE_BAND = 20
