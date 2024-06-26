(setq-default auto-save-file-name-transforms `((".*" "~/.cache/emacs/auto-save/" t))
              backup-by-copying t
              backup-directory-alist '((".*" . "~/.cache/emacs/backup"))
              delete-old-versions t
              echo-keystrokes 0.1
              fill-column 78
              font-lock-maximum-decoration t
              indent-tabs-mode nil
              kill-whole-line nil
              mouse-wheel-progressive-speed nil
              mouse-wheel-scroll-amount '(1 ((shift) . 1))
              mouse-yank-at-point t
              redisplay-dont-pause t
              require-final-newline t
              save-interprogram-paste-before-kill t
              save-place-file "~/.cache/emacs/places"
              scroll-conservatively 101
              sentence-end-double-space nil
              transient-mark-mode t
              version-control t
              x-select-enable-clipboard t
              x-select-enable-primary t
              inhibit-startup-message t)

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

(set-frame-font "Source Code Pro-12" nil t)

(when window-system
  (tooltip-mode 0)
  (blink-cursor-mode 0))

(when (fboundp 'fringe-mode) (fringe-mode 0))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defun kill-region-or-backward-kill-word (&optional arg region)
  "'kill-region' if the region is active, otherwise 'backward-kill-word'"
  (interactive
   (list (prefix-numeric-value current-prefix-arg) (use-region-p)))
  (if region
    (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))

(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'quelpa-use-package)

(use-package server
  :hook (after-init . server-start))

(use-package diminish
  :ensure t
  :demand t)

(use-package ivy
  :diminish
  :ensure t
  :demand t
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1))

(use-package swiper
  :after ivy
  :ensure t
  :bind (("C-s" . swiper)))

(use-package counsel
  :after ivy
  :diminish
  :ensure t
  :demand t
  :bind (("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x)))

(use-package projectile
  :defer 5
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (setq projectile-globally-ignored-directories
        '(".git" ".idea" "node_modules"))
  (projectile-mode))

(use-package counsel-projectile
  :after (counsel projectile)
  :ensure t
  :config
  (counsel-projectile-mode 1))

(use-package paren
  :config
  (show-paren-mode)
  (setq-default show-paren-delay 0
                show-paren-style 'parenthesis))

;; (use-package zenburn-theme
;;   :ensure t
;;   :config
;;   (load-theme 'zenburn t))

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t))

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

(use-package magit
  :ensure t
  :config
  (use-package magit-commit
    :config
    (use-package git-commit))

  (use-package magit-files
    :config
    (global-magit-file-mode)))

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
    (put-clojure-indent 'fn-traced 1)
    (put-clojure-indent 'reg-sub 0)
    (put-clojure-indent 're-frame/reg-sub 0)
    (put-clojure-indent 'reg-event-db 0)
    (put-clojure-indent 're-frame/reg-event-db 0)
    (put-clojure-indent 'reg-event-fx 0)
    (put-clojure-indent 're-frame/reg-event-fx 0)
    (put-clojure-indent 're-frame/reg-fx 0)
    (put-clojure-indent 'cond-> 0)
    (put-clojure-indent 'cond->> 0)
    (put-clojure-indent 'match 1)
    (put-clojure-indent 'describe 1)
    (put-clojure-indent 'context 1)
    (put-clojure-indent 'it 1)
    (put-clojure-indent 'around 1)
    (put-clojure-indent 'api/context 2)
    (put-clojure-indent 'api/GET 2)
    (put-clojure-indent 'api/POST 2)
    (put-clojure-indent 'api/PUT 2)
    (put-clojure-indent 'api/DELETE 2)
    (put-clojure-indent 'prop/for-all 1)
    (defun my-clojure-mode-hook ()
      (whitespace-mode)
      (turn-on-smartparens-strict-mode))
    (add-hook 'clojure-mode-hook #'my-emacs-lisp-mode-hook)
    (add-hook 'clojurec-mode-hook #'my-emacs-lisp-mode-hook)
    (add-hook 'clojurescript-mode-hook #'my-emacs-lisp-mode-hook)))

(use-package cider
  :ensure t
  :commands (cider-connect))

(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'")

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package scala-mode
  :ensure t
  :mode "\\.scala$"
  :interpreter ("scala" . scala-mode))

(use-package lsp-mode
  :ensure t
  :hook
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  :config (setq lsp-enable-snippet nil))

(use-package lsp-metals
  :ensure t
  :config (setq lsp-metals-treeview-show-when-views-received t))

(use-package lsp-ui
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint (and root
                        (expand-file-name "node_modules/eslint/bin/eslint.js"
                                          root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules))

(use-package js-mode
  :mode "\\.[m]?jsx?$"
  :config
  (setq-default js-indent-level 2))

(use-package typescript-mode
  :ensure t
  :mode "\\.tsx?$"
  :config
  (setq-default typescript-indent-level 2))

(use-package add-node-modules-path
  :after (js-mode typescript-mode)
  :ensure t
  :hook ((js-mode typescript-mode) . add-node-modules-path))

(use-package prettier-js
  :after (js-mode typescript-mode)
  :ensure t
  :hook ((js-mode typescript-mode) . prettier-js-mode))

(use-package copilot
  :quelpa (copilot :fetcher github
                   :repo "copilot-emacs/copilot.el"
                   :branch "main"
                   :files ("*.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(copilot editorconfig quelpa-use-package quelpa zenburn-theme yaml-mode use-package typescript-mode solarized-theme smartparens scala-mode prettier-js magit-popup magit lsp-ui lsp-metals js2-mode graphql ghub flycheck elpy diminish counsel-projectile cider add-node-modules-path)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

