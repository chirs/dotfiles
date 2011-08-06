; use spaces instead of tabs.
(setq-default indent-tabs-mode nil);
(setq-default tab-width 4)

; Ruby mode
(add-to-list 'load-path "~/.emacs.d/")
(require 'ruby-mode)
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))

; haml mode
(require '/Users/chrisedgemon/.emacs.d/haml-mode)

;; Javascript mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "~/.emacs.d/javascript.el" nil t)

;; Coffeescript mode
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook '(lambda() (coffee-custom)))
          




