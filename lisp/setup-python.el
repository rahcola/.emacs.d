(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))

(eval-after-load 'elpy
  '(progn
     (setq-default elpy-modules
                   (delq 'elpy-module-highlight-indentation elpy-modules))))
(add-hook 'python-mode-hook 'elpy-mode)

(provide 'setup-python)
