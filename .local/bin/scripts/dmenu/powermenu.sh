#!/bin/sh

   chosen=$(printf "  Power Off\n  Restart\n  Suspend\n󰅜  Kill\n  Lock" | fuzzel -d -l 10)  

case "$chosen" in
	"  Power Off") shutdown now;;
	"  Restart") reboot ;;
	"  Suspend") systemctl suspend ;;
	"󰅜  Kill") swaymsg exit ;;
	"  Lock") swaylock ;;
	*) exit 1 ;;
esac
