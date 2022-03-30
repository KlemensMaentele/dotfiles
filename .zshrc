#!/bin/bash
# Lines configured by zsh-newuser-install
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[white]%}%~%{$fg[blue]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000000000000
SAVEHIST=1000000000000

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#Aliases
alias p="sudo pacman"
alias ss="sudo systemctl"
alias v="nvim"
alias sv="sudoedit"
alias ls="ls -hN --color=auto"
alias grep="grep --color=auto"


export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/devel/scripts/"
# End of lines added by compinstallsource

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
