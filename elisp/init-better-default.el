;; 不显示启动画面
(setq inhibit-splash-screen 1)

(put 'erase-buffer 'disabled nil)

;; 不显示工具栏
(tool-bar-mode -1)

;; 不显示滚动条
(scroll-bar-mode -1)

;; 修改输入 yes 或 no 为 y 或 n
(fset 'yes-or-no-p 'y-or-n-p)

;; 自动重新加载在其他地方被修改的文件
(global-auto-revert-mode 1)

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

;; 禁止自动备份文件
(setq make-backup-files nil)

;; 自动保存文件
(setq auto-save-default nil)

;; 保留最近打开的文件
(recentf-mode 1)
(setq recentf-max-saved-items 100)

(setq dired-dwim-target t);; 如果分屏显示两个 DiredBuffer 则拷贝就会直接拷贝到另一 DiredBuffer 目录下
(setq dired-recursive-deletes 'always);; 递归删除
(setq dired-recursive-copies 'always);; 递归拷贝
(put 'dired-find-alternate-file 'disabled nil); 去掉 (dired-find-alternate-file) 函数的警告

;; 设置Speedbar默认显示所有文件
(with-eval-after-load 'speedbar (setq speedbar-show-unknown-files t))

;; 文件关联 major-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
         ("\\.html\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode)
         ("\\.plantuml\\'" . plantuml-mode)
         ("\\.puml\\'" . plantuml-mode))
       auto-mode-alist))

;; 制表符改为空格
(add-hook 'prog-mode-hook (lambda ()
                            (setq indent-tabs-mode nil)))

;; 避免保存的时候出现选择字符集的提示，MiniBuffer显示里Buffers的速度提升
;; (set-fontset-font "fontset-default" 'unicode '("Microsoft Yahei" . "unicode-ttf"))
(set-fontset-font "fontset-default" 'unicode '("Inziu Iosevka SC" . "unicode-ttf"))

;; 编码设置
(when (string= current-language-environment "Chinese-GBK")
  ;; (set-default 'process-coding-system-alist
  ;;              '(("[pP][lL][iI][nN][kK]" gbk . gbk)
  ;;                ("[cC][mM][dD][pP][rR][oO][xX][yY]" gbk . gbk)
  ;;                (".*[aA][gG].*" utf-8-doc . utf-8-doc)))
  (set-default 'file-coding-system-alist
               '(("\\.dz\\'" no-conversion . no-conversion)
                 ("\\.txz\\'" no-conversion . no-conversion)
                 ("\\.xz\\'" no-conversion . no-conversion)
                 ("\\.lzma\\'" no-conversion . no-conversion)
                 ("\\.lz\\'" no-conversion . no-conversion)
                 ("\\.g?z\\'" no-conversion . no-conversion)
                 ("\\.\\(?:tgz\\|svgz\\|sifz\\)\\'" no-conversion . no-conversion)
                 ("\\.tbz2?\\'" no-conversion . no-conversion)
                 ("\\.bz2\\'" no-conversion . no-conversion)
                 ("\\.Z\\'" no-conversion . no-conversion)
                 ("\\.elc\\'" . utf-8-emacs)
                 ("\\.el\\'" . prefer-utf-8)
                 ("\\.utf\\(-8\\)?\\'" . utf-8)
                 ("\\.xml\\'" . xml-find-file-coding-system)
                 ("\\(\\`\\|/\\)loaddefs.el\\'" raw-text . raw-text-unix)
                 ("\\.tar\\'" no-conversion . no-conversion)
                 ("\\.po[tx]?\\'\\|\\.po\\." . po-find-file-coding-system)
                 ("\\.\\(tex\\|ltx\\|dtx\\|drv\\)\\'" . latexenc-find-file-coding-system)
                 ("\\.java\\'" . utf-8))))
;; (defun change-shell-mode-coding-gbk ()
;;   (progn
;;     (set-terminal-coding-system 'gbk)
;;     (set-keyboard-coding-system 'gbk)
;;     (set-selection-coding-system 'gbk)
;;     (set-buffer-file-coding-system 'gbk)
;;     (set-file-name-coding-system 'gbk)
;;     (modify-coding-system-alist 'process "*" 'gbk)
;;     (set-buffer-process-coding-system 'gbk 'gbk)
;;     (set-file-name-coding-system 'gbk)))
;; (if (string= current-language-environment "Chinese-GBK")
;;     (progn
;;       ;; Shell Mode 中文乱码
;;       (add-hook 'shell-mode-hook 'change-shell-mode-coding-gbk)
;;       (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;;       (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)))
;;;; 设置编辑环境
;; 解决文件目录的中文名乱码
;; (setq-default default-file-name-coding-system 'gbk)
;; (set-file-name-coding-system 'gbk)
;; 设置emacs 使用 utf-8
;; (setq locale-coding-system 'utf-8)
;; 文件默认保存为 utf-8
;; (set-buffer-file-coding-system 'utf-8)
;; (set-default buffer-file-coding-system 'utf8)
;; (set-default-coding-systems 'utf-8)
;; 设置键盘输入时的字符编码
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; 设置为中文简体语言环境
;; (set-language-environment 'English)
;; 解决粘贴中文出现乱码的问题
;; (set-clipboard-coding-system 'utf-8)
;; 终端中文乱码
;; (set-terminal-coding-system 'utf-8)
;; (modify-coding-system-alist 'process "*" 'utf-8)
;; (setq default-process-coding-system '(utf-8 . utf-8))

(provide 'init-better-default)
