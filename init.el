(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(magit
                      paredit
                      clojure-mode
                      cider
                      haskell-mode
                      elpy
                      flymake
                      zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'setup-editor)

(eval-after-load 'paredit '(require 'setup-paredit))

(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(eval-after-load 'python '(require 'setup-python))
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))

(add-hook 'after-init-hook (lambda () (load "my-haskell.el")))
(add-hook 'after-init-hook (lambda () (load "my-key-binds.el")))
(add-hook 'after-init-hook (lambda () (load "my-mail.el")))
(add-hook 'after-init-hook (lambda () (load "my-modeline.el")))
(add-hook 'after-init-hook (lambda () (load (concat system-name ".el") t)))

(add-hook 'after-init-hook (lambda () (server-start)))
