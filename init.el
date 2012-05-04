;;;; Add user lisp path
(add-to-list 'load-path "~/.emacs.d")

;;;; Prevent startup screen
(setq inhibit-startup-screen t)

;;;; Set colors for dark background
(add-to-list 'default-frame-alist '(cursor-color . "#ff0000"))
(add-to-list 'default-frame-alist '(foreground-color . "lightgrey"))
(add-to-list 'default-frame-alist '(background-color . "black"))

;;;; Set title
(setq frame-title-format '("" "%+ %b @ Emacs " emacs-version))

;;;; Set focus follows mouse
(setq focus-follows-mouse t)

;;;; Windows printer setup example
;; (setq printer-name "//xxx/name")
;; (setq ps-printer-name "//xxx/name")

;;;; Enable headers (requires pr)
;; (setq lpr-header-switches t)

;;;; Proper color printing with dark backgrounds
(require 'my-print)

;;;; Enable IDO load file/buffer mod
(require 'ido)
(ido-mode t)
(require 'ido-extensions)

;;;; Tag customization and bindings
(require 'my-tags)

;;;; Show file name
(require 'file-name)
(global-set-key (kbd "C-c f") 'show-file-name)

;;;; Global key bindings
;; Toggle speedbar focus
(global-set-key [(control ?')] 'speedbar-get-focus)
;; Toggle comment key binding
(global-set-key [(control ?\;)] 'comment-or-uncomment-region)
;; Indent on newline by default
(global-set-key [(control ?m)] 'newline-and-indent)


;;;; Save backups in .saves folder w/versions
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.saves"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;;;; Default to indent with spaces, not tabs
(setq-default indent-tabs-mode nil)

;;;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;;;; Desktop saving
;; Load a desktop file if it exists
(desktop-save-mode t)
;; Disable desktop save mode if no file was found
;; This keeps desktops from being saved without explicitly
;; calling desktop-save somewhere first
(defun my-desktop-no-desktop-file-hook ()
  (desktop-save-mode 0))
(add-hook 'desktop-no-desktop-file-hook 'my-desktop-no-desktop-file-hook)

;;;; Set default mode line appearance
;; Move function display before mode display
(setq default-mode-line-format
      '("-"
	mode-line-mule-info
	mode-line-modified
	mode-line-frame-identification
	mode-line-buffer-identification
	"  "
	mode-line-position
	(vc-mode vc-mode)
	"  "
	(which-func-mode ("" which-func-format "--"))
	mode-line-modes
	(global-mode-string ("--" global-mode-string))
	"-%-"))

;; Show which function name in mode line
(which-function-mode t)

;; Enable column numbers
(column-number-mode t)

;;;; Enable Python for SCons files
(add-to-list 'auto-mode-alist '("Scons\\(cript\\|truct\\)" . python-mode))

;;;; Hippie expand
(require 'my-hippie)

;;;; Enable doxymacs
(require 'my-doxy)

;;;; Customize buffer menu/list
(require 'my-buffmenu)
(global-set-key (kbd "C-x C-b") 'my-buffer-menu)

;;;; Default to custom C coding style
(require 'customc)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-set-style "CustomC")
	    (show-paren-mode t)
	    (local-set-key (kbd "C-c o") 'ff-find-other-file)
	    (local-set-key (kbd "C-c p") 'ido-find-file-in-tag-files)
	    (auto-fill-mode 1)))
