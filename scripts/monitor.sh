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
        
    -6      LCD mode. the main monitor will be LCD monitor.";;


    -1) xrandr --output eDP-1 --auto --primary --output HDMI-1 --off && sleep 3 && i3-msg restart;;
    -2) xrandr --output eDP-1 --auto --primary && sleep 3 && i3-msg restart;;
    # -3) xrandr --output HDMI-1 --mode 1600x1024 --right-of eDP-1;;
    -3) xrandr --output eDP-1 --auto --primary --output HDMI-1 --auto --right-of eDP-1 && sleep 3 && i3-msg restart;;
    -4) xrandr --output eDP-1 --auto --primary --output HDMI-1 --auto --left-of eDP-1 && sleep 3 && i3-msg restart;;
    -5) xrandr --output HDMI-1 --auto --primary --output eDP-1 --auto --right-of HDMI-1 && sleep 3&& i3-msg restart;;
    -6) xrandr --output HDMI-1 --auto --primary --output eDP-1 --off && sleep 3 && i3-msg restart;;
    
esac

# if [ $state = "1" ]; then
#     echo 'monitor type 1'
# elif [ $state = "2" ]; then
#     echo 'monitor type 2'
# fi