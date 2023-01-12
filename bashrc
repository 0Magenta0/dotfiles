#
#  https://github.com/0Magenta0/Cfgs
#  Copyright 0Magenta0 2022-2023
#  MIT License
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\e[48;5;32m \u@\h \e[0;38;5;32;48;5;237m \e[0;48;5;237m\W \e[0;38;5;237m\e[0m '

get-weather() {
  curl wttr.in?q0
}

get-openstreetmap() {
  telnet mapscii.me
}

