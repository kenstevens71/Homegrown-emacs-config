(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t) 

(add-hook 'emacs-startup-hook 'toggle-frame-maximized)
(save-place-mode 1)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package which-key
  :config
  (which-key-mode))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package general
  :ensure t
  :init
  (with-eval-after-load 'evil
    (general-evil-setup))
  (general-auto-unbind-keys)
  :config
  (general-override-mode)
  (general-create-definer +config/leader-key
    :keymaps 'override
    :states  '(insert emacs normal hybrid motion visual operator)
    :prefix "SPC"
    :non-normal-prefix "s-SPC")
  (general-create-definer +config/local-leader
    :keymaps 'override
    :states '(emacs normal hybrid motion visual operator)
    :prefix "m"
    :non-normal-prefix "s-m"
    "" '(:ignore t :which-key (lambda (arg) `(,(cadr (split-string (car arg) " ")) . ,(replace-regexp-in-string "-mode$" "" (symbol-name major-mode)))))))

(use-package marginalia
  :general
  (:keymaps 'minibuffer-local-map
            "M-A" 'marginalia-cycle)
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :init
(marginalia-mode))

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
(all-the-icons-completion-mode))

(use-package vertico
  :custom
  (vertico-count 13)                    ; Number of candidates to display
  (vertico-resize t)
  (vertico-cycle nil) ; Go from last to first candidate and first to last (cycle)?
  :config
(vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless))      ; Use orderless
  (completion-category-defaults nil)    ; I want to be in control!
  (completion-category-overrides
   '((file (styles basic-remote ; For `tramp' hostname completion with `vertico'
                   orderless)))))

(use-package all-the-icons
:if (display-graphic-p))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-henna t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


 (use-package eglot
    :hook (prog-mode . eglot-ensure)
    :init
    (setq eglot-stay-out-of '(flymake))
    :bind (:map
           eglot-mode-map
           ("C-c c a" . eglot-code-actions)
           ("C-c c o" . eglot-code-actions-organize-imports)
           ("C-c c r" . eglot-rename)
           ("C-c c f" . eglot-format)))

(use-package flymake
    :hook (prog-mode . flymake-mode)
    ;; This first bind conflicts with eglot but is left here for
    ;; demonstrative purposes
    :bind (("C-h ." . display-local-help)
          :map flymake-mode-map
          ("C-c ! n" . flymake-goto-next-error)
          ("C-c ! p" . flymake-goto-prev-error)
          ("C-c ! l" . flymake-show-diagnostics-buffer)))


(use-package company
    :ensure t
    :commands (global-company-mode)
    :init
    (global-company-mode)
    :custom
    (company-tooltip-align-annotations 't)
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.1))

;; use-package with package.el:
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("01633566bc8bfca5421d3a9ad7b7d91cb10743437c2996796d83a8bcc146c85a" "18b73ae04a60c4a829f9ad06f17bf82300b27d3ceea497f236cec00b31866cde" "fa362af0e2ae1bda1bab47bc4f15ede63884a2966394d272839d0143a948ec5a" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
