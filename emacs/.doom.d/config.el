;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; UI config
(setq doom-font (font-spec :family "xos4 Terminus" :size 20)
      doom-variable-pitch-font (font-spec :family "Ubuntu"))

;; <C-h> is backspace
(keyboard-translate ?\C-h ?\C-?)
(define-key evil-window-map (kbd "DEL") 'evil-window-left)

;; Evil settings
(setq evil-vsplit-window-right t)
(setq-default evil-ex-search-highlight-all nil)

;; Project settings
(after! projectile-mode
  (projectile-add-known-project "~/memex"))

;; Jump to dired buffers
(defun zd-rename-dired-buffer ()
  (interactive)
  (unless (string-match-p "Dired:" (buffer-name))
    (rename-buffer (generate-new-buffer-name (concat "Dired:" (buffer-name))))))

(add-hook 'dired-mode-hook 'zd-rename-dired-buffer)
(setq evil--jumps-buffer-targets "\\(\\*\\(\\new\\|scratch\\)\\*\\|Dired:.+\\)")
(evil-add-command-properties #'dired-find-file :jump t)
