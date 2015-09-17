(custom-set-variables
 '(global-linum-mode t)
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue))))

;; Some Settings
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(setq inferior-lisp-program "clisp")
(setq scheme-program-name "gosh -i")
(transient-mark-mode 1) ;; I was in very trouble about this
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows t)
(setq linum-format "%4d|")

;; Do not save backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; window move
(setq windmove-wrap-around t)
(windmove-default-keybindings)

;; install-elisp
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp")

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; emphasize spaces
(when
    (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))

;; disable vc-git
(setq vc-handled-backends ())

;; Since 'Ctrl-SPACE' cannot be applicable for set-mark-command on Ubuntu,
;; use this keybinding in the last resort. At least better than 'Ctrl-@'.
(global-set-key (kbd "C-c SPC") 'set-mark-command)

;; enable rectangle selection
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-c RET") 'cua-set-rectangle-mark)

;; frequently using commands
(global-set-key [f3] 'indent-region)
(global-set-key [f4] 'goto-line)
(global-set-key [f5] 'replace-string)
(global-set-key [f6] 'comment-or-uncomment-region)

;; negate start-up screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;; for multi-term
(require 'multi-term)

;; for Arduino CUI development environment
;; You also need to install 'ino' like 'pip install ino'.
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(load "arduino-mode")
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq web-mode-java-offset   4)
  (setq web-mode-asp-offset    4)
  (setq indent-tabs-mode t)
  (setq tab-width 4))
(add-hook 'web-mode-hook 'web-mode-hook)

;; for SCSS
(require 'scss-mode)
(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)))
(add-hook 'scss-mode-hook  '(lambda() (scss-custom)))

;; for CSS
(add-to-list 'auto-mode-alist '("\\.css$" . scss-mode))

;; for Rakefile
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;; for Haskell mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; for Egison mode
(autoload 'egison-mode "egison-mode" "Major mode for Egison code." t)
(setq auto-mode-alist
      (cons `("\\.egi$" . egison-mode) auto-mode-alist))

;; for Yaml mode
(autoload 'yaml-mode "yaml-mode" "Major mode for YAML file." t)
(setq auto-mode-alist
      (cons `("\\.yml$" . yaml-mode) auto-mode-alist))

;; disable ruby-insert-encoding-magic-comment
(setq ruby-insert-encoding-magic-comment nil)
