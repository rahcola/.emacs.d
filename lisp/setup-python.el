(require 'python)
(require 'elpy)

(setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules))
(add-hook 'python-mode-hook 'elpy-mode)

(provide 'setup-python)
