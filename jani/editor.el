(defun esk-turn-on-hl-line-mode ()
  (hl-line-mode 0))

(defun esk-turn-on-idle-highlight-mode ()
  (idle-highlight-mode 0))

(add-hook 'mail-mode-hook 'my-mail-hook)

;; nrepl
(add-hook 'nrepl-mode-hook 'paredit-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-tab-command 'indent-for-tab-command)

(setq fringe-mode (cons 4 0)
      subword-mode 1
      echo-keystrokes 0.1
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      mouse-yank-at-point t
      require-final-newline t
      kill-whole-line nil
      scroll-preserve-screen-position 1
      scroll-conservatively 100000
      scroll-margin 4
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      x-select-enable-clipboard t
      show-paren-style 'expression
      redisplay-dont-pause t)

(setq wcheck-language-data
      '(("Finnish"
         (program . "/usr/bin/enchant")
         (args  "-l" "-d" "fi")
         (action-program . "/usr/bin/enchant")
         (action-args "-a" "-d" "fi")
         (action-parser . wcheck-parser-ispell-suggestions))
        ("English"
         (program . "/usr/bin/enchant")
         (args  "-l" "-d" "en")
         (action-program . "/usr/bin/enchant")
         (action-args "-a" "-d" "en")
         (action-parser . wcheck-parser-ispell-suggestions))))

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
