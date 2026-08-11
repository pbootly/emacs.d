(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  (corfu-preselect 'prompt)
  (corfu-quit-no-match 'separator)
  :bind (:map corfu-map
              ("C-j" . corfu-next)
              ("C-k" . corfu-previous)
              ("TAB" . corfu-complete)
              ("RET" . corfu-insert))
  :init
  (global-corfu-mode 1)
  :config
  ;; Optional extensions live in separate files (autoloaded)
  (corfu-popupinfo-mode 1)
  (corfu-history-mode 1))

;; TAB should try indent, then completion-at-point (feeds Corfu)
(setq tab-always-indent 'complete
      ;; Emacs 30+: don't steal CAPF in text modes
      text-mode-ispell-word-completion nil)

(use-package cape
  :init
  ;; Global fallbacks; eglot's buffer-local CAPF ends with `t` so these still run
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  :config
  ;; Eglot caches aggressively; bust cache so Corfu auto-completion stays fresh
  (advice-add #'eglot-completion-at-point :around #'cape-wrap-buster))

(use-package yasnippet
  :config
  (yas-global-mode 1))

;; Collection of snippets; without this yas starts with an empty catalog
(use-package yasnippet-snippets
  :after yasnippet)

(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(provide 'init-corfu)
