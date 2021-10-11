#!/usr/bin/bash
# Get colors
source ~/.cache/wal/colors.sh
notify-send "$(basename $wallpaper) loaded!"
sleep 0.5
# Startup page
 # echo "\${color $background}" >| ~/.cache/wal/colors-conky.txt
 # cp ~/.cache/wal/colors.css ~/Technic/github/chanhakk.github.io/colors.css

darkc1=$(printf '%X\n' $(( ( $(echo $color1| sed "s/#/0x/1" ) & 0xfefefe ) >> 1 )))

# Bspwm colors
bspc config focused_border_color $color1
bspc config normal_border_color "#$darkc1"
bspc config presel_feedback_color $color1

# Atom colors
cp ~/.cache/wal/colors-atom-syntax ~/.atom/packages/francisco-syntax/styles/colors.less

# Dunst colors
cp ~/.cache/wal/colors-dunst ~/.config/dunst/dunstrc
killall -q dunst

# dmenu colors
cp ~/.cache/wal/colors-dmenu ~/.local/bin/dmenu-wal
chmod +x ~/.local/bin/dmenu-wal

# picom shadow glow
cp ~/.cache/wal/colors-picom ~/.config/picom.conf
killall -q picom
picom -b

# rofi theme

#cp ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/themes

# Polybar text colors
# tmpdir=/tmp/polybarFontBackground
# mkdir $tmpdir

# Extract colors
   # Crop image to screen size
    #magick "$wallpaper" -resize "1366x768^" -gravity center -extent "1366x768" /tmp/polybarFontBackground/wall.png

   # Date background
    #magick $tmpdir/wall.png -crop 236x24+28+27 $tmpdir/date.png

   # Workspace background
    #magick $tmpdir/wall.png -crop 38x26+35+710 $tmpdir/work.png

   # Info background
    #magick $tmpdir/wall.png -crop 329x25+1010+710 $tmpdir/info.png

#~/.config/pywalScript/setPolybar.sh $tmpdir/date.png $tmpdir/work.png $tmpdir/info.png

cp ~/.cache/wal/colors-polybar ~/.config/polybar/colors.ini

# ---- Blur mask ----
#magick $tmpdir/wall.png ~/.config/pywalScript/res/variable-blur.png -compose blur -define compose:args=4 -composite ~/.config/pywalScript/res/blurred_wallpaper.png

#feh --bg-fill ~/.config/pywalScript/res/blurred_wallpaper.png
# -------------------

# rm -rf $tmpdir/*

polybar-msg cmd restart
pywalfox update

#killall -q polybar # Kill existing polybar instances
#while pgrep -u $UID -x polybar >/dev/null; do sleep .2; done # wait until they are killed
#polybar -r -c ~/.config/polybar/minimal.ini date & # start bars
#polybar -r -c ~/.config/polybar/minimal.ini info &

notify-send "Colorscheme" "set!"
