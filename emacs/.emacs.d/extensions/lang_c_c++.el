(message "process lang_c_c++.el!")

(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))

;; template ipp file as cpp mode
(add-to-list 'auto-mode-alist '("\\.ipp$" . c++-mode))

;; indent for openmp
(c-set-offset (quote cpp-macro) 0 nil)

(use-package google-c-style
  :ensure t
  :init
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
)

;; install clangd language server
(use-package lsp-mode
  :ensure t
  :init (yas-global-mode)
  :hook (c++-mode . lsp)
  :hook (c-mode . lsp)
  :hook (lsp-managed-mode .
                (lambda () (setq-local company-backends '(company-capf)))
        )
  :config
    (setq lsp-prefer-flymake nil)
    (setq lsp-enable-links nil)
    (setq company-minimum-prefix-length 1 company-idle-delay 0.0)
)

(use-package company-c-headers
  :ensure t
  :init
  (add-to-list 'company-backends 'company-c-headers)
  (setq company-c-headers-path-system '(
                                        "/usr/include/c++/9/"
                                        "/usr/include"
                                        "/usr/local/include"
                                        "/usr/include/eigen3"
                                        "/usr/local/include/eigen3"
                                        ))
)

;; set clang-format
;; install clang-format and make a symbolic link in /usr/bin/
(use-package clang-format
  :ensure t
  :bind (("C-c i" . clang-format-region)
         ("C-c u" . clang-format-buffer)
        )
  :init
  :config
  (setq clang-format-style-option "llvm")
)

(use-package cuda-mode
  :ensure t
)

(provide 'lang_c_c++)
;;; lang_c_c++.el ends here
