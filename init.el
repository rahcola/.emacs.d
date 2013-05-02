(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(color-theme-solarized
                      starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      nrepl
                      org
                      markdown-mode
                      clojure-mode
                      paredit
                      midje-mode
                      wcheck-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode)
            auto-mode-alist))

(load-theme 'solarized-light t)

(set-face-attribute 'mode-line nil
                    :foreground "#839496"
                    :background "#002b36"
                    :inverse-video nil)
(set-face-attribute 'mode-line-inactive nil
                    :inverse-video nil)
(set-face-attribute 'show-paren-match nil
                    :foreground nil
                    :weight 'normal)

(server-start)
