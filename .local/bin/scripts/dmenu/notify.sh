#!/bin/zsh

time=$(echo "What time do you wanna be notified" | fuzzel -d ) || exit 1 

note=$(echo "What is the notification: " | fuzzel -d)

echo " notify-send $note " | at $time
