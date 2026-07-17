(use-package kanagawa-themes
  :config
  (load-theme 'kanagawa-wave t))

;; Font
(set-face-attribute 'default nil
  :family "ComicShanns Nerd Font"
  :height 140   ; points × 10, so 140 = 14pt
  :weight 'normal)

(provide 'init-theme)
