(require 'magit)

(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up)

(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up
  (kbd "K") 'magit-discard-item
  (kbd "h") 'magit-toggle-diff-refine-hunk
  (kbd "l") 'magit-key-mode-popup-logging
  (kbd "{") 'magit-goto-previous-sibling-section
  (kbd "}") 'magit-goto-next-sibling-section)

(evil-add-hjkl-bindings magit-commit-mode-map 'emacs
  (kbd "{") 'magit-goto-previous-section
  (kbd "}") 'magit-goto-next-section
  )

(evil-add-hjkl-bindings magit-log-mode-map 'emacs
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up
  )

(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  (kbd "K") 'magit-discard-item)

(require 'magit-blame)
