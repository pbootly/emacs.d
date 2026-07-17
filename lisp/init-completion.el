;; Native inline completion preview (Emacs 30+)
(global-completion-preview-mode 1)

(use-package vertico
  :init
  (vertico-mode 1))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode 1))

(use-package consult)

(provide 'init-completion)
