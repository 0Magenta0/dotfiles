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

