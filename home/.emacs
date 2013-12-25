
(show-paren-mode 1)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

(add-to-list 'load-path "~/software/notmuch-0.16/share/emacs/site-lisp/")

(load-theme 'zenburn t)

(require 'evil)
    (evil-mode 1)

(global-font-lock-mode 1)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

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
 '(inhibit-startup-screen t)
 '(mail-envelope-from (quote header))
 '(mail-specify-envelope-from t)
 '(markdown-command "pandoc -f markdown -t html")
 '(message-kill-buffer-on-exit t)
 '(message-sendmail-envelope-from (quote header))
 '(notmuch-always-prompt-for-sender t)
 '(notmuch-crypto-process-mime t)
 '(notmuch-fcc-dirs (quote (("alexander.ulrich@uni-tuebingen.de" . "/home/au/Maildirs/zdv/Mail.sent") ("alex@etc-network.de" . "/home/au/Maildirs/etc/INBOX.sent"))))
 '(notmuch-saved-searches (quote (("inbox" . "tag:inbox") ("monetdb-users" . "tag:monetdb-users and tag:unread") ("notmuch" . "tag:notmuch and tag:unread") ("haskell-cafe" . "tag:haskell-cafe and tag:unread") ("haskell-beginners" . "tag:haskell-beginners and tag:unread") ("dbworld" . "tag:dbworld and tag:unread") ("ghc-users" . "tag:glasgow-haskell-users and tag:unread") ("caml" . "tag:caml and tag:unread") ("ACTION" . "tag:action") ("WAITING" . "tag:waiting") ("SOMEDAY" . "tag:someday"))))
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
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))
