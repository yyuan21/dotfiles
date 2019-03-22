;;;;;;;;;;;;;;;;;;;; Start Package Management ;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;;; To install a package, simply add its name to 'pkg-list' and reload emacs

;; Set 'pkg-list' as an array containing the packages
(setq pkg-list '(magit
		 helm
		 flycheck
		 pdf-tools
		 auto-complete
		 solidity-mode
		 yasnippet
		 yasnippet-snippets
		 exec-path-from-shell
		 color-theme-sanityinc-tomorrow))

(dolist (pkg pkg-list)
  ;; for each package in the package list
  (unless (package-installed-p pkg)
    ;; if pkg is not install, install it
    (condition-case nil
	(package-install pkg)
      (error
       (package-refresh-contents)))))
;;;;;;;;;;;;;;;;;;;; End Package Management ;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;; General Configuration Start ;;;;;;;;;;;;;;;;;;;;
;; Set auto-pair mode on
(electric-pair-mode t)

;; loads all *.el package config files in ./pkgs-config directory
(defun load-directory (dir)
      (let ((load-it (lambda (f)
		       (load-file (concat (file-name-as-directory dir) f)))
		     ))
	(mapc load-it (directory-files dir nil "\\.el$"))))
    (load-directory "./pkgs-config/")
;;;;;;;;;;;;;;;;;;;; General Configuration End ;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;; Start Auto-Generated Section ;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#515151" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#cccccc"))
 '(beacon-color "#f2777a")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(package-selected-packages (quote (magit color-theme-sanityinc-tomorrow)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;;;;;;;;;;;;;;;;; End Auto-Generated Section ;;;;;;;;;;;;;;;;;;;;
