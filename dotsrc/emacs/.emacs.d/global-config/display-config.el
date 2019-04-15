;;; display-config.el --- Display Settings

;; maximize frame on start up
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; open a second window on the right
(split-window-right)

;; get rid of emacs scratch message
(setq initial-scratch-message "")

;; slience the beeps!
(setq visible-bell t)

;; get rid of toolbars and scrollbars
(when (window-system)
  (tool-bar-mode 0)
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
  (scroll-bar-mode -1))

