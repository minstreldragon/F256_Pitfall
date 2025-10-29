from PIL import Image, ImageDraw, ImageColor
import inspect
import sys
import math
import vic2

COLOR_BLACK = 0x00
COLOR_WHITE = 0x01
COLOR_RED = 0x02
COLOR_CYAN = 0x03
COLOR_PURPLE = 0x04
COLOR_GREEN = 0x05
COLOR_BLUE = 0x06
COLOR_YELLOW = 0x07
COLOR_ORANGE = 0x08
COLOR_BROWN = 0x09
COLOR_LIGHTRED = 0x0a
COLOR_DARKGREY = 0x0b
COLOR_MIDGREY = 0x0c
COLOR_LIGHTGREEN = 0x0d
COLOR_LIGHTBLUE = 0x0e
COLOR_LIGHTGREY = 0x0f

palette = []

sprite_width = 24
source_height = 21
target_height = 24
n_width = 8
n_height = 5
width = sprite_width * n_width
height = target_height * n_height
sprite_size_c64 = 64

background_color = COLOR_PURPLE

tileColors = [
        0x60,0x50,0x50,0x50,0x80,0x80,0x10,0x10,
        0x20,0x10,0x10,0x10,0x60,0x50,0x50,0x10,
        0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,
        0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x12,
        0x87,0x02,0x16,0x10,0x10,0x10,0x10,0x10,
        0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,
        0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,
        0x10,0x10,0x10,0x10,0x30,0x20,0x10,0x10
        ]

    # pitfall harry (sprite 0) colors:
    # %00: transparent
    # %01: body (light blue / blue) (multi color 1)
    # %10: face (white) (sprite color)
    # %11: hair, pants (black above, brown below) (multi color 2)

    # rolling logs (sprite 3,4) colors: SPRITE_ID_ROLLING_LOG
    # %0: transparent
    # %1: COLOR_BROWN

    # fire (sprite 3,4) colors: SPRITE_ID_ROLLING_LOG
    # %0: transparent
    # %1: COLOR_RED


sprite_colors = [
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $00   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $01   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $02   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $03   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $04   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $05   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $06   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $07   -

    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $08   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $09   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $0a   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $0b   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $0c   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $0d   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $0e   -
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $0f   -

    [ False, background_color, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],    # $08 - rolling log
    [ False, background_color, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],    # $09 - rolling log
    [ True, background_color, COLOR_YELLOW, COLOR_BROWN, COLOR_ORANGE ],    # $0b - fire
    [ True, background_color, COLOR_YELLOW, COLOR_BROWN, COLOR_ORANGE ],    # $0b - fire
    [ False, background_color, COLOR_DARKGREY, COLOR_BLACK, COLOR_BLACK ],    # $0c - snake
    [ False, background_color, COLOR_DARKGREY, COLOR_BLACK, COLOR_BLACK ],    # $0d - snake
    [ False, background_color, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK ],    # $0e - crocodile
    [ False, background_color, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK ],    # $0f - crocodile

    [ False, background_color, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],    # $10 - scorpion right
    [ False, background_color, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],    # $11 - scorpion right
    [ False, background_color, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],    # $12 - scorpion left
    [ False, background_color, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],    # $13 - scorpion left
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $14 - money bag
    [ True, background_color, COLOR_LIGHTBLUE, COLOR_WHITE, COLOR_BLACK ],    # $15 - money bag
    [ True, background_color, COLOR_BLACK, COLOR_BROWN, COLOR_WHITE ],    # $16 - gold brick
    [ True, background_color, COLOR_BLACK, COLOR_BROWN, COLOR_WHITE ],    # $17 - gold brick
    [ True, background_color, COLOR_BLACK, COLOR_RED, COLOR_WHITE ],    # $18 - ring
    [ True, background_color, COLOR_BLACK, COLOR_RED, COLOR_WHITE ],    # $19 - ring
]


char_colors = [
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK ],       # $00
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK, COLOR_BLACK ],
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_LIGHTRED ],   # $02 - surface floor
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_LIGHTRED ],   # $03 - surface earth
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],

    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $10 - shifting pit, lower left
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $11 - shifting pit, upper left
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $12 - shifting pit, lower+1
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $13 - shifting pit, upper+1
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $14 - shifting pit, lower+2
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $15 - shifting pit, upper+2
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $16 - shifting pit, lower+3
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $17 - shifting pit, upper+3
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $18 - shifting pit, lower+4
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],  # $19 - shifting pit, upper+4
    [ True, COLOR_BLACK, COLOR_ORANGE, COLOR_BLACK, COLOR_BLACK ],      # $1a - ladder left
    [ True, COLOR_BLACK, COLOR_ORANGE, COLOR_BLACK, COLOR_BLACK ],      # $1b - ladder right
    [ True, COLOR_GREEN, COLOR_BROWN, COLOR_RED, COLOR_WHITE ],         # $1c - brick wall
    [ True, COLOR_BLACK, COLOR_ORANGE, COLOR_BLACK, COLOR_BLACK ],      # $1d - underground floor
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],      # $1e - tree top background
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],      # $1e - tree top background (unused)

    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],     # $20
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],     # $20
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],     # $22
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],     # $23
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],     # $24
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ],     # $25
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_LIGHTRED ],  # $26
    [ True, COLOR_BLACK, COLOR_BLACK, COLOR_YELLOW, COLOR_LIGHTRED ],  # $27 - upper left
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ], # $28 - shifting pit, lower fully open
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ], # $29 - shifting pit, upper fully open
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ], # $2a - shifting pit, lower right-1
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ], # $2b - shifting pit, upper right-1
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ], # $2c - shifting pit, lower right
    [ True, COLOR_LIGHTBLUE, COLOR_BLACK, COLOR_YELLOW, COLOR_BLACK ], # $2c - shifting pit, upper right
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],

    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],      # $30
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BROWN, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],

    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],      # $40 (font)
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_GREEN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],      # lower jungle transition zone
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],

    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],      # $50
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_GREEN, COLOR_BROWN, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],


    [ False, COLOR_BROWN, COLOR_BLACK, COLOR_RED, COLOR_CYAN ],      # $40 (branch masks)
    [ False, COLOR_BLACK, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK ],      # $41 (font)
]

def convertHiresByte(b, colors):
    """Print a hires byte of C64 bitmap as 8 pixels"""
    pixels = []
    print("Colors:", colors)
    for i in range(8):
        pixel = 1 & (b >> (7-i))
        pixels.append(palette[colors[pixel]])
    return pixels

def convertMcByte(b, colors):
    """Print an MC byte of C64 bitmap as 8 pixels"""
    pixels = []
    print("Colors:", colors)
    for i in range(4):
        pixel = 3 & (b >> (6-2*i))
        pixels.append(palette[colors[pixel]])
        pixels.append(palette[colors[pixel]])
    return pixels

def convertByte(b, bgcol, fgcol):
    """Print a byte of C64 bitmap as 8 pixels"""
    pixels = []
    for i in range(8):
        pixel = 1 & (b >> (7-i))
        pixels.append((bgcol,fgcol)[pixel])
    return pixels

#def drawHiresChar(draw, spriteset, ch, x, y):
#    for py in range(8):
#        px = 0
#        print(spriteset[ch * 8 + py])
#        b = spriteset[ch * 8 + py]
#        for pixel in convertHiresByte(b, char_colors[ch][1:]):
#            draw.point((x+px, y+py), pixel)
#            px += 1

def drawSprite(draw, spriteset, spr, x, y):
    print("Sprite:", spr, "draw", draw, "x", x, "y", y)
    for py in range(source_height):
        px = 0
        for xb in range(3):
            print(spriteset[spr * sprite_size_c64 + py * 3 + xb])
            b = spriteset[spr * sprite_size_c64 + py * 3 + xb]
            colors = sprite_colors[spr][1:]
            is_multicolor = sprite_colors[spr][0]
            pixels = convertHiresByte(b, colors)
            if is_multicolor:
                pixels = convertMcByte(b, colors)
            else:
                pixels = convertHiresByte(b, colors)
            for pixel in pixels:
                draw.point((x+px, y+py), pixel)
                px += 1


def drawChar(draw, spriteset, ch, x, y):
    print("Char:", ch, "draw", draw, "x", x, "y", y)
    #is_multicolor = char_colors[ch][0]
    for py in range(8):
        px = 0
        print(spriteset[ch * 8 + py])
        b = spriteset[ch * 8 + py]
        if ch < 0x60:
            colors = char_colors[ch][1:]
            is_multicolor = char_colors[ch][0]
        elif ch >= 0xe0:
            colors = char_colors[0x60][1:]
            is_multicolor = char_colors[0x60][0]
        else:
            colors = char_colors[0x61][1:]
            is_multicolor = char_colors[0x61][0]
        if not is_multicolor:
            #pixels = convertHiresByte(b, char_colors[ch][1:])
            pixels = convertHiresByte(b, colors)
        else:
            #pixels = convertMcByte(b, char_colors[ch][1:])
            pixels = convertMcByte(b, colors)
        for pixel in pixels:
            draw.point((x+px, y+py), pixel)
            px += 1


    #drawHiresChar(draw, spriteset, ch, x, y)
    #for py in range(8):
    #    px = 0
    #    print(spriteset[ch * 8 + py])
    #    b = spriteset[ch * 8 + py]
    #    for pixel in convertByte(b, col0, col1):
    #        draw.point((x+px, y+py), pixel)
    #        px += 1
    #is_multicolor = char_colors[ch][0]
    #print("Multicolor", is_multicolor)
    #for py in range(8):
    #    px = 0
    #    print(spriteset[ch * 8 + py])
    #    b = spriteset[ch * 8 + py]
    #    for pixel in convertByte(b, col0, col1):
    #        draw.point((x+px, y+py), pixel)
    #        px += 1

def drawTile(draw, tileset, tile, x, y, col0, col1):
    print("Tile:", tile, "draw", draw, "x", x, "y", y, "col0", col0, "col1", col1)
    for py in range(16):
        px = 0
        b = tileset[tile * 2 + py * 128]
        for pixel in convertByte(b, col0, col1):
            draw.point((x+px, y+py), pixel)
            px += 1
        px = 0
        b = tileset[tile * 2 + py * 128 + 1]
        for pixel in convertByte(b, col0, col1):
            draw.point((x+px+8, y+py), pixel)
            px += 1


def mirrorSprite(inspr):
    out = bytearray()
    #out.extend(inspr)
    for y in range(source_height):
        l_triple = inspr[y*3:(y+1)*3]
        for b in range(3):
            inbyte = l_triple[2-b]
            outbyte = 0
            for x in range(4):
                pair = (inbyte >> ((3-x)*2)) & 0x03
                outbyte = outbyte | (pair << (x*2))
            out.append(outbyte)
    out.append(0x00)
    return out


def extendSpriteset(spriteset_org):
    spriteset = bytearray()
    # first, copy and mirror harry sprites
    # second, add all sprites below Harry
    for i in range(8):
        spriteset.extend(spriteset_org[i*64:(i+1)*64])
        spriteset.extend(mirrorSprite(spriteset_org[i*64:(i+1)*64]))
    #spriteset.extend(spriteset_org[0:8*64])
    spriteset.extend(spriteset_org[8*64:])
    return spriteset

if __name__ == '__main__':

    # open and read C64 tile set file
    file = open("sprites", "rb")
    spriteset_org = file.read()
    file.close()

    # create a copy of the sprite data, add flipped versions of Harry sprites
    spriteset = extendSpriteset(spriteset_org)

    # create a blank image
    image = Image.new("RGB", (width, height))

    # get a drawing context
    draw = ImageDraw.Draw(image)

    # create the VIC Palette
    palette = vic2.makePalette()

    # pre-fill background
    draw.rectangle([(0,0),(width-1,height-1)], fill=palette[background_color])

    # calculate number of character definitions
    ndefs = len(spriteset) // sprite_size_c64
    print("ndefs", ndefs)

    # draw sprite set
    for spr in range(ndefs):
        x = (spr % n_width) * sprite_width
        y = (spr // n_width) * target_height
        print("Sprite", spr)
        drawSprite(draw, spriteset, spr, x, y)
    #for tile in range(64):
    #    x = (tile % 8) * 16
    #    y = (tile // 8) * 16
    #    col0 = palette[tileColors[tile] & 0x0f]
    #    col1 = palette[tileColors[tile] // 16]
    #    print("Character", tile)
    #    drawTile(draw, tileset, tile, x, y, col0, col1)

    image.show()
    image.save("pitfall_spriteset.png")

    print(char_colors[1])
