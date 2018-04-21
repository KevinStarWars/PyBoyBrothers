# -*- encoding: utf-8 -*-
#
# Authors: Asger Anders Lund Hansen, Mads Ynddal and Troels Ynddal
# License: See LICENSE file
# GitHub: https://github.com/Baekalfen/PyBoy
#

# cdef unsigned short LCDC, STAT, SCY, SCX, LY, LYC, DMA, BGPalette, OBP0, OBP1, WY, WX

# LCDC bit descriptions
cdef char BG_WinEnable, SpriteEnable, SpriteSize, BGTileDataDisSel, BG_WinTileDataSel, WinEnable, WinTileDataSel, Enable

cdef tuple gameboyResolution
cpdef tuple colorPalette
cpdef unsigned int alphaMask

cdef unsigned char getColorCode(unsigned char, unsigned char, unsigned char)

cdef class LCD:
    cdef object mb
    cdef public bint clearCache
    cdef public set tilesChanged
    # TODO: Numpy
    cpdef unsigned int[:, :] tileCache
    # cpdef object tileCache
    # TODO: Should be 8-bit
    cdef public unsigned char[:] VRAM
    cdef public unsigned char[:] OAM

    # TODO: Numpy
    cdef object spriteCacheOBP0
    cdef object spriteCacheOBP1

    cdef public object LCDC
    cdef public object BGP
    cdef public object OBP0
    cdef public object OBP1

    # TODO: Cythonize
    # cdef tuple getWindowPos(self)
    # cdef tuple getViewPort(self)
    # cdef public void refreshTileDataAdaptive(self)

cdef class PaletteRegister:
    cdef object lcd

    cdef unsigned char value
    cdef unsigned char[4] lookup

    # TODO: Cythonize
    # cdef public void set(self, unsigned int)
    # cdef unsigned int getColor(self, char)

    cdef char getCode(self, unsigned char)

cdef class LCDCRegister:
    cdef unsigned char value

    # TODO: Cythonize
    # cdef void set(self, unsigned int)

    cdef public bint enabled
    cdef public bint windowMapSelect
    cdef public bint windowEnabled
    cdef public bint tileSelect
    cdef public bint backgroundMapSelect
    cdef public bint spriteSize
    cdef public bint spriteEnable
    cdef public bint backgroundEnable
