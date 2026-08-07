(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-package)
(require 'init-exec-path)
(require 'init-theme)
(require 'init-evil)
(require 'init-vterm)
(require 'init-completion)
(require 'init-lsp)
(require 'init-godot)
(require 'init-getman)
(require 'init-devcontainer)
(require 'init-markdown)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult devcontainer evil-collection exec-path-from-shell
	     gdscript-mode kanagawa-themes marginalia markdown-mode
	     mason nyan-mode orderless swagg verb vertico vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
