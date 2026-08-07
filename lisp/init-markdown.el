(use-package markdown-mode
  :mode ("\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "pandoc"))

(provide 'init-markdown)
