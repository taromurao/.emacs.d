(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)
(global-linum-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; Auto-bracket closing
(electric-pair-mode 1)

;; the package manager
(require 'package)
(setq
 use-package-always-ensure t
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; hide unnecessary GUIs
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; set color theme
(load-theme 'deeper-blue t)

;; Install packages
(use-package ensime
  :commands ensime ensime-mode)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-mode)

(setq exec-path (append exec-path '("/usr/bin")))
