;;; general-config.el --- general configuration

;; yes/no are too long
(fset 'yes-or-no-p 'y-or-n-p)

;; fix the scrolling to keep pointing in the center
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)

;; Set auto-pair mode on
(electric-pair-mode t)

;; set the default shell
(setq explicit-shell-file-name "/usr/local/bin/zsh")

(autoload 'View-scroll-half-page-forward "view")
(autoload 'View-scroll-half-page-backward "view")

(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)
