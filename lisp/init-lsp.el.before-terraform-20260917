(use-package mason
  :config
  (mason-setup
    (unless (mason-installed-p "typescript-language-server")
      (mason-install "typescript-language-server"))))

;; Tree-sitter grammars, auto-installed on startup if missing
;; (mirrors the mason "wanted" list pattern from nvim config)
(setq treesit-language-source-alist
      '((go         . ("https://github.com/tree-sitter/tree-sitter-go"))
        (rust       . ("https://github.com/tree-sitter/tree-sitter-rust"))
        (python     . ("https://github.com/tree-sitter/tree-sitter-python"))
        (c          . ("https://github.com/tree-sitter/tree-sitter-c"))
        (cpp        . ("https://github.com/tree-sitter/tree-sitter-cpp"))
        (bash       . ("https://github.com/tree-sitter/tree-sitter-bash"))
        (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
        (yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))
        (tsx        . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
	(hcl . ("https://github.com/tree-sitter-grammars/tree-sitter-hcl"))
        (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))))

(dolist (grammar treesit-language-source-alist)
  (let ((lang (car grammar)))
    (unless (treesit-language-available-p lang)
      (message "Installing tree-sitter grammar: %s" lang)
      (treesit-install-language-grammar lang))))

(use-package terraform-mode)

(dolist (mapping '(("\\.go\\'" . go-ts-mode)
                   ("\\.rs\\'" . rust-ts-mode)
                   ("\\.py\\'" . python-ts-mode)
                   ("\\.c\\'" . c-ts-mode)
                   ("\\.cpp\\'" . c++-ts-mode)
                   ("\\.h\\'" . c-ts-mode)
                   ("\\.sh\\'" . bash-ts-mode)
                   ("\\.ts\\'" . typescript-ts-mode)
                   ("\\.tsx\\'" . tsx-ts-mode)
                   ("\\.jsx?\\'" . js-ts-mode)
                   ("\\.mjs\\'" . js-ts-mode)
                   ("\\.yaml\\'" . yaml-ts-mode)
		   ("\\.tf\\'" . hcl-ts-mode)
                   ("\\.cjs\\'" . js-ts-mode)))
  (add-to-list 'auto-mode-alist mapping))

;; Prefer tree-sitter modes over legacy equivalents
(dolist (mapping '((go-mode         . go-ts-mode)
		   (rust-mode       . rust-ts-mode)
		   (python-mode     . python-ts-mode)
		   (c-mode          . c-ts-mode)
		   (c++-mode        . c++-ts-mode)
		   (sh-mode         . bash-ts-mode)
		   (typescript-mode . typescript-ts-mode)
		   (js-mode         . js-ts-mode)
		   (yaml-mode         . yaml-ts-mode)
		   (hcl-mode . hcl-ts-mode)
		   (js2-mode        . js-ts-mode)))
  (add-to-list 'major-mode-remap-alist mapping))

;; Bun / Node project roots for eglot + project.el
(with-eval-after-load 'project
  (dolist (marker '("package.json" "tsconfig.json" "jsconfig.json"
                    "bun.lock" "bun.lockb"))
    (add-to-list 'project-vc-extra-root-markers marker)))

(defun my/eglot-buffer-line-numbers ()
  "Turn on relative line numbers in eglot-managed buffers."
  (setq-local display-line-numbers-type 'relative)
  (display-line-numbers-mode 1))

(use-package eglot
  :ensure nil
  :hook ((go-ts-mode
          rust-ts-mode
          python-ts-mode
          c-ts-mode c++-ts-mode
          bash-ts-mode
          typescript-ts-mode
          tsx-ts-mode
	  hcl-ts-mode
          js-ts-mode) . eglot-ensure)
  :hook ((go-ts-mode
          rust-ts-mode
          python-ts-mode
          c-ts-mode c++-ts-mode
          bash-ts-mode
          typescript-ts-mode
          tsx-ts-mode
	  hcl-ts-mode
          js-ts-mode) . my/eglot-buffer-line-numbers)
  :config
  (add-to-list 'eglot-server-programs
               '((c-ts-mode c++-ts-mode) . ("clangd")))
  ;; Eglot already maps TS/JS modes to typescript-language-server by default.
  (add-to-list 'eglot-server-programs
               '((typescript-ts-mode tsx-ts-mode js-ts-mode)
                 . ("typescript-language-server" "--stdio"))))

(provide 'init-lsp)


