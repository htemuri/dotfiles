;; custom variable setup
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; packages install and load
(load (expand-file-name "package.el" user-emacs-directory))

;; editor config
(load (expand-file-name "editor.el" user-emacs-directory))

;; theming
(load (expand-file-name "theme.el" user-emacs-directory))

