(defadvice load-theme 
  (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

(require 'solarized)
(require 'noname-theme)
(require 'ujelly-theme)

(setq evil-default-cursor t)
