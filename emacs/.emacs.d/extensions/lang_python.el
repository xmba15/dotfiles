(message "process lang_python.el!")

(provide 'lang_python)

;; install language server pip install python-lsp-server
(use-package lsp-mode
  :ensure t
  :init
  :hook (python-mode . lsp-deferred)
  :config
     (setq lsp-pyls-plugins-mccabe-enabled nil
           lsp-pyls-plugins-pycodestyle-enabled nil
           lsp-pyls-plugins-flake8-enabled t
     )
    (setq company-minimum-prefix-length 1 company-idle-delay 0.0)
)

(use-package lsp-ui
  :ensure t
  :config
    (setq lsp-ui-imenu-enable t)
    (setq lsp-headerline-breadcrumb-enable t)
)

(use-package pyvenv
  :ensure t
  :config
    (setq pyvenv-workon "emacs")  ; Default venv
    (pyvenv-tracking-mode 1)  ; Automatically use pyvenv-workon via dir-locals
)

(use-package blacken
  :ensure t
)

(use-package py-isort
  :ensure t
)

(use-package python-mode
  :ensure t
  :bind
    (:map python-mode-map
              ("C-c u" . (lambda () (interactive) (py-isort-buffer) (blacken-buffer))
              )
    )
)

(use-package numpydoc
  :ensure t
  :bind (:map python-mode-map
              ("C-c M-d" . numpydoc-generate)
        )
)

;;; lang_python.el ends here
