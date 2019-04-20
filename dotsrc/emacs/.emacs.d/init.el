;; load all configurations settings.org
(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
		   user-emacs-directory))

;; load auto-generated custom
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

