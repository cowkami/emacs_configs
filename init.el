;; package
(require 'package)

(setq package-archives
      '(;;("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)
;(package-refresh-contents)

;; buckup
(setq make-backup-files nil)


;; Appearences
;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'custom-tron-legacy t)


;; cursor position
(global-display-line-numbers-mode)
(column-number-mode t)

;; highlight parenthesis
(show-paren-mode 1)

;; install or load packages
(defvar install-package-list
  '(use-package
    lsp-mode
    lsp-python-ms
    lsp-ui
    helm-lsp
    lsp-ivy
    lsp-treemacs
    dap-mode
    which-key))

(dolist (package install-package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;
;; Language server
;;
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((sh-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

;; Python LSP
(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key dap-mode lsp-treemacs lsp-ivy helm-lsp lsp-ui use-package lsp-python-ms)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
