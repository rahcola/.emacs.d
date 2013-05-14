(setq inhibit-startup-message t)
(menu-bar-mode 0)

(when window-system
  (tooltip-mode 0)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  (fringe-mode 0)
  (blink-cursor-mode 0))

(setq-default visible-bell t
	      echo-keystrokes 0.1
	      redisplay-dont-pause t
	      xterm-mouse-mode t
	      x-select-enable-clipboard t)

(setq-default scroll-preserve-screen-position 1
      scroll-conservatively 100000
      scroll-margin 4)

(setq-default sentence-end-double-space nil
      require-final-newline t
      kill-whole-line nil)

(setq-default transient-mark-mode t
      mouse-yank-at-point t)

(setq-default uniquify-buffer-name-style 'forward)

(setq-default backup-directory-alist `(("." . "~/.emacs.d/backups"))
      backup-by-copying t
      delete-old-versions t
      version-control t)

(show-paren-mode)
(setq-default show-paren-delay 0
      show-paren-style 'expression)

(global-subword-mode)

(ido-mode 1)
(setq-default ido-enable-prefix nil
	      ido-enable-flex-matching t
	      ido-auto-merge-work-directories-length -1
	      ido-create-new-buffer 'always
	      ido-use-filename-at-point 'guess
	      ido-use-virtual-buffers nil
	      ido-max-prospects 10)

(setq-default indent-tabs-mode nil
              indicate-empty-lines t)

(defalias 'yes-or-no 'y-or-n-p)

(load-theme 'solarized-dark t)
(set-face-foreground 'show-paren-match nil nil)
(set-face-bold-p 'show-paren-match nil nil)
(set-face-inverse-video-p 'mode-line nil nil)
(set-face-inverse-video-p 'mode-line-inactive nil nil)

;; nrepl
(add-hook 'nrepl-mode-hook 'paredit-mode)
(setq-default nrepl-hide-special-buffers t)
(setq-default nrepl-tab-command 'indent-for-tab-command)

(setq-default mode-line-format
              '("("
                (:eval
                 (propertize "%b"
                             'face 'font-lock-keyword-face
                             'help-echo (buffer-file-name)))
                ")--("
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
                ")--("
                (:eval
                 (propertize "%3l,%2c"
                             'face 'font-lock-type-face
                             'help-echo (format-mode-line "size: %IB")))
                ")--("
                (:propertize "%m"
                             face font-lock-type-face)
                ")"))

(provide 'rahcola-editor)
