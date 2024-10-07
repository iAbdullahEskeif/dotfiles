#!/bin/sh

pgrep -x fuzzel && exit

choice=$(echo "󰗃 " | fuzzel -d -p "Search YouTube:") || exit 1

foot -e ytfzf -t --rii $choice
