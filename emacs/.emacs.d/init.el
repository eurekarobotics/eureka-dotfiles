; Commentary:
(require 'package)

;;; Code:
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)


(unless (package-installed-p 'diminish)
  (package-refresh-contents)
  (package-install 'diminish))

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)


;; directory containing my personal elisp scripts
(add-to-list 'load-path "~/.emacs.d/elisp/")


;; Configure core configurations: evil, magit, etc
(use-package overall-configs
  :load-path "~/.emacs.d/elisp"
  :demand)

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
  )


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
   '("63df625509cec7b2b7deba1d48ef07ffbee99c735a95d130ad9d1fc3df8b9a34" default))
 '(package-selected-packages
   '(cmake-mode lsp-python-ms lsp-ui lsp-mode yaml-mode dockerfile-mode ag diminish use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
