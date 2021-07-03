(message "process lang_java.el!")

(provide 'lang_java)

(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4
                                  tab-width 4
                                  indent-tabs-mode nil)))

;;; lang_java.el ends here
