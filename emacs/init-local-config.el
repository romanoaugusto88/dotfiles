; Look'n feel
(set-default-font "DejaVu Sans Mono-11")
(require-package 'ujelly-theme)
(load-theme 'ujelly t)

; Yasnippets
(add-to-list 'yas-snippet-dirs (concat user-emacs-directory "local-config/snippets"))
(yas-reload-all)

; Flycheck
(setq-default flycheck-disabled-checkers '(go-golint))
(add-hook 'after-init-hook #'global-flycheck-mode)

; Auto revert buffer mode
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

; Clean up trailing whitespaces on save
(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode)

; Disable electric pair mode
(electric-pair-mode 0)

; Key bindings
(define-key evil-normal-state-map (kbd "w") 'forward-word)
(define-key evil-normal-state-map (kbd "b") 'backward-word)
; Use Emacs search without regex
(define-key evil-motion-state-map (kbd "/") 'isearch-forward)
(define-key evil-motion-state-map (kbd "?") 'isearch-backward)
(define-key evil-motion-state-map (kbd "n") 'isearch-repeat-forward)
(define-key evil-motion-state-map (kbd "N") 'isearch-repeat-backward)
(define-key evil-motion-state-map (kbd "<RET>") 'clear-highlighted-search)
(key-chord-define-global ",h" 'clear-highlighted-search)
(defun clear-highlighted-search ()
  (interactive)
  (isearch-exit)
  (evil-ex-nohighlight))

; Transpose words
(key-chord-define-global ",t" 'transpose-words)

; Key freq
(require-package 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(provide 'init-local-config)