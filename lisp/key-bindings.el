(defun kill-region-or-backward-kill-word (&optional arg region)
  "'kill-region' if the region is active, otherwise 'backward-kill-word'"
  (interactive
   (list (prefix-numeric-value current-prefix-arg) (use-region-p)))
  (if region
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))

(setq-default kill-whole-line nil)

(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)

(provide 'key-bindings)
