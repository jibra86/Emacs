(setq visible-bell t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(global-display-line-numbers-mode 1)
(add-hook 'org-mode-hook (lambda () (org-toggle-pretty-entities)))
(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 100 100))
(setq backup-directory-alist `(("." . "~/.emacsBaks/")))
(setq org-agenda-files (list "~/Org/Agenda.org"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-indent-mode 1)))
(setq org-hide-emphasis-markers t)
(which-key-mode t)
(ivy-mode t)
;; (evil-mode t)
(recentf-mode t)
(setq python-guess-indent-offset nil)
(setq-default cursor-type 'hbar)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 100 100))

(require 'package)
(add-to-list 'package-archives
	     '("melpa". "https://melpa.org/packages/"))
;; (package-refresh-contents)
(package-initialize)

(global-set-key (kbd "C-c v") 'split-window-right)
(global-set-key (kbd "C-c h") 'split-window-below)
(global-set-key (kbd "C-c n") 'make-frame-command)

(setq default-frame-alist 
      (add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font 12")))

(global-set-key (kbd "C-c d") 'dired)
(global-set-key (kbd "C-c f") 'dired-create-empty-file)
(global-set-key (kbd "C-c g") 'dired-create-directory)
(global-set-key (kbd "C-c l") 'visual-line-mode)
(global-set-key (kbd "C-c t") 'ansi-term)
(global-set-key (kbd "C-c s t") 'tree-sitter-hl-mode)
(global-set-key (kbd "C-c s l") 'lsp)
(global-set-key (kbd "C-c r") 'replace-string)

(global-set-key (kbd "C-c a") (lambda () (interactive) (find-file "~/Org/Agenda.org")))

(setq initial-buffer-choice "~/.emacs.d/myStartPage/start.org")
