import sys
import os
import argparse

SPRITE_WIDTH = 24
SPRITE_HEIGHT = 24
SPRITE_SIZE = SPRITE_WIDTH * SPRITE_HEIGHT
COLLISION_SPRITE_HEIGHT = 21

COL_TRANSPARENT = 0x0

def parse_arguments():
    parser = argparse.ArgumentParser(description='sprite data to sprite mask converter')
    parser.add_argument('fn_input', help="input file name")

    args = parser.parse_args()
    return args

    
def sprite_to_mask(sprite):
    sprite_mask = bytearray()

    for row in range(COLLISION_SPRITE_HEIGHT):
        row_data = sprite[row * SPRITE_WIDTH : (row+1) * SPRITE_WIDTH]
        for col in range(3):
            col_data = row_data[col * 8 : (col+1) * 8]
            mask = 0
            for color in col_data:
                bin_value = 0 if color == COL_TRANSPARENT else 1
                mask = (mask << 1 | bin_value) & 0xff
            sprite_mask.append(mask)

    sprite_mask.append(0)               # add a final zero byte (padding to 64 bytes)
    return sprite_mask
         

if __name__ == '__main__':
    args = parse_arguments()
    print(args)

    # open the sprite data file
    with open(args.fn_input, "rb") as file:
        sprite_data = file.read() 

    num_sprites = len(sprite_data) // SPRITE_SIZE
    num_sprites = num_sprites - 4       # ignore the last four sprites (drowning harry)
    print(num_sprites)

    outdata = bytearray()

    for sprite in range(num_sprites):
        mask = sprite_to_mask(sprite_data[sprite * SPRITE_SIZE : (sprite+1) * SPRITE_SIZE])
        outdata.extend(mask)

    # prepare writing
    outname = "sprite_masks"
    print("outname:", outname)
    with open(outname, "wb") as f:
        f.write(outdata) 

