;; Completion package
(use-package company
  :ensure t
  :demand
  :bind (
	 ("C-M-i" . company-complete)
	 :map python-mode-map
	 ("C-M-i" . company-complete)
	 :map emacs-lisp-mode-map
	 ("C-M-i" . company-complete)
	 )
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package py-autopep8
  :ensure t)


(use-package smartparens
  :ensure t
  :config
  (progn
    (require 'smartparens-config)
    (sp-local-pair 'org-mode "$" "$")
    (eval-after-load 'org-mode     '(require 'smartparens-org))
    (eval-after-load 'python-mode   '(require 'smartparens-python))
    (show-smartparens-global-mode)
    (smartparens-global-mode)
    (set-face-foreground 'sp-show-pair-match-face "#8ec07c")))



;; very useful function.
(defun python-occur-definitions ()
  "Display an occur buffer of all definitions in the current buffer.
Also, switch to that buffer."
  (interactive)
  (let ((list-matching-lines-face nil))
    (occur "^ *\\(def\\|class\\|cdef\\|cpdef\\) "))
  (let ((window (get-buffer-window "*Occur*")))
    (if window
        (select-window window)
      (switch-to-buffer "*Occur*"))))

(defun python--list-defs-in-buffer ()
  "List definitions found in current buffer."
  (interactive)
  (goto-char (point-min))
  (if (re-search-forward "def" nil t)  ;; Search forward for some regular expression
      (message (thing-at-point 'line))
    (message "do not found any def")
      )
)


(provide 'python-configs)
