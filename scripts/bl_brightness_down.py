from os import system

try:
    brightness_file = open('/sys/class/leds/asus::kbd_backlight/brightness', 'r+')
    brightness = brightness_file.readline()
    brightness = int(brightness) - 1
    brightness_file.write(str(brightness))
    brightness_file.close()
except:
    pass