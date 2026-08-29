;;; init-codex.el --- OpenAI Codex integration -*- lexical-binding: t; -*-

(use-package codex
  :vc (:url "https://github.com/benthamite/codex")
  :commands (codex codex-send-command codex-toggle codex-transient)
  :bind-keymap ("C-c x" . codex-command-map)
  :custom
  (codex-terminal-backend 'app-server))

(provide 'init-codex)
;;; init-codex.el ends here
