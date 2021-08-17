#!/bin/bash

killall -q change_wal.sh

# cd /usr/share/backgrounds/manjaro-wallpapers-18.0/
cd ~/Pictures/backgrounds/

files=`ls`

while [ 1 ]
do
	for file in ${files[@]};
	do
		wal -x -i $file
		sleep 60
	done
done
