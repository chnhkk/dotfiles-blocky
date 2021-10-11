#!/bin/sh
source ~/.cache/wal/colors.sh

poweroff=~/.local/share/audio/ui/NFCFailure.ogg
lock=~/.local/share/audio/chromeos-sounds/lock.wav

case "$(printf "suspend\\nlogout\\nreboot\\npoweroff" | dmenu -nb $background -sf $background -sb $color1 -nf $foreground -fn 'scientifica:size=8' -i -p "Power:")" in
	suspend) paplay $lock; systemctl suspend ;;
	logout) paplay $lock; bspc quit ;;
	reboot) paplay $poweroff; systemctl reboot ;;
	poweroff) paplay $poweroff; systemctl poweroff ;;
esac
