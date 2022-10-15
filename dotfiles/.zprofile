#!/bin/zsh
# ~/.bash_profile
#

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
