(setq inhibit-splash-screen t)		; no splash screen, thanks
(tool-bar-mode -1)			; no tool bar with icons
(scroll-bar-mode -1)			; no scroll bars
(menu-bar-mode -1)
(global-hl-line-mode)			; highlight current line
(global-set-key (kbd "C-c e") 'eval-region)

(use-package zenburn-theme
  :ensure t
  :demand
  :config
  (message "Configure zenburn")
  )

(provide 'theme)
