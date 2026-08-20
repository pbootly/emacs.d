(use-package kanagawa-themes
  :config
  (let ((warning-minimum-level :error))
    (load-theme 'kanagawa-wave t))
  (set-face-attribute 'font-lock-variable-name-face nil :foreground 'unspecified)
  (set-face-attribute 'corfu-current nil :foreground 'unspecified)
  (set-face-attribute 'corfu-bar nil :background 'unspecified))

(set-face-attribute 'default nil
  :family "ComicShanns Nerd Font"
  :height 160   ; points × 10, so 140 = 14pt
  :weight 'normal)

(provide 'init-theme)
