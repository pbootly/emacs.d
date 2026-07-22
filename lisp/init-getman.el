;; Explore OpenAPI specs with getman (local checkout).
(let ((getman-dir (expand-file-name "~/workspace/personal/getman.el")))
  (when (file-exists-p (expand-file-name "getman.el" getman-dir))
    (add-to-list 'load-path getman-dir)
    (use-package request
      :defer t)
    (use-package yaml
      :defer t)
    (use-package getman
      :ensure nil
      :commands (getman
                 getman-repeat-last
                 getman-copy-curl
                 getman-set-server
                 getman-set-credentials
                 getman-clear-credentials))
    (with-eval-after-load 'evil
      (evil-define-key 'normal 'global (kbd "<leader>ar") #'getman)
      (evil-define-key 'normal 'global (kbd "<leader>aR") #'getman-repeat-last)
      (evil-define-key 'normal 'global (kbd "<leader>ac") #'getman-copy-curl)
      (evil-define-key 'normal 'global (kbd "<leader>as") #'getman-set-server)
      (evil-define-key 'normal 'global (kbd "<leader>aa") #'getman-set-credentials))))

(provide 'init-getman)
