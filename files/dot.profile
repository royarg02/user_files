#~/.profile

## Function to append paths
append_path() {
  case ":$PATH:" in
    *:"$1":*) ;;
    *)        PATH="${PATH:+$PATH:}$1" ;;
  esac
}

export TERMINAL="st"
export EDITOR="nvim"
export BROWSER="firefox"
export FILE="lf"
export QT_QPA_PLATFORMTHEME=gtk3

## Set user XDG directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

## shell experience
export HISTSIZE=-1        ## infinite history
export HISTFILESIZE=-1    ## infinite history
export HISTCONTROL=ignoreboth:erasedups

## Program environment settings/variables
export ANDROID_SDK_ROOT="/opt/android-sdk"
export ADB="$ANDROID_SDK_ROOT/platform-tools/adb"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export DIFFPROG="$EDITOR -d"
export JAVA_HOME="/usr"
export MOZ_USE_XINPUT2=1
export NODE_REPL_HISTORY=''
export PURO_ROOT="$HOME/.local/src/puro"
export PURO_LOG_LEVEL=4
export _JAVA_AWT_WM_NONREPARENTING=1

## Home directory cleanup
export ANALYZER_STATE_LOCATION_OVERRIDE="$XDG_CACHE_HOME/dartServer"
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PUB_CACHE="$XDG_CACHE_HOME/pub-cache"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup"
export USERRESOURCES="$XDG_CONFIG_HOME/x11/xresources"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
# This will not work with display managers. See https://wiki.archlinux.org/index.php/XDG_Base_Directory
# for details and workarounds
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

# Append additional paths
append_path "$HOME/.local/bin"
append_path "$PUB_CACHE/bin"
append_path "$ANDROID_SDK_ROOT/platform-tools"
append_path "$JAVA_HOME/bin"
append_path "$PURO_ROOT/bin"
append_path "$PURO_ROOT/envs/default/flutter/bin"
unset -f append_path

## Source .bashrc if only in login shell; it will be sourced otherwise anyway
shopt -q login_shell && [[ -f ~/.bashrc ]] && . ~/.bashrc

## Automatically run X if in tty1
if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
fi

