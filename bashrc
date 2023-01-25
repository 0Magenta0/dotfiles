#
#  https://github.com/0Magenta0/dotfiles
#  Copyright 0Magenta0 2022-2023
#  MIT License
#

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Setup locale.
export LC_ALL=ru_RU.UTF-8
export LANG=ru_RU.UTF-8
export LANGUAGE=ru_RU.UTF-8

# Auto use colors in `ls` binary.
alias ls='ls --color=auto'

#\[ \] OR \001 \002
PS1='$(EXIT_CODE=$?; if [ $EXIT_CODE -ne 0 ]; then echo "\[\e[0;48;5;236;38;5;196m\] $EXIT_CODE "; fi)\[\e[38;5;236;48;5;32m\]\[\e[38;5;231;48;5;32m\] \u \[\e[0;38;5;32;48;5;237m\] \[\e[0;48;5;237m\]\W \[\e[0;38;5;237m\]\[\e[0m\] '


# Setup functions.
get-weather() {
  curl wttr.in?q0
}

get-openstreetmap() {
  telnet mapscii.me
}

