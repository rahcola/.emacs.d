(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-hook 'clojure-mode-hook 'paredit-mode)
