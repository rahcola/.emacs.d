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
                      zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'auto-mode-alist '("/tmp/mutt.*" . mail-mode))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp")
(add-hook 'after-init-hook (lambda () (load "my-clojure.el")))
(add-hook 'after-init-hook (lambda () (load "my-editor.el")))
(add-hook 'after-init-hook (lambda () (load "my-haskell.el")))
(add-hook 'after-init-hook (lambda () (load "my-key-binds.el")))
(add-hook 'after-init-hook (lambda () (load "my-looks.el")))
(add-hook 'after-init-hook (lambda () (load "my-mail.el")))
(add-hook 'after-init-hook (lambda () (load "my-modeline.el")))
(add-hook 'after-init-hook (lambda () (load "my-python.el")))
(add-hook 'after-init-hook (lambda () (load (concat system-name ".el") t)))
