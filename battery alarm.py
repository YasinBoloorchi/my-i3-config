import subprocess
from os import system
import re
from time import sleep

c = 0
while True:
    c += 1
    acpiRes = str(subprocess.check_output('acpi', shell=True))
    batteryPercent = int(re.findall('\s(\d{2})%', acpiRes)[0])
    if batteryPercent < 10:
        system("'notify-send -u 'critical' 'BATTERY LOW!'")
    else:
        print(c,': ',batteryPercent,'%')
    sleep(5)
    

