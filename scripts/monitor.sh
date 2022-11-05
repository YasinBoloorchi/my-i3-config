#!/bin/bash

state=$1

case $state in
    "--help") echo "This is a help page for monitor bash script.
    
    Options

    -1      Standard mode. just the main monitor of the laptop (eDP-1)
    
    -2      Turn on laptop's monitor and the main monitor is the laptop monitor (eDP-1)
    
    -3      External monitor. turn on the LCD monitor in the RIGHT side
        of the laptop's monitor.
    
    -4      External monitor. turn on the LCD monitor in the LEFT side
        of the laptop's monitor.
    
    -5      Extended mode. main monitor will be LCD monitor and at the
        right side would be laptop's monitor

    -6      Extended mode. main monitor will be LCD monitor and at the
        left side would be laptop's monitor
       
    -7      LCD mode. the main monitor will be LCD monitor.";;


    -1) xrandr --output eDP-1 --auto --primary --output HDMI-1 --off && sleep 1 && i3-msg restart;;
    -2) xrandr --output eDP-1 --auto --primary && sleep 1 && i3-msg restart;;
    -3) xrandr --output eDP-1 --auto --primary --output HDMI-1 --auto --left-of eDP-1 && sleep 1 && i3-msg restart;;
    -4) xrandr --output eDP-1 --auto --primary --output HDMI-1 --auto --right-of eDP-1 && sleep 1 && i3-msg restart;;
    -5) xrandr --output HDMI-1 --auto --primary --output eDP-1 --auto --right-of HDMI-1 && sleep 1&& i3-msg restart;;
    -6) xrandr --output HDMI-1 --auto --primary --output eDP-1 --auto --left-of HDMI-1 && sleep 1 && i3-msg restart;;
    -7) xrandr --output HDMI-1 --auto --primary --output eDP-1 --off && sleep 1 && i3-msg restart;;

esac

# For adjusting to the new HDMI to VGA convertor I used the below script:

# xrandr --newmode "1600x900_60.00" 118.25 1600 1696 1856 2112 900 903 908 934 -hsync +vsync
# xrandr --addmode HDMI-1 "1920x1080_60.00"
# xrandr --output HDMI-1 --mode "1600x900_60.00" 

#    -5) xrandr --output HDMI-1 --mode "1600x900_60.00" --primary --output eDP-1 --auto --right-of HDMI-1 && sleep 1&& i3-msg restart;;
#    -6) xrandr --output HDMI-1 --mode "1600x900_60.00" --primary --output eDP-1 --auto --left-of HDMI-1 && sleep 1 && i3-msg restart;;
#    -7) xrandr --output HDMI-1 --mode "1600x900_60.00" --primary --output eDP-1 --off && sleep 1 && i3-msg restart;;


# -------------------------------------
# if [ $state = "1" ]; then
#     echo 'monitor type 1'
# elif [ $state = "2" ]; then
#     echo 'monitor type 2'
# fi
