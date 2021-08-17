#!/bin/bash

pkill -f /dev/video || mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --geometry=-0-0 --autofit=30%
