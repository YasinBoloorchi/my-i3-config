#!/usr/bin/python

from os import system
import subprocess
import re
from time import sleep

# make backlight brightness writable
def writable(led_device):
    command = f'echo yasinB76 | sudo -S chmod 666 {led_device}'
    system(command)
    print('\r')

def blink_backlight(led_device):
    power = True
    for i in range(2):
        if power:
            command = f'echo 1 > {led_device}'
            power = False
            
        else:
            command = f'echo 0 > {led_device}'
            power = True

        system(command)

        sleep(0.5)
        
# TODO check if file is writable or not then do this
led_device = '/sys/class/leds/asus::kbd_backlight/brightness'
writable(led_device)


while True:

    sleep_time = 2

    # get battery status update
    acpiRes = str(subprocess.check_output('acpi', shell=True))
    state = re.findall(':\s(.*?),\s', acpiRes)[0]
    batteryPercent = int(re.findall('\s(\d{1,3})%', acpiRes)[0])
    
    # ceck battery percentage
    if batteryPercent <= 10 and state == 'Discharging':
        blink_backlight(led_device)
        sleep_time = 0.3

    sleep(sleep_time)
