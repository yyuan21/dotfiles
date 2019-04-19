;;; makefile-mode-config.el --- configurations for makefiles

;; set gmake-mode as the default makefile mode
(add-to-list 'auto-mode-alist '("Makefile.*" . makefile-gmake-mode))
