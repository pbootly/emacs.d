;; Evil mode (Vim keybindings)
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-set-leader nil (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>ff") 'project-find-file)
  (evil-define-key 'normal 'global (kbd "<leader>fg") 'consult-ripgrep)
  (evil-define-key 'normal 'global (kbd "<leader><leader>") 'consult-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>fh") 'consult-history)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(provide 'init-evil)
