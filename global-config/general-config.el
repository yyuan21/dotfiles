;;; general-config.el --- general configuration

;; Set auto-pair mode on
(electric-pair-mode t)

;; maximize frame on start up
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; open a second window on the right
(split-window-right)
