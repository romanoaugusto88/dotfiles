(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-nerd-commenter)

; Setup evil leader
(setq evil-leader/in-all-states t)
(setq evil-leader/no-prefix-mode-rx '(".*-mode"))
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "f" 'fuzzy-finder
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "s" 'save-buffer-and-goes-to-normal-mode
  "q" 'quit-window
  "i" 'imenu
  "a" 'back-to-indentation
  "e" 'end-of-line
  "g" 'switch-to-previous-buffer
  "h" 'next-buffer
  ; Workaround to print "comma"(the leader char):
  "," (kbd "C-q ,")
)
; Enable evil-nerd-commenter
(evilnc-default-hotkeys)
; Enable evil mode
(evil-mode t)

(defun save-buffer-and-goes-to-normal-mode ()
  "Evil: Save buffer and goes to normal mode."
  (interactive)
  (save-buffer)
  (evil-normal-state))

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(provide 'init-evil-mode)
