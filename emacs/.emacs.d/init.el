(message "start init!")

(package-initialize)

(put 'upcase-region 'disabled nil)

(setq-default indent-tabs-mode nil)

(load "~/.emacs.d/extensions/packages.el")
(load "~/.emacs.d/extensions/color_theme.el")
(load "~/.emacs.d/extensions/global.el")
(load "~/.emacs.d/extensions/commands.el")
(load "~/.emacs.d/extensions/tags.el")
(load "~/.emacs.d/extensions/lang_c_c++.el")
(load "~/.emacs.d/extensions/lang_java.el")
(load "~/.emacs.d/extensions/lang_julia.el")
(load "~/.emacs.d/extensions/lang_python.el")
(load "~/.emacs.d/extensions/lang_rust.el")
(load "~/.emacs.d/extensions/ros.el")

(provide 'init)
;;; init.el ends here
(put 'downcase-region 'disabled nil)
