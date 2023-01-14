#!/bin/bash

#
#  https://github.com/0Magenta0/Cfgs
#  Copyright 0Magenta0 2022-2023
#  MIT License
#

COUNT_SUCCESSFUL=0
COUNT_FAILED=0

function check_return() {
    if [ $? -eq 0 ]; then
        echo -e "\x1B[32mOK\x1B[0m"
        ((COUNT_SUCCESSFUL++))
    else
        echo -e "\x1B[31mFAIL ($?)\x1B[0m"
        ((COUNT_FAILED++))
    fi
}

# copy_config (src, dst, is_root)
function copy_config() {
    echo -en "[\x1B[36m*\x1B[0m] Copying $1 to $2... "
    if [ $3 -eq 1 ]; then
        sudo mkdir -p "$(dirname $2)"
        sudo cp "$1" "$2" &>/dev/null
    else
        mkdir -p "$(dirname $2)"
        cp "$1" "$2" &>/dev/null
    fi

    check_return
}

echo -e "[\x1B[36m*\x1B[0m] Getting enough privileges..."
echo -e "[\x1B[32m+\x1B[0m] Now we can use `sudo whoami`!"

echo -e "\n----========----\n"
echo -en "[\x1B[36m*\x1B[0m] Setting timezone to Europe/Moscow... "
sudo ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
check_return
echo -en "[\x1B[36m*\x1B[0m] Installing some fonts... "
sudo pacman -S --noconfirm ttf-hack-nerd ttf-droid ttf-dejavu &>/dev/null
check_return

echo -e "\n----========----\n"
echo -e "[\x1B[36m*\x1B[0m] Installing all configs..."
copy_config "tmux.conf" "/etc/tmux.conf" 1
copy_config "vimrc" "/etc/vimrc" 1
copy_config "i3-config" "$HOME/.config/i3/config" 0
copy_config "alacritty.yml" "$HOME/.config/alacritty/alacritty.yml" 0
copy_config "polybar-config.ini" "/etc/polybar/config.ini" 1
copy_config "bashrc" "$HOME/.bashrc" 0
copy_config "bashrc" "`sudo bash -c 'echo ~'`/.bashrc" 1

echo -e "\n----========----\n"
echo -e "[\x1B[32m+\x1B[0m] Setup is ended! Success: \x1B[32m$COUNT_SUCCESSFUL\x1B[0m | Failed: \x1B[31m$COUNT_FAILED\x1B[0m"

