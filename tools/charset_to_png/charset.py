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

#def drawHiresChar(draw, charset, ch, x, y):
#    for py in range(8):
#        px = 0
#        print(charset[ch * 8 + py])
#        b = charset[ch * 8 + py]
#        for pixel in convertHiresByte(b, char_colors[ch][1:]):
#            draw.point((x+px, y+py), pixel)
#            px += 1

def drawChar(draw, charset, ch, x, y):
    print("Char:", ch, "draw", draw, "x", x, "y", y)
    #is_multicolor = char_colors[ch][0]
    for py in range(8):
        px = 0
        print(charset[ch * 8 + py])
        b = charset[ch * 8 + py]
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


    #drawHiresChar(draw, charset, ch, x, y)
    #for py in range(8):
    #    px = 0
    #    print(charset[ch * 8 + py])
    #    b = charset[ch * 8 + py]
    #    for pixel in convertByte(b, col0, col1):
    #        draw.point((x+px, y+py), pixel)
    #        px += 1
    #is_multicolor = char_colors[ch][0]
    #print("Multicolor", is_multicolor)
    #for py in range(8):
    #    px = 0
    #    print(charset[ch * 8 + py])
    #    b = charset[ch * 8 + py]
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

if __name__ == '__main__':
    width = 8 * 16
    height = 8 * 16

    # open and read C64 tile set file
    file = open("charset", "rb")
    charset = file.read()
    file.close()

    # create a blank image
    image = Image.new("RGB", (width, height))

    # get a drawing context
    draw = ImageDraw.Draw(image)

    # create the VIC Palette
    palette = vic2.makePalette()

    # calculate number of character definitions
    ndefs = len(charset) // 8
    print("ndefs", ndefs)

    # draw character set
    for ch in range(ndefs):
    #for ch in range(0xdb):
        x = (ch % 16) * 8
        y = (ch // 16) * 8
        print("Character", ch)
        drawChar(draw, charset, ch, x, y)
    #for tile in range(64):
    #    x = (tile % 8) * 16
    #    y = (tile // 8) * 16
    #    col0 = palette[tileColors[tile] & 0x0f]
    #    col1 = palette[tileColors[tile] // 16]
    #    print("Character", tile)
    #    drawTile(draw, tileset, tile, x, y, col0, col1)

    image.show()
    image.save("pitfall_charset.png")

    print(char_colors[1])
