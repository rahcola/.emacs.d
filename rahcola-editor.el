(setq inhibit-startup-message t)
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(setq-default visible-bell t
	      echo-keystrokes 0.1
	      redisplay-dont-pause t
	      xterm-mouse-mode t
	      x-select-enable-primary t
	      x-select-enable-clipboard t)

(setq-default scroll-preserve-screen-position 1
      scroll-conservatively 100000
      scroll-margin 4)

(setq-default sentence-end-double-space nil
      require-final-newline t
      kill-whole-line nil)

(setq transient-mark-mode t
      mouse-yank-at-point t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups"))
      backup-by-copying t
      delete-old-versions t
      version-control t)

(show-paren-mode 1)
(setq-default show-paren-delay 0
      show-paren-style 'expression)

(global-subword-mode)

(ido-mode t)
(setq ido-enable-flex-matching t)

(setq-default indent-tabs-mode nil
              indicate-empty-lines t)

(defalias 'yes-or-no 'y-or-n-p)

(set-face-foreground 'show-paren-match nil nil)
(set-face-bold-p 'show-paren-match nil nil)
(set-face-inverse-video-p 'mode-line nil nil)
(set-face-inverse-video-p 'mode-line-inactive nil nil)

(setq-default mode-line-format
              '(" "
                (:eval
                 (propertize "%3l,%2c"
                             'face 'font-lock-type-face
                             'help-echo (format-mode-line "size: %IB")))
                " "
                (:eval
                 (propertize "%b"
                             'face 'font-lock-keyword-face
                             'help-echo (buffer-file-name)))
                " ("
                (:eval
                 (cond (buffer-read-only
                        (propertize "R"
                                    'face 'font-lock-type-face
                                    'help-echo "read only"))
                       ((buffer-modified-p)
                        (propertize "M"
                                    'face 'font-lock-type-face
                                    'help-echo "modified"))
                       (t
                        (propertize " "
                                    'face 'font-lock-type-face
                                    'help-echo "not modified"))))
                ") "
                (:propertize "%m"
                             face font-lock-type-face)))
