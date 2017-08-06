;; theme
(load-theme 'darktooth 1)

;; 最大化
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 全屏
(toggle-frame-fullscreen)

;; 设置字体
(set-frame-font "YaHei Consolas Hybrid 10")

;; 避免保存的时候出现选择字符集的提示
(set-fontset-font "fontset-default" 'unicode '("YaHei Consolas Hybrid" . "unicode-ttf"))

(provide 'init-ui)
