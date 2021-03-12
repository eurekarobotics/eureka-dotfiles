; Commentary:
(require 'package)

;;; Code:
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(message "here try to initialize")
(package-initialize)

(message "Installing diminish")
(unless (package-installed-p 'diminish)
  (package-refresh-contents)
  (package-install 'diminish))

(message "Installing use-package")
;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package general
  :ensure t
  :config
  (message "Configuring key bindings below"))

(use-package company
  :ensure t
  :demand
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (general-define-key
   :keymaps 'company-active-map
   "C-o" 'company-show-location
   "C-s" 'company-search-candidates
   "M-n" 'company-select-next
   "M-p" 'company-select-previous))

(use-package lsp-mode
  :hook (c++-mode . lsp)
  :commands lsp
  :ensure t
  :config
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-enable-on-type-formatting nil))

;; Package for showing documentation
(use-package lsp-ui
  :ensure t
  :config)

(add-to-list 'load-path "~/.emacs.d/elisp/")

(use-package overall-configs
  :load-path "~/.emacs.d/elisp"
  :demand)

(message "Setup overall configs")
(use-package python-configs
  :load-path "~/.emacs.d/elisp"
  :demand
  :bind (
	 ("C-c C-o" . python-occur-definitions)))

(use-package yaml-mode
  :demand
  :ensure t)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; Configure appearances
(use-package theme
  :load-path "~/.emacs.d/elisp"
  :init (message "Configure appearances"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" default)))
 '(package-selected-packages
   (quote
    (rg zenburn-theme yaml-mode use-package smex smartparens py-autopep8 projectile magit lsp-mode key-chord general evil-surround evil-nerd-commenter evil-collection dracula-theme diminish counsel company ag))))
