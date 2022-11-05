# A script for set the 1600x900 resolution to my monitor after buying Royal HDMI to VGA connector
# It came from 3rd post in this link: https://ubuntuforums.org/showthread.php?t=1112186

gtf 1600 900 60.00
xrandr --newmode "1600x900_60.00"  119.00  1600 1696 1864 2128  900 901 904 932  -HSync +Vsync
xrandr --addmode HDMI-1 "1600x900_60.00"
#xrandr --output HDMI-1 --mode "1600x900_60.00"

