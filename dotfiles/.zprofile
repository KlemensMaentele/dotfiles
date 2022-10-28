#!/bin/zsh
# ~/.bash_profile
#
export PATH=~/.npm-global/bin:$PATH
export EDITOR="lvim"
export TERMINAL="st"
export BROWSER="brave"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
