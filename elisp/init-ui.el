;; theme
(load-theme 'zenburn 1)

;; spaceline or powerline
(require 'spaceline-config)
(spaceline-spacemacs-theme)

;; 最大化
;; (toggle-frame-maximized)

;; 全屏
(menu-bar-mode -1)
(toggle-frame-fullscreen)

;; 设置字体
(set-frame-font "YaHei Consolas Hybrid 10")

;; 避免保存的时候出现选择字符集的提示
;; (set-fontset-font "fontset-default" 'unicode '("YaHei Consolas Hybrid" . "unicode-ttf"))

(provide 'init-ui)
