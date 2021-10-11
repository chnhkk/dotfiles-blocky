# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PATH=$PATH:~/.local/bin

autoload -Uz anonsh
autoload bashcompinit
bashcompinit
eval "$(register-python-argcomplete pmbootstrap)"


# Init zprezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Set enviroment vars
export _JAVA_AWT_WM_NONREPARENTING=1

# Functions
function sleep_until {
	seconds=$(( $(date -d "$*" +%s) - $(date +%s) ))
	echo "Sleeping for $seconds seconds"
	sleep $seconds
}
function mountiphone {
	idevicepair pair
	ifuse "$1"
}

function workon {
	if [[ -d ~/technic/virtenvs/$1 ]]; then
		source ~/technic/virtenvs/$1/bin/activate
	else
		echo "Virtual enviroment \"$1\" not found."
	fi
}

# Aliases
disable r
alias vim="nvim"
alias meow="cat"
alias youtube-s="youtube-dl -x --format mp3"
alias fehs="feh --scale-down"
alias multimon-u="multimon-ng -s DUMPCSV -s UFSK1200 -s MORSE_CW"
alias walpost="wal -o "~/.config/pywalScript/post.sh" --saturate 0.9 -i "
alias wine32b="WINEARCH=win32 WINEPREFIX=~/.win32 wine"
alias winetricks32b="WINEARCH=win32 WINEPREFIX=~/.win32 winetricks"
alias sxiv="sxiv -a"
alias sleepnow="systemctl suspend"
alias batperc='echo "scale=4; $(cat /sys/class/power_supply/BAT0/charge_now) / $(cat /sys/class/power_supply/BAT0/charge_full)*100"|bc'
