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
		      popwin
		      expand-region
		      multiple-cursors
		      sr-speedbar
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
;; popwin
(require 'popwin)
(popwin-mode 1)
;; company mode
(global-company-mode 1)
;; hungry-delete
(global-hungry-delete-mode 1)
;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; smartparens
(add-hook 'prog-mode-hook 'smartparens-mode)

(provide 'init-packages)
