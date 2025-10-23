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

background_color = COLOR_PURPLE

palette = []


char_source_size = 8
source_width = 8
source_height = 8
target_width = 16
target_height = 16
n_width = 12
n_height = 1
width = target_width * n_width
height = target_height * n_height
sprite_size_source  = source_width * source_height // 8



def convertHiresByte(b, colors):
    """Print a hires byte of C64 bitmap as 8 pixels"""
    pixels = []
    #print("Colors:", colors)
    for i in range(8):
        pixel = 1 & (b >> (7-i))
        pixels.append(palette[colors[pixel]])
    return pixels


def doubleCharLine(source):
    outsprite = bytearray()
    spriteline = 0
    
    for i in range(source_width):
        spriteline = (spriteline << 1) | ((source >> (7-i) & 1))
        spriteline = (spriteline << 1) | ((source >> (7-i) & 1))
    spriteint = int(spriteline)
    bs = spriteint.to_bytes(2, byteorder='big')

    return bs

def drawSpriteDouble(draw, spr, x, y):
    for py in range(source_height):
        px = 0
        double_data = doubleCharLine(spr[py])
        for by in double_data:
            for pixel in convertHiresByte(by, (background_color, COLOR_WHITE)):
                draw.point((x+px, y+py), pixel)
                px += 1


if __name__ == '__main__':

    # open and read C64 tile set file
    file = open("charset_numbers.bin", "rb")
    charset = file.read()
    file.close()

    # create a blank image
    image = Image.new("RGB", (width, height))

    # get a drawing context
    draw = ImageDraw.Draw(image)

    # create the VIC Palette
    palette = vic2.makePalette()

    # pre-fill background
    draw.rectangle([(0,0),(width-1,height-1)], fill=palette[background_color])

    # calculate number of character definitions
    ndefs = len(charset) // char_source_size
    print("ndefs", ndefs)

    outdata = bytearray()
    for ci in range(ndefs):
        orgchar = charset[source_height*ci:source_height*(ci+1)]
        x = (ci % n_width) * target_width
        y = (ci // n_width) * target_height
        drawSpriteDouble(draw, orgchar, x, y)

    image.show()

    image.save("pitfall_number_sprites.png")

