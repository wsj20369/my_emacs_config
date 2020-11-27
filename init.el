;; Emacs configs
;; 这些配置基本都是网上抄来的，感谢那些Emacs高手!

;; Emacs配置都放在另一个目录里，因为init.el可能会被Emacs在使用过程中改动
(add-to-list 'load-path "~/.emacs.d/emacs-configs/")
(require 'emacs-configs)

;; 菜单里的设置, 或某些快捷键会改动的地方
;; 打开/关闭菜单: M-x menu-bar-mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("f:/OrgMode/GTD.org")))
 '(custom-enabled-themes (quote (material)))
 '(package-selected-packages
   (quote
    (helm smex json-mode vimrc-mode evil-nerd-commenter evil which-key youdao-dictionary rainbow-delimiters company use-package))))


