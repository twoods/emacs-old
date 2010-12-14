;;;; Set up custom C style
(provide 'customc)

(load "cc-mode")
(c-add-style "CustomC"
             '(
               ;;;; Expand tabs with spaces
               (indent-tabs-mode . nil)

               ;;;; Indent 4 spaces
               (tab-width . 4)
               (c-basic-offset . 4)

               ;;;; Line wrapping column
               (fill-column . 79)

               ;;;; Auto fill exclusions
               ;; string - string declarations
               ;; cpp - preprocessor directives
               ;; code - C or C++ code blocks
               ;; c - C comments
               ;; c++ - C++ comments
               ;; Default is '(string cpp code)
               (c-ignore-auto-fill . '(string cpp))

               ;;;; Newlines around braces
               (c-hanging-braces-alist .
                                       ((defun-open before after)
                                        (defun-close before after)
                                        (brace-list-open before after)
                                        (brace-list-close before after)
                                        (brace-entry-open before after)
                                        (statement before after)
                                        (substatement-open before after)
                                        (block-open before after)
                                        (block-close . c-snug-do-while)
                                        (else-clause before after)))

               ;;;; Indent offsets
               (c-offsets-alist .
                                ((statement-block-intro . +)
                                 (knr-argdecl-intro . 0)
                                 (substatement-open . 0)
                                 (label . 0)
                                 (case-label . 0)
                                 (brace-list-open . 0)
                                 (statement-cont . +)
                                 (inline-open . 0)
                                 (inexpr-class . 0)
                                 (arglist-intro . +)
                                 (arglist-cont-nonempty . +)
                                 (arglist-cont . 0)))
               ))
