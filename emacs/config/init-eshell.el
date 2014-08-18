(setq eshell-scroll-to-bottom-on-input 'all)
(setq eshell-buffer-shorthand t)
;; em-alias
(setq eshell-aliases-file (concat user-emacs-directory ".eshell-aliases"))
;; em-glob
(setq eshell-glob-case-insensitive t)
(setq eshell-error-if-no-glob t)


(defun eshell/clear ()
  "Clears the buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun my-current-git-branch ()
  (let ((branch (car (loop for match in (split-string (shell-command-to-string "git branch") "\n")
                            when (string-match "^\*" match)
                            collect match))))
    (if (not (eq branch nil))
        (concat " [" (substring branch 2) "]")
      "")))


(defun my-eshell-prompt ()
  (concat (propertize (abbreviate-file-name (eshell/pwd)) 'face 'eshell-prompt)
          (propertize (my-current-git-branch) 'face 'font-lock-function-name-face)
          (propertize " $ " 'face 'font-lock-constant-face)))


;; em-prompt
(setq eshell-prompt-function 'my-eshell-prompt)


(provide 'init-eshell)
