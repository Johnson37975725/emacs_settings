(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; My Settings
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(setq inferior-lisp-program "clisp")
(setq scheme-program-name "gosh -i")
(transient-mark-mode 1) ;; I was in very trouble about this
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows t)
(setq linum-format "%4d|")

;; dot not save backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; window move
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)

;; install-elisp
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp")

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

(when
    (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))

;; disable vc-git
(setq vc-handled-backends ())

;; enable rectangle selection
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; frequently using commands
(global-set-key [f4] 'goto-line)
(global-set-key [f5] 'replace-string)

;; negate start-up screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;; for multi-term
(require 'multi-term)

;; Check if we are on my Windows 7 box
(setq is-windows (string= system-type "windows-nt"))

;; for windows native emacs 'runemacs'
(if is-windows
    (progn
      (add-hook 'comint-output-filter-functions
                'shell-strip-ctrl-m nil t)
      (add-hook 'comint-output-filter-functions
                'comint-watch-for-password-prompt nil t)
      (setq explicit-shell-file-name "bash.exe")
      (setq shell-file-name explicit-shell-file-name)
      (setq exec-path (cons "C:/cygwin/bin" exec-path))
      (setenv "PATH" (concat "C:\\cygwin\\bin;" (getenv "PATH")))))

;; for Arduino CUI development environment
;; You also need to install 'ino' like 'pip install ino'.
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(load "arduino-mode")
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
