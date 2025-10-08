### Tools ###
AS := 64tass
PGZTOOL := python ../tools/pgztool/pgztool.py
RM := rm

### Tool flags ###
#ASFLAGS := --quiet

### Foenix IDE workaround ###
DEFINES := FOENIX_IDE:=TRUE


phony: pitfall

pitfall: game.bin pitfall_manifest.xml
	$(PGZTOOL) pitfall_manifest.xml

game.bin: game.asm pitfall.asm archdep.h
	$(AS) -D $(DEFINES) -b --m65c02 -L pitfall.listing -o $@ $<

clean:
	-$(RM) pitfall.pgz
	-$(RM) game.bin

