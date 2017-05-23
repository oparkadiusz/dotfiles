#! /bin/bash

export I3_CONFIG_DIR="$(dirname $(readlink -f $0))"

export PATH="$PATH:$I3_CONFIG_DIR/bin:$HOME/bin-priv:$HOME/bin"

# use xresources
xrdb -merge $I3_CONFIG_DIR/xresources

# hide mouse coursor when it isn't used
unclutter -root -visible &

# set polish keymap
setxkbmap pl &

# disable touchpad
synclient TouchPadOff=1

# keyboard layout customization
xmodmap $I3_CONFIG_DIR/xmodmap
[ -e $I3_CONFIG_DIR/xmodmap_local ] && xmodmap $I3_CONFIG_DIR/xmodmap_local

# dynamic color temperature adjustment
if [ -e $I3_CONFIG_DIR/redshift ]; then
    source $I3_CONFIG_DIR/redshift
else # default setup, for gdansk
    redshift -l 54.35:18.65 -m randr -t 5500:4500 -g 0.75:0.75:0.75 &
fi

# notification
dunst -config $I3_CONFIG_DIR/dunstrc &

# gpg agent
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
gpg-connect-agent updatestartuptty /bye

# composition manager
compton --config $I3_CONFIG_DIR/compton.conf &

sh ./screenlayout/main.sh

# restore wallpaper
nitrogen --restore &

i3-regenerate
i3

true
