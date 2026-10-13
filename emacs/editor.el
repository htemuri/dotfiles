(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(line-number-mode 1)
(ido-mode 1)
(ido-everywhere 1)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(setq split-width-threshold most-positive-fixnum)

(setq-default inhibit-splash-screen t
              make-backup-files nil
	          warning-minimum-log-level 1
	          indent-tabs-mode nil
	          tab-width 4
              frame-title-format "%b"
              )

(set-face-attribute 'default nil :font "Adwaita Mono-16")
(set-face-attribute 'mode-line nil :font "Adwaita Mono-16")

;; Save auxilary files in the /tmp/ directory instead of current directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
