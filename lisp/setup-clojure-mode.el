(require 'clojure-mode)

(add-hook 'clojure-mode-hook (lambda () (paredit-mode)))

(provide 'setup-clojure-mode)
