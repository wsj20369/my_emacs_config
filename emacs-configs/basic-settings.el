;; 基本设定

;; 行 高亮
(global-hl-line-mode 1)
(set-face-background 'hl-line "blue")
(set-face-foreground 'highlight "gray")
;; (set-face-foreground 'highlight nil)
(set-face-background 'region "green")
(set-face-foreground 'region "black")

;; 显示行列坐标在Mode line
(line-number-mode 1)
(column-number-mode 1)

;; 显示相对行号
(setq display-line-numbers-type t) ;; 'relative)
(setq display-line-numbers-current-absolute t)
(global-display-line-numbers-mode 1)

;; 时间格式
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; 关掉：菜单，工具栏，滚动条
(when (display-graphic-p)
  (scroll-bar-mode 0)
  )
(tool-bar-mode 0)
(menu-bar-mode 0)

;; 括号匹配高亮
(show-paren-mode 1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改光标样式
;; (setq cursor-type 'bar)

;; 启动时窗口最大化
;; (toggle-frame-maximized)

;; 总是加载最新的文件
(setq load-prefer-newer t)

;; 关闭声音警报
(setq ring-bell-function 'ignore blink-cursor-mode nil)

;; 替换yes-or-no为y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; recently opened files
(require 'recentf)
(setq recentf-max-saved-items 100)
(recentf-mode 1)
(add-to-list 'recentf-keep 'file-remote-p)

;; 场景恢复
(desktop-save-mode 1)

;; 新建窗口的规则:
;;   Helm相关的: 建立新的Buffer并显示在屏幕下方
;;   其它的:     新的Buffer直接覆盖当前窗口, 不要split新的出来
(add-to-list 'display-buffer-alist
	     `(".*" (display-buffer-reuse-window display-buffer-same-window)))
(add-to-list 'display-buffer-alist
	     `(".*helm.*" (display-buffer-at-bottom display-buffer-pop-up-window)))

;; GDB相关
;;   GDB打开时，以多窗口显示
(setq-default gdb-many-windows t)

;;;
(provide 'basic-settings)

