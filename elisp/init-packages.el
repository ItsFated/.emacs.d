;;; package --- Summary
;;; Commentary:
;;; 安装第三方包
;;; init-packages.el ends here
;;; Code:

;; 设置packages的源
(setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; 自动安装没有安装的Package
(eval-when-compile (require 'cl))
(defvar my-packages '(company
		      hungry-delete
		      smartparens
		      swiper
		      counsel
		      js2-mode
		      nodejs-repl
		      idea-darkula-theme
		      expand-region
		      multiple-cursors
		      sr-speedbar
		      youdao-dictionary
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
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil))

;; youdao dictionary
;; Enable Cache
(setq url-automatic-caching t)
;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)
;; (push "*Youdao Dictionary*" popwin:special-display-config)
;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
;; Enable Chinese word segmentation support (支持中文分词)
;; (setq youdao-dictionary-use-chinese-word-segmentation t)

(provide 'init-packages)
