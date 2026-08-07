;; Terminal emulator
(use-package vterm
  :commands vterm
  :config
  (evil-define-key 'insert vterm-mode-map (kbd "<escape>") #'vterm-send-escape))

(provide 'init-vterm)
