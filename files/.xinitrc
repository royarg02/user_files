#!/bin/sh
# ~/.xinitrc
# Executed by startx 

USERRESOURCES="$XDG_CONFIG_HOME/x11/xresources"
USERXSESSION="$XDG_CACHE_HOME/x11/xsession"
USERXSESSIONRC="$XDG_CACHE_HOME/x11/xsessionrc"
ALTUSERXSESSION="$XDG_CACHE_HOME/x11/Xsession"
ERRFILE="$XDG_CACHE_HOME/x11/xsession-errors"

# merge in defaults and keymaps
if [ -f "$USERRESOURCES" ]; then
    xrdb -merge "$USERRESOURCES"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export XDG_CURRENT_DESKTOP="XFCE"

/usr/bin/prime-offload
ssh-agent xfce4-session
sudo /usr/bin/prime-switch
