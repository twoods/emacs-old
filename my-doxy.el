;;;; Doxymacs customizations
(provide 'my-doxy)

(require 'doxymacs)

;;;; Custom file comment template
(setq doxymacs-file-comment-template
 '("/**" > n
   " * " (doxymacs-doxygen-command-char) "file" > n
   " *" > n
   " * " (doxymacs-doxygen-command-char) "brief "
   (p "Brief description of this file: ") > n
   " *" > n
   ;; " * " p > n
   " */" > n
   "" > n))

;;;; Custom function comment template
(setq doxymacs-function-comment-template
 '((let ((next-func (doxymacs-find-next-func)))
     (if next-func
	 (list
	  'l
	  "/**" '> 'n
	  " * " (doxymacs-doxygen-command-char) "brief " 'p '> 'n
	  " *" '> 'n
	  " * " 'p '> 'n
	  " *" '> 'n
	  (doxymacs-parm-tempo-element (cdr (assoc 'args next-func)))
	  (unless (string-match
                   (regexp-quote (cdr (assoc 'return next-func)))
                   doxymacs-void-types)
	    '(l " *" > n " * " (doxymacs-doxygen-command-char)
		"return " (p "Returns: ") > n))
	  " */" '>)
       (progn
	 (error "Can't find next function declaration.")
	 nil)))))

;;;; Enable doxymacs for C/C++
(add-hook 'c-mode-common-hook 'doxymacs-mode)

;;;; Enable doxygen highlights for C/C++
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
