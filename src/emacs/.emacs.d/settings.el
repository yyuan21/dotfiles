(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;;; To install a package, simply add its name to 'pkg-list' and reload emacs

;; Set 'pkg-list' as an array containing the packages
(setq pkg-list '(magit
         helm
         helm-gtags
         org
         smex
         flycheck
         flycheck-rust
         pdf-tools
         multi-term
         auto-complete
         solidity-mode
         tide
         tuareg
         typescript-mode
         go-mode
         vue-mode
         rust-mode
         php-mode
         haskell-mode
         rfc-mode
         glsl-mode
         terraform-mode
         cargo
         yasnippet
         yasnippet-snippets
         multiple-cursors
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

;; yes/no are too long
(fset 'yes-or-no-p 'y-or-n-p)

;; fix the scrolling to keep pointing in the center
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)

;; Set auto-pair mode on
(electric-pair-mode t)

;; set the default shell
(setq explicit-shell-file-name "/usr/local/bin/zsh")

(setq backup-directory-alist '(("." . "~/dotfiles/temp/emacs"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; tab length
(setq-default tab-width 4)

;; maximize frame on start up
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; open a second window on the right (disabled)
;; (split-window-right)

;; get rid of emacs scratch message
(setq initial-scratch-message "")

;; show column number as well
(setq column-number-mode t)

;; slience the beeps!
(setq visible-bell t)

;; get rid of toolbars and scrollbars
(when (window-system)
  (tool-bar-mode 0)
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
  (scroll-bar-mode -1))

;; text-node auto wrap text
(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 80)

;; set default style
(defun my-c-setup ()
  (c-basic-offset 2))
(add-hook 'c-mode-hook 'my-c-setup)

(defun my-c++-setup ()
   (c-set-offset 'innamespace 0))
(add-hook 'c++-mode-hook 'my-c++-setup)

;; set gmake-mode as the default makefile mode
(add-to-list 'auto-mode-alist '("Makefile.*" . makefile-gmake-mode))

;; set zsh-theme files' default mode to sh-mode
(add-to-list 'auto-mode-alist '("\\.zsh-theme\\'" . sh-mode))

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'exec-path-from-shell)
;; sets $MANPATH, $PATH, and $exec-path from shell, only on OS X/Linux
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'flycheck)
(global-flycheck-mode)

(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(require 'helm-gtags)
;;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; customize
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

;; key bindings
(with-eval-after-load 'helm-gtags
  (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
  (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
  (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
  (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack))

(require 'multi-term)
;; set default shell
(setq multi-term-program (shell-command-to-string "echo -n $(which zsh)"))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'solidity-mode)
;; Set the default solity comment style as /* */
(setq solidity-comment-style 'star)

(require 'rfc-mode)
;; set $HOME/rfc as the location of all RFC documents
(setq rfc-mode-directory (expand-file-name "~/rfc/"))

(require 'terraform-mode)
;; indentation size
(custom-set-variables
 '(terraform-indent-level 4))

(require 'yasnippet)
(setq yas-snippet-dirs
      (append yas-snippet-dirs
	      '("~/.emacs.d/snippets")))
(yas-global-mode 1)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; run rustfmt
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(require 'multiple-cursors)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
