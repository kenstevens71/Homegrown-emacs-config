;;; all-the-icons-completion-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:



;;; Generated autoloads from all-the-icons-completion.el

(autoload 'all-the-icons-completion-marginalia-setup "all-the-icons-completion" "\
Hook to `marginalia-mode-hook' to bind `all-the-icons-completion-mode' to it.")
(defvar all-the-icons-completion-mode nil "\
Non-nil if All-The-Icons-Completion mode is enabled.
See the `all-the-icons-completion-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `all-the-icons-completion-mode'.")
(custom-autoload 'all-the-icons-completion-mode "all-the-icons-completion" nil)
(autoload 'all-the-icons-completion-mode "all-the-icons-completion" "\
Add icons to completion candidates.

This is a global minor mode.  If called interactively, toggle the
`All-The-Icons-Completion mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='all-the-icons-completion-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "all-the-icons-completion" '("all-the-icons-completion-completion-metadata-get"))

;;; End of scraped data

(provide 'all-the-icons-completion-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; all-the-icons-completion-autoloads.el ends here
