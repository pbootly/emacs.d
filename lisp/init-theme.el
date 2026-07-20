(use-package kanagawa-themes
  :config
  (load-theme 'kanagawa-wave t))

;; Font
(set-face-attribute 'default nil
  :family "ComicShanns Nerd Font"
  :height 140   ; points × 10, so 140 = 14pt
  :weight 'normal)

;; A very important Emacs package
(use-package nyan-mode
  :functions nyan-mode
  :config (nyan-mode))

(provide 'init-theme)
