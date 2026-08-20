(use-package projectile
  :init
  (projectile-mode 1)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :custom
  (projectile-completion-system 'default)
  (projectile-project-search-path '("~/workspace/"))
  (projectile-switch-project-action #'projectile-find-file))

(use-package consult-projectile
  :after (consult projectile))

(provide 'init-projectile)
