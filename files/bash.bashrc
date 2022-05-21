#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Update buffer size if necessary after running external command
[[ $DISPLAY ]] && shopt -s checkwinsize

# Expand aliases even when not interactive
shopt -s expand_aliases

## Enable history appending instead of overwriting.
shopt -s histappend

## Enable switching to directory without explicit "cd"
shopt -s autocd

# Disable ctrl-s and ctrl-q.
stty -ixon

# Set a barebone PS1
PS1='[\u@\h \W]\$ '

## Only show the previous three directories in PS1(bash >= 4.0)
PROMPT_DIRTRIM=3

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

## Source bash_completion if it exists and is readable
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# source git prompt if it exists and is readable
[[ -r /usr/share/git-completion/prompt.sh ]] && . /usr/share/git-completion/prompt.sh

## Source .profile if only in non-login shell; it will be sourced otherwise anyway
shopt -q login_shell || ([ -f ${HOME}/.profile ] && . ${HOME}/.profile)
