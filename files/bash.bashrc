#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1='[\u@\h \W]\$ '

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

# source git completion if it exists and is readable
[[ -r /usr/local/share/bash-completion/completions/git ]] && . /usr/local/share/bash-completion/completions/git

# source git prompt if it exists and is readable
[[ -r /usr/share/git-completion/prompt.sh ]] && . /usr/share/git-completion/prompt.sh

## Source .profile if only in non-login shell; it will be sourced otherwise anyway
shopt -q login_shell || ([ -f ${HOME}/.profile ] && . ${HOME}/.profile)
