(use-package mason
  :config
  (mason-setup))

;; Tree-sitter grammars, auto-installed on startup if missing
;; (mirrors the mason "wanted" list pattern from nvim config)
(setq treesit-language-source-alist
      '((go     . ("https://github.com/tree-sitter/tree-sitter-go"))
        (rust   . ("https://github.com/tree-sitter/tree-sitter-rust"))
        (python . ("https://github.com/tree-sitter/tree-sitter-python"))
        (c      . ("https://github.com/tree-sitter/tree-sitter-c"))
        (cpp    . ("https://github.com/tree-sitter/tree-sitter-cpp"))
        (bash   . ("https://github.com/tree-sitter/tree-sitter-bash"))))

(dolist (grammar treesit-language-source-alist)
  (let ((lang (car grammar)))
    (unless (treesit-language-available-p lang)
      (message "Installing tree-sitter grammar: %s" lang)
      (treesit-install-language-grammar lang))))

(dolist (mapping '(("\\.go\\'" . go-ts-mode)
		   ("\\.rs\\'" . rust-ts-mode)
		   ("\\.py\\'" . python-ts-mode)
		   ("\\.c\\'" . c-ts-mode)
		   ("\\.cpp\\'" . c++-ts-mode)
		   ("\\.h\\'" . c-ts-mode)
		   ("\\.sh\\'" . bash-ts-mode)))
  (add-to-list 'auto-mode-alist mapping))

;; Prefer tree-sitter modes over legacy equivalents
(dolist (mapping '((go-mode     . go-ts-mode)
                    (rust-mode   . rust-ts-mode)
                    (python-mode . python-ts-mode)
                    (c-mode      . c-ts-mode)
                    (c++-mode    . c++-ts-mode)
                    (sh-mode     . bash-ts-mode)))
  (add-to-list 'major-mode-remap-alist mapping))

(use-package eglot
  :ensure nil
  :hook ((go-ts-mode
          rust-ts-mode
          python-ts-mode
          c-ts-mode c++-ts-mode
          bash-ts-mode) . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               '((c-ts-mode c++-ts-mode) . ("clangd"))))

(provide 'init-lsp)
