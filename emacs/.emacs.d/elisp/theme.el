(setq inhibit-splash-screen t)		; no splash screen, thanks
(tool-bar-mode -1)			; no tool bar with icons
(scroll-bar-mode -1)			; no scroll bars
(menu-bar-mode -1)
(global-hl-line-mode)			; highlight current line
(global-set-key (kbd "C-c e") 'eval-region)
(set-face-font 'default "Monospace-11") ; default font
(fringe-mode '(4 . 0))                  ; left fringe only, and a very small one

(use-package zenburn-theme
  :ensure t
  :demand
  :config
  (message "Configure zenburn")
  (load-theme 'zenburn)
  )

(use-package dracula-theme
  :ensure t
  :defer
  ;; :config
  ;; (load-theme `dracula)
  )

(provide 'theme)
