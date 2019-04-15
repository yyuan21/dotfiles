(require 'exec-path-from-shell)
;; sets $MANPATH, $PATH, and $exec-path from shell, only on OS X/Linux
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
