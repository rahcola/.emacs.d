(setq inhibit-startup-message t)

(global-whitespace-mode 1)
(setq-default whitespace-line-column nil
              whitespace-style '(face trailing lines-tail tab-mark))

(when window-system
  (tooltip-mode 0)
  (blink-cursor-mode 0))

(when (fboundp 'fringe-mode)
  (fringe-mode 0))

(show-paren-mode 1)
(setq-default show-paren-delay 0
              show-paren-style 'parenthesis)

(require 'uniquify)
(setq-default uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(global-subword-mode)

(ido-mode t)
(setq-default ido-enable-flex-matching t)

(add-to-list 'custom-theme-load-path (concat user-emacs-directory
                                             "lisp"))
(load-theme 'base16-default t)
(set-face-attribute 'show-paren-match nil :background nil)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(setq-default fill-column 78
              indent-tabs-mode nil)

(setq-default font-lock-maximum-decoration t
              echo-keystrokes 0.1
              redisplay-dont-pause t
              mouse-wheel-scroll-amount '(1 ((shift) . 1))
              mouse-wheel-progressive-speed nil
              x-select-enable-primary t
              x-select-enable-clipboard t
              save-interprogram-paste-before-kill t
              mouse-yank-at-point t
              scroll-conservatively 101
              transient-mark-mode t
              sentence-end-double-space nil
              require-final-newline t
              backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                       "backups")))
              backup-by-copying t
              delete-old-versions t
              version-control t
              save-place-file (concat user-emacs-directory "places"))

(setq-default hippie-expand-try-functions-list
              '(try-expand-dabbrev
                try-expand-dabbrev-all-buffers
                try-expand-dabbrev-from-kill
                try-complete-file-name-partially
                try-complete-file-name
                try-expand-all-abbrevs
                try-complete-lisp-symbol-partially
                try-complete-lisp-symbol))

(setq-default mode-line-format
              (list "%04l,%02c"
                    " │ "
                    mode-line-buffer-identification
                    " │ "
                    '(:eval (if buffer-read-only "R" "-"))
                    '(:eval (if (buffer-modified-p) "M" "-"))
                    " │ "
                    mode-line-modes))

(provide 'editor-settings)
