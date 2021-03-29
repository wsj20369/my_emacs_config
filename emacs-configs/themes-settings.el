;;; themes-settings.el --- Choose themes and set colors  -*- lexical-binding: t; -*-

;;; Commentary:
;; Theme & 颜色
;;
;; M-x load-theme, then press Tab to show a list of available themes.
;; M-x disable-theme, to clear theme
;; M-x list-colors-display, to see color names.

;;; Code:

;; Material风格, OrgMode很合适...
(use-package material-theme
  :ensure t
  :config
  )

;; 窗口透明度
(use-package transwin
  :ensure t
  :config
  (when (display-graphic-p)
    (transwin--set-transparency 99)
    )
  )

;;;
(provide 'themes-settings)

;; Local Variables:
;; End:

;;; themes-settings.el ends here
