(message "process lang_javascript.el!")

(provide 'lang_javascript)

(use-package prettier-js
  :ensure t
  :hook (js-mode . prettier-js-mode)
  :config
  (define-key js-mode-map (kbd "C-c u") #'prettier-js)
)
