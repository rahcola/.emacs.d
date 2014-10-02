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
                      color-theme-solarized
                      elpy
                      zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'auto-mode-alist '("/tmp/mutt.*" . mail-mode))

(add-to-list 'load-path "~/.emacs.d")
(add-hook 'after-init-hook (lambda () (load "rahcola-looks.el")))
(add-hook 'after-init-hook (lambda () (load "rahcola-modeline.el")))
(add-hook 'after-init-hook (lambda () (load "rahcola-editor.el")))
(add-hook 'after-init-hook (lambda () (load "rahcola-key-binds.el")))
(add-hook 'after-init-hook (lambda () (load "rahcola-clojure.el")))
(add-hook 'after-init-hook (lambda () (load "rahcola-haskell.el")))
(add-hook 'after-init-hook (lambda () (load "rahcola-python.el")))
