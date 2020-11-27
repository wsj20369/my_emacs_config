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

;;;
(provide 'orgmode-settings)
