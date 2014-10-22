(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(setq inhibit-startup-message t)

(when (fboundp 'fringe-mode)
  (fringe-mode 0))

(blink-cursor-mode 0)

(show-paren-mode 1)
(setq-default show-paren-delay 0
              show-paren-style 'parenthesis)

(load-theme 'base16-default t)
(set-face-attribute 'show-paren-match nil :background nil)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
