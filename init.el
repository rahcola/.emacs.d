(setq-default inhibit-startup-message t
              fill-column 78
              indent-tabs-mode nil
              font-lock-maximum-decoration t
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

(set-frame-font "Source Code Pro-10" nil t)

(when window-system
  (tooltip-mode 0)
  (blink-cursor-mode 0))

(when (fboundp 'fringe-mode) (fringe-mode 0))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (p '(use-package diminish))
  (when (not (package-installed-p p))
    (package-install p)))

(use-package server
  :hook (after-init . server-start))

(use-package ivy
  :ensure t
  :demand t
  :diminish
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode))

(use-package swiper
  :ensure t
  :after (ivy)
  :bind (("C-s" . swiper)))

(use-package counsel
  :ensure t
  :diminish
  :after (ivy swiper)
  :bind (("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x)))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

(use-package counsel-projectile
  :ensure t
  :after (projectile counsel)
  :config
  (counsel-projectile-mode))

(use-package paren
  :config
  (show-paren-mode)
  (setq-default show-paren-delay 0
                show-paren-style 'parenthesis))

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t)
  (set-face-attribute 'mode-line nil :box nil)
  (set-face-attribute 'mode-line-inactive nil :box nil))

(use-package hippie-exp
  :bind (("M-/" . hippie-expand)))

(use-package whitespace
  :commands (whitespace-mode)
  :config
  (setq-default whitespace-line-column nil
                whitespace-style '(face trailing lines-tail tab-mark)))

(use-package smartparens
  :ensure t
  :commands (smartparens-strict-mode
             turn-on-smartparens-strict-mode)
  :bind (:map smartparens-mode-map
              ("C-M-f" . sp-forward-sexp)
              ("C-M-b" . sp-backward-sexp)
              ("C-M-k" . sp-kill-sexp)
              ("M-F" . sp-forward-symbol)
              ("M-B" . sp-backward-symbol)
              ("C-<right>" . sp-forward-slurp-sexp)
              ("C-<left>" . sp-forward-barf-sexp)))

(use-package elisp-mode
  :config
  (defun my-emacs-lisp-mode-hook ()
    (whitespace-mode)
    (turn-on-smartparens-strict-mode))
  (add-hook 'emacs-lisp-mode-hook #'my-emacs-lisp-mode-hook))

(use-package clojure-mode
  :ensure t
  :mode (("\\.clj$" . clojure-mode)
         ("\\.cljc$" . clojurec-mode)
         ("\\.cljs$" . clojurescript-mode))
  :config
  (progn
    (setq clojure-align-forms-automatically 1)
    (put-clojure-indent 'reg-sub 0)
    (put-clojure-indent 're-frame/reg-sub 0)
    (put-clojure-indent 'reg-event-db 0)
    (put-clojure-indent 're-frame/reg-event-db 0)
    (put-clojure-indent 'reg-event-fx 0)
    (put-clojure-indent 're-frame/reg-event-fx 0)
    (put-clojure-indent 'cond-> 0)
    (put-clojure-indent 'cond->> 0)
    (put-clojure-indent 'match 1)
    (put-clojure-indent 'describe 1)
    (put-clojure-indent 'it 1)
    (put-clojure-indent 'around 1)
    (put-clojure-indent 'api/context 2)
    (put-clojure-indent 'api/GET 2)
    (defun my-clojure-mode-hook ()
      (whitespace-mode)
      (turn-on-smartparens-strict-mode))
    (add-hook 'clojure-mode-hook #'my-emacs-lisp-mode-hook)
    (add-hook 'clojurec-mode-hook #'my-emacs-lisp-mode-hook)
    (add-hook 'clojurescript-mode-hook #'my-emacs-lisp-mode-hook)))

(use-package cider
  :ensure t
  :commands (cider-connect))

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'setup-paredit)
(require 'setup-python)
(require 'setup-haskell-mode)
(require 'setup-javascript-mode)

(require 'key-bindings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cider zenburn-theme use-package smartparens diminish counsel-projectile clojure-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
