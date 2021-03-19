;; 如果不想用Evil, 在下面加入:disabled即可
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (programming-settings-in-evil)
  )

(use-package evil-nerd-commenter
  :ensure t)

;; Undotree
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq evil-undo-system 'undo-tree)
  )

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
  :disabled
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ([f10] . helm-recentf))
  :config
    (set-face-background 'helm-selection "blue")
    (set-face-foreground 'helm-selection "gray")
  )

;; Ivy+Counsel: 与Helm类似，更轻量，风格也更适合我
(use-package ivy
  :ensure t
  :defer 1
  :bind
  ([remap switch-to-buffer] . #'ivy-switch-buffer)
  :config
  (setq ivy-initial-inputs-alist nil
	ivy-wrap t
	ivy-height 15
	ivy-fixed-height-minibuffer t
	ivy-format-function #'ivy-format-function-line
	)
  (ivy-mode +1)
  )

(use-package ivy-posframe
  :ensure t
  :defer 1
  :after (ivy)
  :init
  (ivy-posframe-mode 1)
  :custom
  (ivy-posframe-parameters
   `((left-fringe  . 0)
     (right-fringe . 0)
     (min-width    . 60)
     (min-height   . ,ivy-height)
     (font         . ,(my-get-choosed-font))
     ;; (background-color   . "gray50")
     (internal-border-width . 1)))
  :config
  (setq ivy-display-function #'ivy-posframe-display-at-point
	ivy-fixed-height-minibuffer nil)
  (setq ivy-posframe-display-functions-alist
	'((swiper              . ivy-display-function-fallback)
	  (complete-symbol     . ivy-posframe-display-at-point)
	  (counsel-M-x         . ivy-posframe-display-at-frame-center)
	  (counsel-find-file   . ivy-posframe-display-at-frame-center)
	  (ivy-switch-buffer   . ivy-posframe-display-at-frame-center)
	  (t                   . ivy-posframe-display-at-frame-center)))
  )

(use-package counsel
  :ensure t
  :defer 1
  :after (ivy)
  :bind (([remap execute-extended-command] . counsel-M-x)
	 ([remap find-file]                . counsel-find-file)
	 ([remap find-library]             . find-library)
	 ([remap imenu]                    . counsel-imenu)
	 ([remap recentf-open-files]       . counsel-recentf)
	 ([remap org-capture]              . counsel-org-capture)
	 ([remap swiper]                   . counsel-grep-or-swiper)
	 ([remap describe-face]            . counsel-describe-face)
	 ([remap describe-function]        . counsel-describe-function)
	 ([remap describe-variable]        . counsel-describe-variable))
  :config
  (setq counsel-find-file-ignore-regexp "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)"
	counsel-rg-base-command "rg -zS --no-heading --line-number --color never %s ."
	counsel-ag-base-command "ag -zS --nocolor --nogroup %s"
	counsel-pt-base-command "pt -zS --nocolor --nogroup -e %s")
  )

(use-package ivy-rich
  :ensure t
  :defer 1
  :after (ivy)
  :config
  (ivy-rich-mode 1)
  )

;; Avy: 快速跳转，快速拷贝
(use-package avy
  :ensure t
  :bind (("C-c g" . avy-goto-line)
	 ("C-c l" . avy-copy-line)
	 ("C-c r" . avy-copy-region))
  )

;; 更好的搜索, 大纲显示搜索结果
(use-package swiper
  :ensure t
  :defer 1
  :bind ("C-s" . swiper))

;; 在工程范围搜索文件
(use-package projectile
  :ensure t
  :defer 1
  :config
  (projectile-mode 1)
  (setq projectile-enable-caching t)
  )

(use-package counsel-projectile
  :ensure t
  :after projectile
  :bind (([f6] . counsel-projectile-find-file)
	 ([remap projectile-find-file]        . counsel-projectile-find-file)
	 ([remap projectile-find-dir]         . counsel-projectile-find-dir)
	 ([remap projectile-switch-to-buffer] . counsel-projectile-switch-to-buffer)
	 ([remap projectile-grep]             . counsel-projectile-grep)
	 ([remap projectile-ag]               . counsel-projectile-ag)
	 ([remap projectile-switch-project]   . counsel-projectile-switch-project))
  :config
  (counsel-projectile-mode 1)
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

;; 平滑滚动
(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 2)
  (add-hook 'ggtags-global-mode-hook
	    (lambda () (setq-local smooth-scroll-margin 1)))
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
  (line-number-mode 1)
  (column-number-mode 0))

;; Markdown mode
(use-package markdown-mode
  :ensure t)

;;;
(provide 'plugins-settings)

