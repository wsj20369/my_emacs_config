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

;; 基本设定
(require 'basic-settings)

;; 各种插件
(require 'plugins-settings)

;; 字体
(require 'fonts-settings)

;; OrgMode设定
(require 'orgmode-settings)

;;;
(provide 'emacs-configs)

