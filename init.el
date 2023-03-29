;
;  https://github.com/0Magenta0/dotfiles
;  Copyright 0Magenta0 2022-2023
;  MIT License
;

; Disable all bars.
(when window-system
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
)

; Disable any alarm.
(setq ring-bell-function 'ignore)

; Set automatic window
; scroll step to one line.
(setq scroll-conservatively 1)

; Disable cursor blinking
; in NoWindow Emacs.
(setq visible-cursor nil)

; Enable line numbers
; drawing in relative mode.
(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)

; Disable line wrapping.
(set-default 'truncate-lines t)

; Use HEX values for
; reading quoted char
; instead of Octal.
(setq read-quoted-char-radix 16)
