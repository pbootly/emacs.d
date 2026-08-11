;; Terminal emulator

;; Update vterm to directory spawned in so <LEADER tt> can spawn this as a 'code specific' buffer
(defun my/vterm-project ()
  "Open (or switch to) a vterm buffer named after the current project/directory."
  (interactive)
  (let* ((default-directory (or (and (fboundp 'project-current)
                                      (when-let ((proj (project-current)))
                                        (project-root proj)))
                                 default-directory))
         (name (format "*vterm: %s*"
                        (file-name-nondirectory (directory-file-name default-directory))))
	 ;; If buffer for folder exists, re-use it
         (buf (get-buffer name)))
    (if (and buf (buffer-live-p buf))
        (pop-to-buffer buf)
      (let ((vterm-buffer-name name))
        (vterm)))))

(use-package vterm
  :commands vterm
  :config
  (evil-define-key 'insert vterm-mode-map (kbd "<escape>") #'vterm-send-escape))

(provide 'init-vterm)
