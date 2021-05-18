#~/.profile

## Set user XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export TERMINAL="st"
export EDITOR="vim"
export BROWSER="firefox"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"

## flutter version management
export FLUTTER_PATH="$HOME/.local/src/flutter_sdk_master"

export JAVA_HOME="/opt/android-studio/jre"
export ANDROID_SDK_ROOT="$HOME/.local/src/android_sdk"
export ADB="$ANDROID_SDK_ROOT/platform-tools/adb"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export PUB_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/pub-cache"
export PATH="$PATH:$FLUTTER_PATH/bin:$FLUTTER_PATH/bin/cache/dart-sdk/bin:$PUB_CACHE/bin:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$JAVA_HOME/bin:$HOME/.local/bin/"

## shell experience
export HISTSIZE=-1    ## infinite history
export HISTFILESIZE=-1    ## infinite history
export HISTCONTROL=ignoredups:erasedups:ignorespace
export LESSHISTFILE=-   ## do not create .lesshst file
export PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }"history -a"  ## Enable history append at every command

## other program settings
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'
export MOZ_USE_XINPUT2=1
export MOZ_X11_EGL=1

## Cleanup
export HISTFILE="$XDG_DATA_HOME/bash/history"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
# This will not work with display managers. See https://wiki.archlinux.org/index.php/XDG_Base_Directory
# for details and workarounds
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export ANDROID_EMULATOR_HOME="$ANDROID_SDK_ROOT/emulator" 
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup"

## Source .bashrc if only in login shell; it will be sourced otherwise anyway
shopt -q login_shell && [[ -f ~/.bashrc ]] && . ~/.bashrc
