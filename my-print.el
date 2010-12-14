;;;; Color printing helper functions
(provide 'my-print)

(require 'ps-print)

;;;; Generate and print a light background PostScript image of the buffer.
;;;; See ps-print-buffer-with-faces for more information.
(defun my-print-buffer-with-faces (&optional filename)
  "Print a light background image of the buffer."
  (interactive (list (ps-print-preprint current-prefix-arg)))
  (let ((fg-color (frame-parameter nil 'foreground-color))
        (bg-color (frame-parameter nil 'background-color)))
    (set-background-color "white")
    (set-foreground-color "black")
    (ps-print-with-faces (point-min) (point-max) filename)
    (set-background-color bg-color)
    (set-foreground-color fg-color)))

;;;; Generate and print a light background PostScript image of the region.
;;;; See ps-print-region-with-faces for more information.
(defun my-print-region-with-faces (from to &optional filename)
  "Print a light background image of the region."
  (interactive (list (ps-print-preprint current-prefix-arg)))
  (let ((fg-color (frame-parameter nil 'foreground-color))
        (bg-color (frame-parameter nil 'background-color)))
    (set-background-color "white")
    (set-foreground-color "black")
    (ps-print-with-faces from to filename t)
    (set-background-color bg-color)
    (set-foreground-color fg-color)))
