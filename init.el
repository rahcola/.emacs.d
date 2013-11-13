(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(clojure-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(add-to-list 'load-path "~/.emacs.d")
(add-hook 'after-init-hook (lambda () (load "rahcola-editor.el")))
(add-hook 'after-init-hook (lambda () (load "rahcola-key-binds.el")))

(server-start)
