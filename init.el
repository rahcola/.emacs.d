(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(color-theme-solarized
                      nrepl
                      clojure-mode
                      paredit
                      midje-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(add-to-list 'load-path "~/.emacs.d")
(add-hook 'after-init-hook (lambda () (load "rahcola-editor.el")))
(add-hook 'after-init-hook (lambda () (load "rahcola-key-binds.el")))
(add-hook 'after-init-hook (lambda () (load "rahcola-tex.el")))

(server-start)
