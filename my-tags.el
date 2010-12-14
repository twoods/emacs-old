;;;; Customization for tags
(provide 'my-tags)

(require 'etags)

;;;; Find tag for symbol under point
(defun my-find-tag-noconfirm (next-p)
  (interactive "P")
  (find-tag (find-tag-default) next-p))

;;;; Tag key mappings (alternate to M-. RET, M-*)
(global-set-key [(control ?.)] 'my-find-tag-noconfirm)
(global-set-key [(control ?,)] 'pop-tag-mark)
