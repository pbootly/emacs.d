(use-package gdscript-mode
  :hook (gdscript-mode . eglot-ensure)
  :custom
  (gdscript-eglot-version 3))

(provide 'init-godot)
