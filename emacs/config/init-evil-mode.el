(require-package 'evil)
(require-package 'evil-leader)
; Setup evil leader
(global-evil-leader-mode)
(setq evil-leader/in-all-states t)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "f" 'fuzzy-finder
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "s" 'save-buffer
  "q" 'quit-window
  "n" 'new-buffer
  "i" 'imenu
)

; Enable evil mode
(evil-mode t)


(provide 'init-evil-mode)
