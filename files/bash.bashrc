#
# /etc/bash/bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Expand aliases even when not interactive
shopt -s expand_aliases

## Enable history appending instead of overwriting.
shopt -s histappend

## Enable minor corrections to cd directory arguments
shopt -s cdspell

## Check for jobs before exiting
shopt -s checkjobs

## Show before running history substitutions
shopt -s histverify

## Enable switching to directory without explicit "cd"
shopt -s autocd

# Disable ctrl-s and ctrl-q.
stty -ixon

# Set a barebone PS1 if it is still set to the bash default
[[ "$PS1" = '\s-\v\$ ' ]] && PS1="\$? \\$ \W >"

## Only show the previous three directories in PS1(bash >= 4.0)
PROMPT_DIRTRIM=3

## Set terminal window title
case ${TERM} in
  Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
    PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
  screen*)
    PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
esac

## Source bash_completion if it exists and is readable
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# source git prompt if it exists and is readable
[[ -r /usr/share/git/git-prompt.sh ]] && . /usr/share/git/git-prompt.sh

## Source .profile if only in non-login shell; it will be sourced otherwise anyway
shopt -q login_shell || ([ -f ${HOME}/.profile ] && . ${HOME}/.profile)
