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
  (global-company-mode 1))

;; Ido-mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
(ido-mode 0)

;; Helm
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ([f10] . helm-recentf))
  :config
    (set-face-background 'helm-selection "blue")
    (set-face-foreground 'helm-selection "gray")
  )

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

;; Magit
(use-package magit
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

;; 编程: C语言缩进
(add-hook 'c-mode-hook
	  (lambda ()
	    (setq c-default-style
		  '((java-mode . "java")
		    (awk-mode . "awk")
		    (other . "linux")))
	    (setq c-basic-offset 8)
	    (setq tab-width 8)
	    (setq backward-delete-char-untabify-method nil)))

;; 平滑滚动
(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 2)
)

;; 窗口管理
(use-package winum
  :ensure t
  :bind (
	 ("M-0" . other-window)
	 ("M-1" . winum-select-window-1)
	 ("M-2" . winum-select-window-2)
	 ("M-3" . winum-select-window-3)
	 ("M-4" . winum-select-window-4)
	 ("M-5" . winum-select-window-5)
	 ("M-6" . winum-select-window-6)
	 ("M-7" . winum-select-window-7)
	 ("M-8" . winum-select-window-8)
	 ("M-9" . winum-select-window-9)
  )
  :config
  (winum-mode 1)
)

;; 美化Modeline, 不显示特殊的Icon
;;   GUI与Terminal是一致的效果
(use-package doom-modeline
  :ensure t
  :defer t
  :hook
  (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-icon nil)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-minor-modes nil)
  :config
  (line-number-mode 0)
  (column-number-mode 0))

;;;
(provide 'plugins-settings)

