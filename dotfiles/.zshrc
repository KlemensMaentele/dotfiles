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

#vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.    (By: LukeSmith)
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.



#Aliases
alias p="sudo pacman"
alias ss="sudo systemctl"
alias nv="nvim"
alias snv="sudoedit"
alias ls="ls -hN --color=auto"
alias grep="grep --color=auto"
alias ra="ranger"
alias sp="sudo poweroff"
alias please="sudo"
alias mirror="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"
alias lf="lfub"

export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/local/bin/st
export PATH="$HOME/devel/scripts/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export BROWSER=/usr/bin/brave

# End of lines added by compinstallsource

source ~/.config/zsh/calc.plugin.zsh/calc.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
