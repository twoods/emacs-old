(provide 'my-buffmenu)

(defun my-buffer-menu (arg)
  (interactive "P")
  (message "%s" arg)
  (if (eq arg 'nil)
      (buffer-menu 't)
    (buffer-menu)))
