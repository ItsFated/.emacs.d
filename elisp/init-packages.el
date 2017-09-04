;;; package --- Summary
;;; Commentary:
;;; 安装第三方包
;;; init-packages.el ends here
;;; Code:

;; 设置packages的源
(setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ("org" . "http://elpa.emacs-china.org/org/")
                         ("gnu" . "http://elpa.emacs-china.org/gnu/")))

;; 自动安装没有安装的Package
(eval-when-compile (require 'cl))
(defvar my-packages '(company
                      hungry-delete
                      smartparens
                      swiper
                      counsel
                      yasnippet
                      which-key
                      winum
                      plantuml-mode
                      ;; web
                      web-mode
                      js2-mode
                      js2-refactor
                      nodejs-repl
                      emmet-mode
                      expand-region
                      multiple-cursors
                      youdao-dictionary
                      markdown-mode
                      ag
                      ;; theme
                      doom-themes
                      idea-darkula-theme
                      zenburn-theme
                      material-theme
                      darktooth-theme
                      all-the-icons
                      all-the-icons-ivy
                      all-the-icons-dired
                      spaceline
                      spaceline-all-the-icons
                      sr-speedbar
                      neotree
                      flycheck) "Default packages")
(setq package-selected-packages my-packages)
(defun install-my-packages ()
  (loop for pkg in my-packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))
(unless (install-my-packages)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my-packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;; which-key
(which-key-mode)
;; multiple-cursors
;; expand-region
;; company mode
(global-company-mode 1)
;; hungry-delete
(global-hungry-delete-mode 1)
;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; smartparens
;; (smartparens-global-mode 1)
(add-hook 'prog-mode-hook 'smartparens-mode)
(with-eval-after-load 'smartparens
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "`" nil :actions nil))

;; youdao dictionary
;; Enable Cache
(setq url-automatic-caching t)
;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)
;; (push "*Youdao Dictionary*" popwin:special-display-config)
;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
;; Enable Chinese word segmentation support (支持中文分词)
;; (setq youdao-dictionary-use-chinese-word-segmentation t)

;; js2-mode
(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
    ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
    (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                               ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                               ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                               ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                               ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                               ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                               ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
          (lambda ()
            (setq imenu-create-index-function 'js2-imenu-make-index)))
;; js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
;; web-mode
(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-enable-current-element-highlight t)
            (setq web-mode-enable-current-column-highlight t)))
;; emmet-mode
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'web-mode-hook 'emmet-mode)
;; yesnippet
(setq yas-snippet-dirs '("~/yasnippet-snippets"))
(yas-global-mode 1)

;; markdown
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq markdown-command "pandoc")))
;; all-the-icons
(all-the-icons-ivy-setup)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; winum-mode
(setq window-numbering-scope            'global
      winum-reverse-frame-list          nil
      winum-auto-assign-0-to-minibuffer t
      winum-auto-setup-mode-line        t
      winum-mode-line-position          1
      winum-ignored-buffers             '(" *which-key*"))
(setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "M-1") 'winum-select-window-1)
      (define-key map (kbd "M-2") 'winum-select-window-2)
      (define-key map (kbd "M-3") 'winum-select-window-3)
      (define-key map (kbd "M-4") 'winum-select-window-4)
      (define-key map (kbd "M-5") 'winum-select-window-5)
      (define-key map (kbd "M-6") 'winum-select-window-6)
      (define-key map (kbd "M-7") 'winum-select-window-7)
      (define-key map (kbd "M-8") 'winum-select-window-8)
      map))
(winum-mode)

;; plantuml-mode
(add-hook
 'org-mode-hook
 (lambda()
   (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))))

(provide 'init-packages)
