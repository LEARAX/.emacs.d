;;; init.el --- user init file -*- no-byte-compile: t -*-

; Borg initialization
(add-to-list 'load-path (expand-file-name "lib/borg" user-emacs-directory))
(require 'borg)
(borg-initialize)

(eval-when-compile (require 'use-package))

; Plugins
(use-package quasi-monochrome-theme
  :config (load-theme 'quasi-monochrome t))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  :config (evil-mode 1))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package ivy
  :config (ivy-mode 1))

(use-package which-key
  :config (which-key-mode))

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package magit
  :config
  (with-eval-after-load 'magit
    (magit-add-section-hook 'magit-status-sections-hook
			    'magit-insert-modules
			    'magit-insert-stashes
			    'append)))

(setq user-full-name "William Culhane"
      user-mail-address "sxroka@gmail.com")

; Org setup
(setq org-directory "~/Documents/org")
(setq org-agenda-files (list org-directory))
(setq org-log-done 'time)

; UI
(setq display-line-numbers-type t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)
