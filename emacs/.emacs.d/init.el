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

(message "Done!")

;; directory containing my personal elisp scripts
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; Configure core configurations: evil, magit, etc
(use-package overall-configs
  :load-path "~/.emacs.d/elisp"
  :demand)


(message "Setup overall configs")

;; Configure core configurations: evil, magit, etc
(use-package python-configs
  :load-path "~/.emacs.d/elisp"
  :demand
  :bind (
	 ("C-c C-o" . python-occur-definitions)))

(use-package lsp-mode
  :hook (c++-mode . lsp)
  :commands lsp
  :ensure t
  :config
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-enable-on-type-formatting nil))

(use-package yaml-mode
  :demand)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; Configure appearances
(use-package theme
  :load-path "~/.emacs.d/elisp"
  :init (message "Configure appearances"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "816bacf37139d6204b761fea0d25f7f2f43b94affa14aa4598bce46157c160c2" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "63df625509cec7b2b7deba1d48ef07ffbee99c735a95d130ad9d1fc3df8b9a34" default)))
 '(package-selected-packages
   (quote
    (evil-collection rg cmake-mode lsp-python-ms lsp-ui lsp-mode yaml-mode dockerfile-mode ag diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
