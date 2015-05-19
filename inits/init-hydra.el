(require 'hydra)

(defun asok/set-hydra-faces ()
  (set-face-attribute
   'hydra-face-red nil
   :foreground (face-attribute 'font-lock-constant-face :foreground))
  (set-face-attribute
   'hydra-face-blue nil
   :foreground (face-attribute 'font-lock-string-face :foreground)))

(defun google-query ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: " (concat (thing-at-point 'symbol) " "))))))

(defadvice load-theme
    (after set-hydra-faces activate)
  (asok/set-hydra-faces))

(asok/set-hydra-faces)

(defhydra hydra-eval (:color blue)
  "Eval"
  ("e" eval-expression "expression")
  ("d" eval-defun "defun")
  ("b" eval-buffer "buffer")
  ("l" eval-last-sexp "last sexp"))

(defhydra hydra-projectile (:color blue)
  "Projectile"
  ("f" helm-projectile-find-file "find file")
  ("g" helm-projectile-find-file-dwim "find file dwim")
  ("F" helm-projectile-find-file-in-known-projects "file in projects")
  ("p" helm-projectile-switch-project "switch project")
  ("P" projectile-test-project "test")
  ("a" helm-projectile-ag "ag"))

(defhydra hydra-hl (:color blue)
  "Highlight"
  ("s" highlight-symbol-at-point "symbol at point")
  ("i" highlight-indentation-mode "indentation")
  ("h" hi-lock-mode "toggle hi-lock-mode"))

(defhydra hydra-winner (:color red)
  "Winner"
  ("h" winner-undo "undo")
  ("l" winner-redo "redo"))

(setq asok/hydra-global-heads
      '(
        ("0" delete-window "delete window")
        ("1" delete-other-windows "delete other windows")
        ("2" split-window-below "split horizontally")
        ("3" split-window-right "split vertically")
        ("w" hydra-winner/body "winner")
        ("o" helm-swoop "swoop")
        ("k" helm-show-kill-ring "kill ring")
        ("m" helm-all-mark-rings "all mark rings")
        ("f" helm-find-files "find files")
        ("d" ido-dired "dired")
        ("x" helm-M-x "M-x")
        ("." helm-resume "helm resume")
        ("g" google-query "google query")
        ("c" magit-status "git status")
        ("C" magit-checkout "git checkout")
        ("a" ag-project "ag project")
        ("A" ag "ag dir")
        ("SPC" evil-ace-jump-word-mode "ace jump")
        ("h" hydra-hl/body "highlight")
        ("p" hydra-projectile/body "projectile")
        ("e" hydra-eval/body "eval")
        )
      )

(eval
 `(defhydra hydra-spawn-global (:color blue)
    "Hydra"
    ,@asok/hydra-global-heads))

(evil-define-key 'normal global-map (kbd "<SPC>") 'hydra-spawn-global/body)
(evil-define-key 'motion global-map (kbd "<SPC>") 'hydra-spawn-global/body)

(evil-declare-not-repeat 'hydra-spawn-global/body)