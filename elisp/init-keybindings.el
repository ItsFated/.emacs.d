;; Emacs 自带功能
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "M-m") nil)
(global-set-key (kbd "M-m f e d") 'open-my-init-file)
(global-set-key (kbd "C-c k") 'kill-other-buffers)
(global-set-key (kbd "C-z") 'undo)
(global-set-key [(control \`)] 'sr-speedbar-toggle)
(global-set-key (kbd "M-s o") 'occur-dwim)
(global-set-key (kbd "C-d") 'sp-kill-whole-line)
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; 第三方
(global-set-key (kbd "C-;") 'mc/mark-all-dwim)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "M-j") 'mc/mark-next-like-this)
(global-set-key (kbd "M-s y") 'youdao-dictionary-search-at-point)
(js2r-add-keybindings-with-prefix "C-c m")

(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
            (define-key js-mode-map (kbd "C-c C-b") 'nodejs-repl-send-buffer)
            (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
            (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
            (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)
            (define-key js-mode-map (kbd "C-c C-c") 'nodejs-repl-quit-or-cancel)))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(add-hook 'org-agenda-mode-hook
          (lambda ()
            (define-key org-agenda-keymap (kbd "TAB") 'org-agenda-show-and-scroll-up)
            (define-key org-agenda-keymap (kbd "<tab>") 'org-agenda-show-and-scroll-up)
            (define-key org-agenda-keymap (kbd "RET") 'org-agenda-goto)
            (define-key org-agenda-keymap (kbd "SPC") 'org-agenda-switch-to)))

(provide 'init-keybindings)
