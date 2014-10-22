(setq-default echo-keystrokes 0.1
              redisplay-dont-pause t)

(setq-default x-select-enable-primary t
              x-select-enable-clipboard t)

(setq-default scroll-conservatively 101)

(setq-default mouse-wheel-scroll-amount '(1 ((shift) . 1))
              mouse-wheel-progressive-speed nil)

(setq-default fill-column 78
              indent-tabs-mode nil
              sentence-end-double-space nil
              require-final-newline t)

(global-whitespace-mode 1)
(setq-default whitespace-line-column nil
              whitespace-style '(face trailing lines-tail tab-mark))

(setq-default transient-mark-mode t
              mouse-yank-at-point t)

(require 'uniquify)
(setq-default uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(setq-default backup-directory-alist `(("." . "~/.emacs.d/backups"))
              backup-by-copying t
              delete-old-versions t
              version-control t)

(global-subword-mode)

(ido-mode t)
(setq-default ido-enable-flex-matching t)

(setq-default hippie-expand-try-functions-list
              '(try-expand-dabbrev
                try-expand-dabbrev-all-buffers
                try-expand-dabbrev-from-kill
                try-complete-file-name-partially
                try-complete-file-name
                try-expand-all-abbrevs
                try-complete-lisp-symbol-partially
                try-complete-lisp-symbol))

(defalias 'yes-or-no 'y-or-n-p)
