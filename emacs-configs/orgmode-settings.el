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

;;;
(provide 'orgmode-settings)
