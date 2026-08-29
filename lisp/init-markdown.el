(use-package markdown-mode
  :mode ("\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "pandoc"))

(defun my/org-markdown-preview-display (buffer _alist)
  "Display the preview in an existing right-hand window when possible."
  (let ((right-window (window-in-direction 'right)))
    (if (window-live-p right-window)
        (progn
          (set-window-buffer right-window buffer)
          right-window)
      (display-buffer-in-side-window
       buffer '((side . right) (slot . 0) (window-width . 0.5))))))

(add-to-list 'display-buffer-alist
             '("\\*xwidget.*\\*"
               (my/org-markdown-preview-display)))

(use-package markdown-xwidget
  :vc (:url "https://github.com/cfclrk/markdown-xwidget"
       :rev :newest)
  :demand t
  :custom
  (markdown-xwidget-command "pandoc")
  :hook (markdown-mode . markdown-xwidget-preview-mode))

(with-eval-after-load 'markdown-mode
  (keymap-set markdown-mode-command-map "g" #'markdown-xwidget-preview-mode))

(provide 'init-markdown)
