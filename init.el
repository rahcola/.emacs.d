(menu-bar-mode -1)
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

(defvar my-packages '(magit
                      paredit
                      clojure-mode
                      cider
                      haskell-mode
                      rust-mode
                      elpy
                      flymake
                      color-theme-sanityinc-tomorrow
                      markdown-mode
                      scala-mode2
                      elixir-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'setup-paredit)
(require 'setup-clojure-mode)
(require 'setup-python)
(require 'setup-haskell-mode)
(require 'setup-javascript-mode)

(require 'editor-settings)
(require 'key-bindings)
(require 'host-settings system-name t)

(add-hook 'after-init-hook (lambda () (server-start)))
