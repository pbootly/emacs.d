(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  (doom-themes-padded-modeline 4)
  :config
  ;; Clean synthwave/outrun appearance.
  (load-theme 'doom-outrun-electric t)

  ;; Improve Org faces if you use Org mode.
  (doom-themes-org-config))

(set-face-attribute
 'default nil
 :family "ComicShanns Nerd Font"
 :height 160
 :weight 'light) 

(provide 'init-theme)
