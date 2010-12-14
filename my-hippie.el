;;;; Hippie expand customizations
(provide 'my-hippie)

(require 'hippie-expand)

(defun my-try-expand-all-abbrevs-ci (old)
  "Try to expand abbrevs without case matching."
  (let ((old-case-fold-search case-fold-search)
        result)
    (setq case-fold-search nil)
    (setq result (try-expand-all-abbrevs old))
    (setq case-fold-search old-case-fold-search)
    result
    ))

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        my-try-expand-all-abbrevs-ci
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(global-set-key (kbd "M-/") 'hippie-expand)
