;;; general-config.el --- general configuration

;; yes/no are too long
(fset 'yes-or-no-p 'y-or-n-p)

;; fix the scrolling to keep pointing in the center
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)

;; Set auto-pair mode on
(electric-pair-mode t)

