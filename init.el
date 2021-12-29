;; package
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; buckup
(setq make-backup-files nil)


;; Appearences
;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'custom-tron-legacy t)

(global-display-line-numbers-mode)

;; highlight parenthesis
(show-paren-mode 1)
