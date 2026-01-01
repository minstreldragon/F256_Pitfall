; .include "common/api.asm"
; .include "common/f256jr.asm"
; .include "common/f256_tiles.asm"
; .include "common/f256_rtc.asm"
; .include "constants.h"

        * = $0020                       ; zero page variables

.include "zp.asm"

.include "archdep_f256.h"
.include "archdep.h"

        * = $0300                       ; target address is $0300

.include "pitfall.asm"                  ; actual pitfall game

.include "archdep.asm"                  ; architecture dependent code

;        jsr initF256                    ; initialize F256 hardware
;_loop
;        jmp _loop
