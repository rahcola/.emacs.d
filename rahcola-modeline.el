(setq-default mode-line-format
              (list "%04l,%02c"
                    " │ "
                    mode-line-buffer-identification
                    " │ "
                    '(:eval (if buffer-read-only "R" "-"))
                    '(:eval (if (buffer-modified-p) "M" "-"))
                    " │ "
                    mode-line-modes))
