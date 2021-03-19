;;; programming-settings.el --- Settings for programming(Linux kernel, C code)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; 函数定义与引用的跳转
;; 1. 先安装gnu global: apt-get install global
;; 2. 在源码目录执行:   gtags
;;    会生成3个文件:  GPATH GRTAGS GTAGS
;; 3. M-x ggtags-mode
;;    C/C++模式下会自动打开
(use-package ggtags
  :ensure t
  :bind
  (("C-]" . ggtags-find-definition)
   ("M-]" . ggtags-find-reference)  ;; Alt-]    find the caller...
   ("M-c" . ggtags-find-reference)  ;; Alt-c to find the caller of function
   ([f12] . ggtags-update-tags))
  :config
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1))))
  )

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

;; 读代码时，进到XREF-mode后，将Enter键映射到打开xref-goto-xref
;; 这只是适用于Evil模式，因为Emacs本来就是设好的
(defun evil-ret--do-xref-in-xref (&optional COUNT)
  (interactive)
  (cond ((string= (buffer-name) "*xref*")
	 (xref-goto-xref COUNT))
	((string= (buffer-name) "*ggtags-global*")
	 (compile-goto-error))  ;; Actually, Jumps to the xref location
	(t
	 (evil-ret COUNT))
   )
  )

(defun programming-settings-in-evil ()
  "Apply programming settings if in evil mode."
  (interactive)
  (add-hook 'xref--xref-buffer-mode-hook
	    (lambda ()
	      (define-key evil-motion-state-map (kbd "RET") 'evil-ret--do-xref-in-xref)
	      (define-key evil-motion-state-map (kbd "<return>") 'evil-ret--do-xref-in-xref)
	      ))
  ;; Treat '_' as part of symbol instead of delimiter for evil command
  (add-hook 'c-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'makefile-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'makefile-gmake-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
  )

;; GDB相关
;;   GDB打开时，以多窗口显示
(setq-default gdb-many-windows t)

;;;
(provide 'programming-settings)
