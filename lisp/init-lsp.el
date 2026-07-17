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

;; Associate file extensions directly with tree-sitter modes.
;; (auto-mode-alist decides which mode a filename opens in;
;;  major-mode-remap-alist below only re-routes an *already chosen*
;;  legacy mode, so we need this to actually get into *-ts-mode.)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-ts-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-ts-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-ts-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'" . bash-ts-mode))

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
