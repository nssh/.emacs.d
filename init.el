;;;; Nabin's .emacs file.
; Nabin Sharma
; Dec 10, 2012

;;;; Load required path and start server.
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))
(server-start)

;;;; Turn on ido mode.
(require 'ido)
(ido-mode t)

;;;; Key bindings.
(global-set-key (kbd "M-0")'delete-window)
(global-set-key (kbd "M-1")'delete-other-windows)
(global-set-key (kbd "M-2")'split-window-vertically)
(global-set-key (kbd "M-3")'split-window-horizontally)
(global-set-key (kbd "M-O")'(lambda ()(interactive)(other-window -1)))
(global-set-key (kbd "M-o")'other-window)
(global-set-key (kbd "<f6>") 'fs-lint)
(global-set-key (kbd "<f7>") '(lambda()(interactive)(compile compile-command)))

;;;; Key remappings.
(setq mac-command-modifier 'control)
(setq mac-option-modifier 'meta)

;;;; Appearence.
;; Defalult indentation of 2 spaces.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(menu-bar-mode -1)
(if (fboundp 'tool-bar-mode)(tool-bar-mode -1))
;; Turn off blinking curser.
(blink-cursor-mode 0)
;; Add column numbering to the status bar.
(column-number-mode 1)
;; Single line scrolling.
(setq scroll-step 1)
(setq transient-mark-mode t)
;; Default to line wrapping.
(setq truncate-partial-width-windows nil)
;; Use a visible instead of a beep when a error occurs.
(setq visible-bell t)
;; Remove scrollbar.
(if (fboundp 'scroll-bar-mode)(scroll-bar-mode -1))

;;;; C/C++ file association.
(add-to-list 'auto-mode-alist '("\\.cxx$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hh$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.$hpp" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hxx$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.idl$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ipp$" . c++-mode))
;; Google C style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(setq python-indent 2)

;;;; Backups.
(setq
 backup-by-copying t ; dont clobber symlinks
 backup-directory-alist
 '(("."."~/.emacs-backups"))
 delete-old-versions t
 kept-new-versions 2
 kept-old-versions 2
 version-control t)

;;;; Org mode.
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;;;; Tags.
(require 'etags-select)
(global-set-key (kbd "M-.")'etags-select-find-tag)
(global-set-key (kbd "M-?")'etags-select-find-tag-at-point)