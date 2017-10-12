;; theme
(load-theme 'zenburn 1)

;; spaceline or powerline
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq powerline-default-separator 'nil)
(spaceline-compile)
(display-battery-mode 1)

;; 最大化
;; (toggle-frame-maximized)

;; 全屏
(menu-bar-mode -1)
(toggle-frame-maximized)
;; (toggle-frame-fullscreen)

;; 设置字体
;; (set-frame-font "YaHei Consolas Hybrid 10")
;; Setting English Font
(set-face-attribute
 'default nil :font "Consolas 10")
;; 避免保存的时候出现选择字符集的提示，MiniBuffer显示里Buffers的速度提升
(set-fontset-font "fontset-default" 'unicode '("Microsoft Yahei" . "unicode-ttf"))
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Microsoft Yahei" :size 14)))

(provide 'init-ui)
