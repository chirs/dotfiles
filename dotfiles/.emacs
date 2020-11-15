; use spaces instead of tabs.
(setq-default indent-tabs-mode nil);
(setq-default tab-width 4)

; Ruby mode
(add-to-list 'load-path "~/.emacs.d/")
(require 'ruby-mode)
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))

;; Scala mode
(defun scala-turn-off-indent-tabs-mode ()
  (setq indent-tabs-mode nil))
(add-hook 'scala-mode-hook 'scala-turn-off-indent-tabs-mode)

(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
(autoload 'scala-mode "~/.emacs.d/scala/scala-mode-auto.el" nil t)

; haml mode
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(autoload 'haml-mode "~/.emacs.d/haml-mode.el" nil t)

;; Javascript mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "~/.emacs.d/javascript.el" nil t)


; these are for formatting soccer data.
(fset 'format-rsssf-game "\C-s-\C-a; \C-s-\C-b\C-r \C-b\C-f;\C-s \C-s\C-b;\C-a\C-n")
(fset 'format-rsssf-colon-game "\C-s:\C-a; \C-s:\C-b-\C-d\C-r \C-b\C-f;\C-s \C-s\C-b;\C-a\C-n")

; (fset 'comment-out "* \C-a\C-n")
(fset 'comment-out "*\C-e\C-f")
(fset 'find-round "\C-sRound\C-aRound: \C-a\C-n")
(fset 'format-round "\C-aRound: \C-a\C-n")
(fset 'format-date "/1907\C-k\C-aDate: \C-a\C-n")
(fset 'delete-move-next-line "\C-d\C-n")
(fset 'kill-blanks ".\C-b\C-k")


(fset 'format-rsssf-game-goals "\C-cg\C-a\C-b\C-b\C-b\C-s[\C-b\C-d\C-s]\C-b\C-d\C-m")


(global-set-key (kbd "C-c g") 'format-rsssf-game)
(global-set-key (kbd "C-c o") 'format-rsssf-colon-game)
(global-set-key (kbd "C-c ]") 'format-rsssf-game-goals)
(global-set-key (kbd "C-c e") 'format-date)
(global-set-key (kbd "C-c k") 'kill-blanks)


(global-set-key (kbd "C-c r") 'format-round)
(global-set-key (kbd "C-c f") 'find-round)

(global-set-key (kbd "C-c c") 'comment-out)
(global-set-key (kbd "C-c d") 'delete-move-next-line)

(global-set-key (kbd "C-c q") 'set-format-date)


(defun set-format-date (year) 
  ( (fset 'format-date "/1907\C-k\C-aDate: \C-a\C-n")
    (global-set-key (kbd "C-c w") 'format-date))
)


