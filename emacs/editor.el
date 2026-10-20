;; -*- lexical-binding: t; -*-
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

;; Format settings
;; Use `terraform fmt` for Terraform buffers.
(add-hook 'terraform-mode-hook
          (lambda ()
            (setq-local format-all-formatters
                        '(("Terraform" terraform-fmt)))))

;; Format Terraform files automatically when saved.
(add-hook 'terraform-mode-hook #'format-all-mode)
(add-hook 'prog-mode-hook #'format-all-mode)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; Fix wslg clipboard issue
;; Found fix here: https://www.lukas-barth.net/blog/emacs-wsl-copy-clipboard/
(setq select-active-regions nil)
