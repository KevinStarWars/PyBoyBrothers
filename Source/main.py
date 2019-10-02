import os
import os.path


def get_window():
    from PyBoy.GameWindow import SdlGameWindow as Window
    return Window


def get_rom(dir):
    # Give a list of ROMs to start
    found_files = filter(lambda f: f.lower().endswith(
        ".gb") or f.lower().endswith(".gbc"), os.listdir(dir))
    for i, f in enumerate(found_files):
        print ("%s\t%s" % (i + 1, f))
    filename = raw_input("Write the name or number of the ROM file:\n")

    try:
        filename = dir + found_files[int(filename) - 1]
    except:
        filename = dir + filename

    return filename


if __name__ == "__main__":
    from PyBoy import PyBoy

    boot_rom = "ROMs/DMG_ROM.bin"
    rom_dir = "ROMs/"
    scale = 1

    # Verify directories
    if boot_rom is not None and not os.path.exists(boot_rom):
        print(
                "Boot-ROM not found. Please copy the Boot-ROM to '%s'. Using replacement in the meanwhile..." % boot_rom)
        boot_rom = None

    if not os.path.exists(rom_dir):
        exit("ROM folder not found. Please copy the Game-ROM to '%s'" % rom_dir)

    # Check if the ROM is given through argv
    filename = get_rom(rom_dir)

    # Start PyBoy and run loop
    pyboy = PyBoy((get_window())(scale=scale), filename, boot_rom)
    while not pyboy.tick():
        pass
    pyboy.stop()
