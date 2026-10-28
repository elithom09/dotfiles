#!/bin/bash

for file in *.png;
do
	feh "$file" &
	read -p "delete?" confirm
	case "$confirm" in
		[yY][eE][sS]|[yY])
			rm "$file"
			killall feh
			;;
		[nN][oO]|[nN])
			killall feh
			;;
		*)
			killall feh;
	esac
done
