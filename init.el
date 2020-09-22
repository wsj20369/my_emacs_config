;; Emacs configs
;; 这些配置基本都是网上抄来的，感谢那些Emacs高手!

;; 菜单里的设置
;; 打开/关闭菜单: M-x menu-bar-mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(org-agenda-files (quote ("f:/OrgMode/GTD.org")))
 '(package-selected-packages
   (quote
    (vimrc-mode evil-nerd-commenter evil which-key youdao-dictionary rainbow-delimiters company use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "幼圆" :foundry "outline" :slant normal :weight normal :height 139 :width normal)))))

;; 插件管理器
(when (version< emacs-version "27.0")
  (package-initialize))
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

;; 行 高亮
(global-hl-line-mode 1)

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

;; recently opened files
(require 'recentf)
(setq recentf-max-saved-items 100)
(recentf-mode 1)
(add-to-list 'recentf-keep 'file-remote-p)

;; 场景恢复
(desktop-save-mode 1)

;; 新的Buffer直接覆盖当前窗口, 不要split新的出来
(add-to-list 'display-buffer-alist
	     `(".*" (display-buffer-reuse-window display-buffer-same-window)))

;; 总是加载最新的文件
(setq load-prefer-newer t)

;; 关闭声音警报
(setq ring-bell-function 'ignore blink-cursor-mode nil)

;; 下面是插件
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  )

(use-package evil-nerd-commenter
  :ensure t)

;; Completer for Buffer data
(use-package company
  :ensure t
  :bind (("C-c /" . company-complete))
  :diminish company-mode
  :commands company-mode
  :init
  (setq
   company-dabbrev-ignore-case nil
   company-dabbrev-code-ignore-case nil
   company-dabbrev-downcase nil
   company-idle-delay 0
   company-minimum-prefix-length 4)
  :config
  (global-company-mode))

;; 按键提示
(use-package which-key
  :ensure t
  :config
  )

;; 有道词典
(use-package youdao-dictionary
  :ensure t
  :init
  (setq url-automatic-caching t)
  :config
  (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+))

;; 彩虹括号
(use-package 
  rainbow-delimiters
  :ensure t
  :config
  ;; 设置每一级括号的颜色
  (set-face-foreground 'rainbow-delimiters-depth-1-face "orange red")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "gold")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "yellow")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "spring green")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "cyan")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "magenta")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "goldenrod")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "IndianRed1")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "ivory1")

  (set-face-bold 'rainbow-delimiters-depth-1-face "orange red")
  (set-face-bold 'rainbow-delimiters-depth-2-face "gold")
  (set-face-bold 'rainbow-delimiters-depth-3-face "yellow")
  (set-face-bold 'rainbow-delimiters-depth-4-face "spring green")
  (set-face-bold 'rainbow-delimiters-depth-5-face "cyan")
  (set-face-bold 'rainbow-delimiters-depth-6-face "magenta")
  (set-face-bold 'rainbow-delimiters-depth-7-face "goldenrod")
  (set-face-bold 'rainbow-delimiters-depth-8-face "IndianRed1")
  (set-face-bold 'rainbow-delimiters-depth-9-face "ivory1")
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Vim脚本高亮
(use-package vimrc-mode
  :ensure t
  :config
  )

;; Json编辑模式
(use-package json-mode
  :ensure t
  :config
  )

;; 切换 major-mode 的命令
;; 拷贝自: Elisp入门(叶文彬著)
(defvar switch-major-mode-history nil)
(defun switch-major-mode (mode)
  (interactive
   (list
    (intern
     (completing-read "Switch to mode: "
		      obarray (lambda (s)
				(and (fboundp s)
				     (string-match "-mode$" (symbol-name s))))
		      t nil 'switch-major-mode-history))))
  (setq switch-major-mode-history
	(cons (symbol-name major-mode) switch-major-mode-history))
  (funcall mode))
(put 'narrow-to-region 'disabled nil)
