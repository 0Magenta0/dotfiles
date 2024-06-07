#!/bin/bash

#
#  https://github.com/0Magenta0/dotfiles
#  Copyright 0Magenta0 2022-2024
#  MIT License
#


# -=[ Imports ]=- #
source lib/common


# -=[ Main ]=- #
for check_script in checks/*; do
  f_log "Starting ${check_script}"
  "$check_script"
done
