### ~/.bashrc

## Function for displaying non-zero exit codes
## http://stackoverflow.com/q/7899119
exit_code() {
  printf '%.*s%.*s' $? $? $? ' '
}

## Set PS1s according to the number of colors the terminal supports
## 127 $ ~(master) > _
## WHITE exit code and '$', PURPLE working directory, CYAN git branch, white '>'

## PS1 for terminals supporting 256 colors
PS1_256="\[$(tput bold)\]\$(exit_code)\[$(tput setaf 15)\]\\$ \[$(tput setaf 206)\]\w\[$(tput setaf 87)\]\$(__git_ps1 \(%s\))\[$(tput setaf 15)\] >\[$(tput sgr0)\] "

## PS1 for other terminals
PS1_not_256="\[$(tput bold)\]\$(exit_code)\[$(tput setaf 7)\]\\$ \[$(tput setaf 5)\]\w\[$(tput setaf 6)\]\$(__git_ps1 \(%s\))\[$(tput setaf 7)\] >\[$(tput sgr0)\] "

## PS1 for no color
PS1_no_color="\$(exit_code)\\$ \w\$(__git_ps1 \(%s\)) > "

## Set colorful PS1 only on colorful terminals.
## Check if dircolors is present(used to load colors for ls) and the terminal
## supports more than 0 colors
if command -v dircolors > /dev/null && [[ $(tput colors) -gt 0 ]]; then
  # Check if "dircolors database" is present, if not, make one
  [[ ! -f "$XDG_CONFIG_HOME/dircolors" ]] && \
    dircolors -p > "$XDG_CONFIG_HOME/dircolors"

  # Enable colors for ls, etc.
  eval $(dircolors -b "$XDG_CONFIG_HOME/dircolors")

  # Set PS1 on whether the terminal can display 256 colors
  [[ $(tput colors) -eq 256 ]] > /dev/null 2>&1 && PS1=$PS1_256 || PS1=$PS1_not_256
else
  PS1=$PS1_no_color
fi

unset PS1_not_256 PS1_256 PS1_no_color

## Aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -iv"                         # confirm before overwriting something
alias mv="mv -vi"
alias rm="rm -v"                          # display which files have been deleted
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='$EDITOR -w PKGBUILD'
alias more=less
alias diff='diff --color'                 # colorful diff
alias mkdir='mkdir -pv'
alias which='alias | which --read-alias'

## Nice functions

## archive extractor
extract() {
  if [[ -f $1 ]] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       7z x $1      ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

## Weather
wttr() {
  curl -s "wttr.in/$@"
}

## Public IP address
myip() {
  curl -s "ifconfig.me/all"
}

## RGB to hex converter
rgb2hex() {
  printf "#%02x%02x%02x\n" "$1" "$2" "$3"
}

## hex to RGB converter
hex2rgb() {
  printf "RGB(%d,%d,%d)\n" "0x${1:-0}" "0x${2:-0}" "0x${3:-0}"
}
