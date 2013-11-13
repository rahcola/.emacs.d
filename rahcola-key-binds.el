(defun kill-region-or-backward-kill-word (&optional arg region)
  "'kill-region' if the region is active, otherwise 'backward-kill-word'"
  (interactive
   (list (prefix-numeric-value current-prefix-arg) (use-region-p)))
  (if region
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))

(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
