(package-initialize)
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'init-packages)
(require 'init-better-default)
(require 'init-org)
(require 'init-ui)
(require 'init-functions)
(require 'init-keybindings)
;; File used for storing customization information.
(setq custom-file "~/.emacs.d/elisp/custome-file.el")
(load custom-file)
;; Start Emacs as server
(server-start)
