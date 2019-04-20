;;; init.el

;; load all configurations settings.org
(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
		   user-emacs-directory))

;; load customize settings 
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))
