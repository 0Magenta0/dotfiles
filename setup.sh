#!/bin/bash

#
#  https://github.com/0Magenta0/dotfiles
#  Copyright 0Magenta0 2022-2024
#  MIT License
#


# -=[ Imports ]=- #
source setup.conf
source lib/common
f_source_all lib/installer


# -=[ Variables ]=- #
declare -r HELP_MSG="\
  usage: $0 [-hMmy]

    -h   Print this message and exit.

    -M mount_path
        Defines temporary mountpoint.
        Default: /mnt/

    -m cpu_microcode
        Specifies custom microcode package.
        Default: amd-ucode

    -y Installation confirmation.
"
TMP_MNT=
CPU_MIC=
CONFIRM=NO


# -=[ Main ]=- #
# TODO: CHECK SYSTEM
while getopts ":hM:m:y" opt; do
  case $opt in
    h)
      f_usage 0 "$HELP_MSG"
      ;;
    M)
      TMP_MNT=$OPTARG
      ;;
    m)
      CPU_MIC=$OPTARG
      ;;
    y)
      unset CONFIRM
      ;;
    :)
      f_err "Option -${OPTARG} requires an argument"
      f_usage 2 "$HELP_MSG"
      ;;
    *)
      f_err "There is no -${OPTARG} option"
      f_usage 2 "$HELP_MSG"
  esac
done

if [[ $CONFIRM ]]; then
  f_err 'Confirm the installation with the -y option'
  f_usage 2 "$HELP_MSG"
fi

f_start_time "$0"

f_prepare_disk "$DEVDISK" "$CRYPTID" "$TMP_MNT"
f_pacstrap "$TMP_MNT" "${PKGS[@]}"
f_prepare_boot "$TMP_MNT" "$DEVDISK" "$CPU_MIC"
f_prepare_etc "$TMP_MNT"
f_pacman_install "$TMP_MNT" "${LIB32_PKGS[@]}"

f_end_time


# genfstab -U /mnt >> /mnt/etc/fstab

# In chroot
# ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
# hwclock --systohc
# locale-gen
# /etc/hostname
# mkinitcpio -P
# passwd
# mkinitcpio.conf -> systemd keyboard sd-encrypt (?udev?)
# /boot/loader/entries/arch.conf -> rd.luks.name=device-UUID=root root=/dev/mapper/root
# lsblk -f / blkid
#
# blkid -s UUID -o value /dev/sda2
# lsblk -dno UUID /dev/sda2
