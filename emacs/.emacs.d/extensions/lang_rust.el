(message "process lang_rust.el")

;; rust environment setup
;; https://emacs-jp.github.io/env/rust

(add-to-list 'exec-path (expand-file-name "~/.cargo/bin"))

(use-package rust-mode
  :ensure t
  :init
  (add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))

  ;; uncomment the following line to format on save
  ;; :custom rust-format-on-save t
)

;; C-c C-f rust-format-buffer

(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode)
)

(use-package flycheck-rust
  :ensure t
  :init
  (eval-after-load 'flycheck
    '(add-hook 'rust-mode-hook #'flycheck-rust-setup))
)

;; rust formatter: rustfmt
;; rust linter: clippy
;; rustup lsp: rls

;; managing cargo dependencies
;; https://github.com/killercup/cargo-edit
;; cargo install cargo-edit

;; Rust Analyzer
;; https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary

(use-package lsp-mode
  :ensure t
  :init (yas-global-mode)
  :hook (rust-mode . lsp)
  :bind ("C-c h" . lsp-describe-thing-at-point)
  :custom (lsp-rust-server 'rust-analyzer))

(use-package lsp-ui
  :ensure t
)

(provide 'lang_rust)
;;; lang_rust.el ends here
