;; 不显示启动画面
(setq inhibit-splash-screen 1)

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
         ("\\.[agj]sp\\'" . web-mode))
       auto-mode-alist))

;; 制表符改为空格
(add-hook 'prog-mode-hook (lambda ()
                            (setq indent-tabs-mode nil)))

;;;; 设置编辑环境
;; 设置为中文简体语言环境
(set-language-environment 'Chinese-GBK)
;; 设置emacs 使用 utf-8 下面这个设置会让通过Emacs指令插入的中文字符变成数字编码(\901)
;; (setq locale-coding-system 'utf-8)
;; 设置键盘输入时的字符编码
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; 文件默认保存为 utf-8
(set-buffer-file-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf8)
(set-default-coding-systems 'utf-8)
;; 解决粘贴中文出现乱码的问题
;; (set-clipboard-coding-system 'utf-8)
;; 终端中文乱码
;; (set-terminal-coding-system 'utf-8)
;; (modify-coding-system-alist 'process "*" 'utf-8)
;; (setq default-process-coding-system '(utf-8 . utf-8))
;; 解决文件目录的中文名乱码
;; (setq-default pathname-coding-system 'utf-8)
;; (set-file-name-coding-system 'utf-8)
;; 解决 Shell Mode(cmd) 下中文乱码问题
;; (defun change-shell-mode-coding ()
;;   (progn
;;     (set-terminal-coding-system 'gbk)
;;     (set-keyboard-coding-system 'gbk)
;;     (set-selection-coding-system 'gbk)
;;     (set-buffer-file-coding-system 'gbk)
;;     (set-file-name-coding-system 'gbk)
;;     (modify-coding-system-alist 'process "*" 'gbk)
;;     (set-buffer-process-coding-system 'gbk 'gbk)
;;     (set-file-name-coding-system 'gbk)))

(provide 'init-better-default)
