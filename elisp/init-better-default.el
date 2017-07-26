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

;; 全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 禁止自动备份文件
(setq make-backup-files nil)

;; 自动保存文件
(setq auto-save-default nil)

;; 保留最近打开的文件
(recentf-mode 1)
(setq recentf-max-menu-items 20)

(require 'dired)
(setq dired-dwim-target t);; 如果分屏显示两个 DiredBuffer 则拷贝就会直接拷贝到另一 DiredBuffer 目录下
(setq dired-recursive-deletes 'always);; 递归删除
(setq dired-recursive-copies 'always);; 递归拷贝
(put 'dired-find-alternate-file 'disabled nil); 去掉 (dired-find-alternate-file) 函数的警告
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file);在当前DiredBuffer打开文件
(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")));返回上一层使用当前 DiredBuffer

;; 设置Speedbar默认显示所有文件
(with-eval-after-load 'speedbar (setq speedbar-show-unknown-files t))

;; 文件关联 major-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
;; 制表符改为空格
(setq-default indent-tabs-mode nil)

(provide 'init-better-default)
