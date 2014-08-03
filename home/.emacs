
(show-paren-mode 1)

(setq line-number-mode t)
(setq column-number-mode t)

(require 'package)
(package-initialize)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-archives '(;("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "~/software/notmuch-0.16/share/emacs/site-lisp/")

(load-theme 'zenburn t)

(require 'evil)
    (evil-mode 1)

(global-font-lock-mode 1)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Enable ghc-mod
;(autoload 'ghc-init "ghc" nil t)
;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)

(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)))

(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-mode"
  '(progn
    (define-key haskell-mode-map (kbd "C-x C-d") nil)
    (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
    (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
    (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
    (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
    (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
    ;; Jump to the imports. Keep tapping to jump between import
    ;; groups. C-u f8 to jump back again.
    (define-key haskell-mode-map [f8] 'haskell-navigate-imports)
    ;; Jump to the definition of the current symbol.
    (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)
    (define-key haskell-mode-map (kbd "C-c M-.") nil)
    (define-key haskell-mode-map (kbd "C-c C-d") nil)))

;(eval-after-load "haskell-mode"
;  (define-key haskell-mode-map (kbd "C-c v c") 'haskell-cabal-visit-file))

;; Notmuch Emacs interface
(require 'notmuch)
(require 'notmuch-address)
(setq notmuch-address-command "/home/au/bin/notmuch-google-contacts")
(notmuch-address-message-insinuate)

(define-key notmuch-show-mode-map "d"
  (lambda ()
    (interactive)
    (notmuch-show-tag-message "+delete")))

(define-key notmuch-search-mode-map "d"
  (lambda ()
    (interactive)
    (notmuch-search-tag "+delete")))

;; Auctex
;(load "auctex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-parse-self t)
(setq TeX-auto-save t)

(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(setq TeX-insert-braces t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(haskell-indent-spaces 4)
 '(inhibit-startup-screen t)
 '(mail-envelope-from (quote header))
 '(mail-specify-envelope-from t)
 '(markdown-command "pandoc -f markdown -t html")
 '(message-kill-buffer-on-exit t)
 '(message-sendmail-envelope-from (quote header))
 '(notmuch-always-prompt-for-sender t)
 '(notmuch-crypto-process-mime t)
 '(notmuch-fcc-dirs (quote (("alexander.ulrich@uni-tuebingen.de" . "/home/au/Maildirs/zdv/Mail.sent") ("alex@etc-network.de" . "/home/au/Maildirs/etc/INBOX.sent"))))
 '(notmuch-saved-searches (quote (("notmuch" . "tag:notmuch and tag:inbox") ("haskell-cafe" . "tag:haskell-cafe and tag:inbox") ("haskell-beginners" . "tag:haskell-beginners and tag:inbox") ("dbworld" . "tag:dbworld and tag:inbox") ("ghc-users" . "tag:glasgow-haskell-users and tag:inbox") ("caml" . "tag:caml and tag:inbox") ("ACTION" . "tag:action") ("WAITING" . "tag:waiting") ("SOMEDAY" . "tag:someday") ("work" . "tag:work and tag:inbox") ("main" . "tag:main and tag:inbox") ("tor-relay" . "tag:tor-relay and tag:inbox") ("pgsql-general" . "tag:pgsql-general and tag:inbox") ("pgsql-performance" . "tag:pgsql-performance and tag:inbox") ("monetdb-users" . "tag:monetdb-users and tag:inbox"))))
 '(notmuch-search-oldest-first nil)
 '(notmuch-show-all-tags-list t)
 '(scroll-bar-mode nil)
 '(send-mail-function (quote sendmail-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
