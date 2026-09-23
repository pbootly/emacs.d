;;; init-ellama.el --- Local Ollama coding assistant -*- lexical-binding: t; -*-

;; Ollama's enabled macOS login service supplies http://127.0.0.1:11434.
(use-package ellama
  :ensure t
  :pin gnu
  :bind (("C-c e" . ellama)
         ("C-c a" . ellama-plan-and-act))
  :hook (org-ctrl-c-ctrl-c-hook . ellama-chat-send-last-message)
  :config
  (require 'llm-ollama)
  (setq ellama-provider
        (make-llm-ollama
         :host "127.0.0.1"
         :chat-model "qwen2.5-coder:7b-instruct-q8_0"
         ;; A 16K context leaves memory for Emacs and other apps on this Mac.
         :default-chat-non-standard-params '(("num_ctx" . 16384)))
        ellama-sessions-directory
        (expand-file-name "ellama-sessions" user-emacs-directory))
  (ellama-setup-agentic-coding)
  ;; llm's generic Qwen metadata assumes 128K; compact for our actual 16K.
  (setq ellama-session-auto-compact-token-threshold 12288
        ellama-session-auto-compact-target-token-threshold 6144)
  (ellama-context-header-line-global-mode +1)
  (ellama-session-header-line-global-mode +1))

(provide 'init-ellama)
;;; init-ellama.el ends here
