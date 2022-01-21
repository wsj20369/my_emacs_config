;; Http Proxy settings

;; Proxy...
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
	("http" . "192.168.1.66:8080")
	("https" . "192.168.1.66:8080")))

;;;
(provide 'http-proxy)
