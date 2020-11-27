;;; fonts-settings.el --- Choose and set the appropriate font  -*- lexical-binding: t; -*-

;;; Commentary:
;; 字体设定: 在不同系统下，选择合适的字体
;; 在可选字体都不可用时, 默认使用字体: "System"
;; M-x counsel-fonts to get the font name

;;; Code:

(setq my-default-font "System")

(defun my-get-font-list ()
  "Get a font list according to Operating System."
  (cond
   ;; Microsoft Windows
   ((string-equal system-type "windows-nt")
    (setq my-font-size 14)
    '("幼圆"
      "微软雅黑 Light"
      "微软雅黑"))
   ;; Linux
   ((string-equal system-type "gnu/linux")
    (setq my-font-size 12)
    '("Noto Sans Mono CJK SC" ;; Ubuntu上效果不错
      "Noto Mono"
      "FreeMono"
      "DejaVu Sans Mono"
      "Consolas"
      "Ubuntu Mono"))
   ;; MacOS
   ((string-equal system-type "darwin")
    (setq my-font-size 12)
    '("Menlo"))
   ;; Other
   (t
    (setq my-font-size 12)
    my-default-font)
   ))

(defun my-choose-font-available (font-list)
  "Choose the available font in FONT-LIST."
  (let ((choosed-font nil)
	(temp-font-name nil))
    (while (not choosed-font)
      (setq temp-font-name (car font-list))
      (setq font-list (cdr font-list))
      (when (member temp-font-name (font-family-list))
	(setq choosed-font temp-font-name))
      (if (not temp-font-name) (setq choosed-font my-default-font))
      )
    choosed-font
    ))

(defun my-set-font ()
  "Set the font available if in graphics mode."
  (interactive)
  (setq my-font-list (my-get-font-list))
  (setq my-choosed-font (my-choose-font-available my-font-list))
  (setq my-font-name-and-size
	(concat my-choosed-font "-"
		(number-to-string my-font-size)))

  (set-frame-font my-font-name-and-size t t)
  ;; 等宽字体
  (variable-pitch-mode 0)
  (message (concat "Choosed font: " my-font-name-and-size))
  )

;; 只在图形模式下设置字体
(when (display-graphic-p)
  (my-set-font)
  )

;;;
(provide 'fonts-settings)

;; Local Variables:
;; End:

;;; fonts-settings.el ends here
