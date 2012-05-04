(provide 'my-buffmenu)

(defun my-buffer-menu (arg)
  "Show buffer menu with only files by default.  With prefix,
show all buffers."
  (interactive "P")
  (if (eq arg 'nil)
      (buffer-menu 't)
    (buffer-menu)))
