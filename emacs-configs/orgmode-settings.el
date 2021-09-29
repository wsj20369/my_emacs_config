;; OrgMode设定

(require 'org-capture)

(use-package org 
  :ensure t
  :bind (
	 ("C-c c" . 'org-capture)
	 ("C-c a" . 'org-agenda))
  )

;; 美化Org
(use-package org-bullets
  :ensure t
  :hook ('org-mode . 'org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("☯" "✿" "☢" "☀" "☭" "☛"))
  )

;; 空闲时自动显示Agenda
(use-package idle-org-agenda
  :ensure t
  :after org-agenda
  :config
  (setq idle-org-agenda-interval 300)
  (idle-org-agenda-mode t)
  )

;; 在线显示图片
;; C-c t 重新显示图片
(org-toggle-inline-images t)
(global-set-key (kbd "C-c t") 'org-redisplay-inline-images)

;; 设定图片的大小, 不要太大，也不要太小
(setq org-image-actual-width '(600))

;; 设定Tags的位置，不要太宽
;; (setq org-tags-column -68)
(setq org-tags-column -76)

;;;
(provide 'orgmode-settings)
