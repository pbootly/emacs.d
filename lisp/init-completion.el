(use-package vertico
  :init
  (vertico-mode 1))

(use-package orderless
  :init
  ;; orderless powers both Vertico (minibuffer) and Corfu (in-buffer)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))
(use-package marginalia
  :init
  (marginalia-mode 1))

(use-package consult
  :bind (("C-x b" . consult-buffer)))

(provide 'init-completion)
