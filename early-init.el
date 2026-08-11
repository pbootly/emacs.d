;; Don't bother resizing frame during startup (minor speed win)
(setq frame-inhibit-implied-resize t)

;; Disable backup~ files entirely
(setq make-backup-files nil)

;; Optional but usually wanted alongside it: disable #autosave# files too
(setq auto-save-default nil)

;; macOS /bsd `ls` has no --dired; don't ask Emacs to pass it
(setq dired-use-ls-dired nil)
