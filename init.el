;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
;; Linum mode
(add-hook 'org-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)

;; 停止烦人的错误提示音
(setq ring-bell-function 'ignore)

;; 高亮当前行
(global-hl-line-mode 1)

;; 显示配个对的括号
(show-paren-mode t)

;; 删除选中的字符
(delete-selection-mode 1)

;; 设置字体
(set-frame-font "YaHei Consolas Hybrid 10")

;; 避免保存的时候出现选择字符集的提示
(set-fontset-font "fontset-default" 'unicode '("YaHei Consolas Hybrid" . "unicode-ttf"))

;; 全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 设置packages的源
(setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; 禁止自动备份文件
(setq make-backup-files nil)

;; Org-mode
;; 在Org-mode中的代码,显示高亮
(require 'org)
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 保留最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 自动安装没有安装的Package
(require 'cl)
(defvar zilongshanren/packages '(
				 company
				 hungry-delete
				 smartparens
				 swiper
				 counsel
				 js2-mode
				 nodejs-repl
				 idea-darkula-theme
				 )  "Default packages")
(setq package-selected-packages zilongshanren/packages)
(defun zilongshanren/packages-installed-p ()
  (loop for pkg in zilongshanren/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (zilongshanren/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg zilongshanren/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; these settings depend packages
;; company mode
(global-company-mode 1)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
;; theme
(push (substitute-in-file-name "~/.emacs.d/idea-darkula-theme/") custom-theme-load-path)
(load-theme 'idea-darkula t)
;; hungry-delete
(global-hungry-delete-mode 1)
;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; smartparens
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;; js2-mode
;; nodejs-repl
(require 'nodejs-repl)
(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
            (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
            (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
            (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))
;; 文件关联 major-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "M-m") nil)
(global-set-key (kbd "M-m f e d") 'open-my-init-file)
(defun kill-other-buffers()
  "Kill all buffers without current buffer."
  (interactive)
  (delete-other-windows)
  (let ((current (buffer-name)))
    (mapcar 'kill-buffer (cdr (buffer-list)))))
(global-set-key (kbd "C-c k") 'kill-other-buffers)
(global-set-key (kbd "C-z") 'undo)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(company-tooltip-idle-delay 0)
 (custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )
 )
