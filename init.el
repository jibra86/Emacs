;; -*- lexical-binding: t; -*-

;; ============================================================
;; Package archives
;; ============================================================
(require 'package)
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; ============================================================
;; Install use-package for tidy configuration
;; ============================================================
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Always ensure packages are installed
(setq use-package-always-ensure t)

;; ============================================================
;; Dark theme
;; ============================================================
(load-theme 'modus-operandi-tinted t)

;; ============================================================
;; My Setup
;; ============================================================
(setq backup-directory-alist `(("." . "~/.emacsBaks/")))

;; ============================================================
;; Org Mode Setup
;; ============================================================
(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  ;; Enable in your global agenda view
  (org-agenda-finalize . org-modern-mode)
  :config
  ;; Customize the exact bullets you want for each heading depth
  (set-face-attribute 'org-level-1 nil :height 1.3 :weight 'bold)
  (set-face-attribute 'org-level-2 nil :height 1.15 :weight 'bold)
  (set-face-attribute 'org-level-3 nil :height 1.05 :weight 'bold)
  (set-face-attribute 'org-level-4 nil :height 1.0 :weight 'bold)
  ;;(setq org-modern-replace-stars "◉○◈◇✳")
  )

(global-font-lock-mode 1)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (add-hook 'org-mode-hook (lambda () (org-indent-mode 1)))

;; ============================================================
;; Markdown Mode
;; ============================================================
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :init
  ;; Use gfm-mode (GitHub Flavored Markdown) for standard .md files
  (setq markdown-command "multimarkdown")
  :config
  ;; Hide the raw markdown markup syntax (like ** and _) to show clean rich text
  (setq markdown-hide-markup t)
  
  ;; Fontify/syntax-highlight code inside code blocks natively
  (setq markdown-fontify-code-blocks-natively t)
  
  ;; Enable automatic line wrapping so text doesn't run off the screen
  (add-hook 'markdown-mode-hook 'visual-line-mode))

;; ============================================================
;; Keybinds
;; ============================================================
(global-set-key (kbd "C-c d") 'dired)
(global-set-key (kbd "C-c f") 'dired-create-empty-file)
(global-set-key (kbd "C-c g") 'dired-create-directory)
(global-set-key (kbd "C-c l") 'visual-line-mode)
(global-set-key (kbd "C-c t") 'ansi-term)
(global-set-key (kbd "C-c s t") 'tree-sitter-hl-mode)
(global-set-key (kbd "C-c r") 'replace-string)

;; ============================================================
;; Windows Keybinds
;; ============================================================
(global-set-key (kbd "C-c v") 'split-window-right)
(global-set-key (kbd "C-c h") 'split-window-below)
(global-set-key (kbd "C-c n") 'make-frame-command)

;; ============================================================
;; Fonts
;; ============================================================
(setq default-frame-alist 
      (add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font 12")))

;; ============================================================
;; Ivy Mode
;; ============================================================
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "))

;; ============================================================
;; Persistent undo history (undo across file closes/reopens)
;; ============================================================
(use-package undo-tree
  :config
  (global-undo-tree-mode)
  ;; Save undo history in a dedicated directory
  (setq undo-tree-history-directory-alist
        `((".*" . ,(concat user-emacs-directory "undo-tree-hist/"))))
  (setq undo-tree-auto-save-history t))

;; ============================================================
;; Auto‑completion framework
;; ============================================================
(use-package company
  :config
  (global-company-mode)
  (setq company-idle-delay 0.3
        company-minimum-prefix-length 2))

;; ============================================================
;; LSP support (built‑in eglot) for Python & C
;; ============================================================
(use-package eglot
  :hook ((python-mode . eglot-ensure)
         (c-mode      . eglot-ensure)
         (c++-mode    . eglot-ensure))
  :config
  (add-to-list 'company-backends 'company-capf))
;; Optional: nicer LSP UI
(use-package flymake
  :ensure nil   ; built‑in
  :hook ((python-mode . flymake-mode)
         (c-mode      . flymake-mode)
         (c++-mode    . flymake-mode)))

;; ============================================================
;; Helpful general defaults
;; ============================================================
;; (global-display-line-numbers-mode 1)   ; line numbers
;; (column-number-mode 1)
(setq-default indent-tabs-mode nil)    ; spaces instead of tabs
(fset 'yes-or-no-p 'y-or-n-p)         ; shorter confirmations

;; Remember cursor position in files
(save-place-mode 1)

;; Show matching parens
(show-paren-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company ivy markdown-mode org-modern undo-tree)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
