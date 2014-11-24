;; https://github.com/overtone/emacs-live/blob/master/packs/dev/clojure-pack/config/paredit-conf.el
(defun live-paredit-forward ()
  "Feels more natural to move to the beginning of the next item
   in the sexp, not the end of the current one."
  (interactive)
  (if (and (not (paredit-in-string-p))
           (save-excursion
             (ignore-errors
               (forward-sexp)
               (forward-sexp)
               t)))
      (progn
        (forward-sexp)
        (forward-sexp)
        (backward-sexp))
    (paredit-forward)))

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-M-f") 'live-paredit-forward)))

(provide 'setup-paredit)
