(message "process lang_python.el!")

(provide 'lang_python)

(use-package jedi-core
  :ensure t
  :init
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-to-list 'company-backends 'company-jedi)

  (defun non-company-mode-hook ()
    (company-mode -1)
    )
  (add-hook 'jedi-mode-hook 'non-company-mode-hook)
)

(use-package elpy
  :ensure t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (setq elpy-rpc-backend "jedi")
)

(use-package pyvenv
  :ensure t
)

(use-package py-autopep8
  :ensure t
  :init
  (setq py-autopep8-options '("--max-line-length=120"))
  (add-hook 'jedi-mode-hook 'py-autopep8-enable-on-save)
)

(use-package blacken
  :ensure t
)

(use-package py-isort
  :ensure t
)

(add-hook 'python-mode-hook
  (define-key python-mode-map (kbd "C-c u") (lambda () (interactive) (py-isort-buffer) (blacken-buffer)))
)

(setq flycheck-flake8-maximum-line-length 120)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;;; lang_python.el ends here
