(show-paren-mode 1)

(setq line-number-mode t)
(setq column-number-mode t)

;; Tabs are evil
(setq-default indent-tabs-mode nil)

(require 'package)
(package-initialize)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "~/software/notmuch-0.19/share/emacs/site-lisp/")

;; Zenburn color theme
(load-theme 'zenburn t)

;; Evil vim emulation
(require 'evil)
    (evil-mode 1)

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Enable syntax highlighting globally
(global-font-lock-mode 1)

;; Show line numbers a la vim
(global-linum-mode t)

;; Highlight trailing whitespace, overly long lines and empty lines at
;; the end of a file. Also, show newlines explicitly.
(require 'whitespace)
(setq whitespace-style (quote (face trailing tabs lines newline empty newline-mark)))
(setq whitespace-line-column 85)
(setq whitespace-display-mappings
      '((newline-mark 10 [172 10])))
(global-whitespace-mode 1)

;; Highlight the current line
(require 'hl-line)
(global-hl-line-mode 1)

;; Match parens automatically
(electric-pair-mode 1)                  ;

;; Magit git interface
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Enable auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; Show 0.8 second later
(setq ac-auto-show-menu 0.8)

;;(add-hook 'after-init-hook 'global-company-mode)

;; Enable haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)

;; haskell-mode key bindings
;; Note: negative prefix C-- C-c C-c enables full rebuild
;; (eval-after-load "haskell-mode"
;;   '(progn
;;      ;; FIXME seems to collide with evil-mode
;;      (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
;;      (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)))

;; (eval-after-load "haskell-mode"
;;     '(define-key haskell-mode-map (kbd "C-c C-b") 'haskell-compile))

;; (eval-after-load "haskell-cabal"
;;     '(define-key haskell-cabal-mode-map (kbd "C-c C-b") 'haskell-compile))

;; (eval-after-load "haskell-mode"
;;   '(progn
;;     (define-key haskell-mode-map (kbd "C-x C-d") nil)
;;     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;;     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
;;     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;;     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;;     ;; Jump to the imports. Keep tapping to jump between import
;;     ;; groups. C-u f8 to jump back again.
;;     (define-key haskell-mode-map [f8] 'haskell-navigate-imports)
;;     ;; Jump to the definition of the current symbol.
;;     (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)
;;     ;; Prompt for cabal command to run
;;     (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
;;     (define-key haskell-mode-map (kbd "C-c M-.") nil)
;;     (define-key haskell-mode-map (kbd "C-c C-d") nil)))

;; (eval-after-load "haskell-mode"
;;   '(define-key haskell-mode-map (kbd "C-c v c") 'haskell-cabal-visit-file))

; Mostly harvested from https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
  ;; Jump to the imports. Keep tapping to jump between import
  ;; groups. C-u f8 to jump back again.
  (define-key haskell-mode-map [f8] 'haskell-navigate-imports)
  (define-key haskell-mode-map (kbd "C-c v c") 'haskell-cabal-visit-file)))

(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

;; Enable ghc-mod Emacs frontend
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; Enable ghc-mod backend for company-mode
;; (add-to-list 'company-backends 'company-ghc)

;; ;; Notmuch Emacs interface
;; (require 'notmuch)
;; (require 'notmuch-address)
;; (setq notmuch-address-command "/home/au/bin/notmuch-google-contacts")
;; (notmuch-address-message-insinuate)

;; (define-key notmuch-show-mode-map "d"
;;   (lambda ()
;;     (interactive)
;;     (notmuch-show-tag-message (list "+delete"))
;;     (notmuch-show-refresh-view)))

;; (define-key notmuch-search-mode-map "d"
;;   (lambda ()
;;     (interactive)
;;     (notmuch-search-tag (list "+delete"))))

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
 '(company-backends (quote (company-elisp company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-ropemacs company-cmake company-capf (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-files company-dabbrev company-ghc)))
 '(haskell-indent-spaces 4)
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-process-args-cabal-repl
   '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))
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
