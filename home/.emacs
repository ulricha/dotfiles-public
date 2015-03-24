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


;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General Editing

;; Evil vim emulation
(require 'evil)
    (evil-mode 1)

;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Enable syntax highlighting globally
(global-font-lock-mode 1)

;; Show line numbers a la vim
(global-linum-mode t)

;; Show the column number in the status bar
(column-number-mode t)

;; Highlight matching parens
(show-paren-mode t)

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

;; ;; Show 0.8 second later
;; (setq ac-auto-show-menu 0.8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell

(require 'haskell)
(require 'haskell-mode)
(require 'hindent)
(require 'haskell-process)
(require 'haskell-simple-indent)
(require 'haskell-interactive-mode)
(require 'haskell-font-lock)

;; Enable haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(defun haskell-who-calls (&optional prompt)
  "Grep the codebase to see who uses the symbol at point."
  (interactive "P")
  (let ((sym (if prompt
                 (read-from-minibuffer "Look for: ")
               (haskell-ident-at-point))))
    (let ((existing (get-buffer "*who-calls*")))
      (when existing
        (kill-buffer existing)))
    (let ((buffer
           (grep-find (format "cd %s && find . -name '*.hs' -exec grep -inH -e %s {} +"
                              (haskell-session-current-dir (haskell-session))
                              sym))))
      (with-current-buffer buffer
        (rename-buffer "*who-calls*")
        (switch-to-buffer-other-window buffer)))))

(defun haskell-insert-doc ()
  "Insert the documentation syntax."
  (interactive)
  (insert "-- | "))

(defun haskell-insert-undefined ()
  "Insert undefined."
  (interactive)
  (if (and (boundp 'structured-haskell-mode)
           structured-haskell-mode)
      (shm-insert-string "undefined")
    (insert "undefined")))

(defun haskell-move-right ()
  (interactive)
  (haskell-move-nested 1))

(defun haskell-move-left ()
  (interactive)
  (haskell-move-nested -1))

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
;; (eval-after-load 'haskell-mode '(progn
;;   (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;;   (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
;;   (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;;   (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;   (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;   (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;;   (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;;   (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
;;   (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
;;   ;; Jump to the imports. Keep tapping to jump between import
;;   ;; groups. C-u f8 to jump back again.
;;   (define-key haskell-mode-map [f8] 'haskell-navigate-imports)kkkkkkkkkkkkkk
;;   (define-key haskell-mode-map (kbd "C-c v c") 'haskell-cabal-visit-file)))

;; (eval-after-load 'haskell-cabal '(progn
;;   (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;;   (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;   (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;   (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(define-key interactive-haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key interactive-haskell-mode-map (kbd "M-,") 'haskell-who-calls)
(define-key interactive-haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key interactive-haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key interactive-haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key interactive-haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key interactive-haskell-mode-map (kbd "M-.") 'haskell-mode-goto-loc)
(define-key interactive-haskell-mode-map (kbd "C-?") 'haskell-mode-find-uses)
(define-key interactive-haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)

(define-key haskell-mode-map (kbd "C-c i") 'hindent/reformat-decl)
(define-key haskell-mode-map [f8] 'haskell-navigate-imports)
(define-key haskell-mode-map (kbd "C-c C-u") 'haskell-insert-undefined)
(define-key haskell-mode-map (kbd "C-c C-a") 'haskell-insert-doc)
(define-key haskell-mode-map (kbd "C-<return>") 'haskell-simple-indent-newline-indent)
(define-key haskell-mode-map (kbd "C-<right>") 'haskell-move-right)
(define-key haskell-mode-map (kbd "C-<left>") 'haskell-move-left)
(define-key haskell-mode-map (kbd "<space>") 'haskell-mode-contextual-space)

(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-cabal-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch)
(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)

(define-key haskell-interactive-mode-map (kbd "C-c C-v") 'haskell-interactive-toggle-print-mode)
(define-key haskell-interactive-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-interactive-mode-map [f12] 'haskell-process-reload-devel-main)
(define-key haskell-interactive-mode-map (kbd "C-<left>") 'haskell-interactive-mode-error-backward)
(define-key haskell-interactive-mode-map (kbd "C-<right>") 'haskell-interactive-mode-error-forward)
(define-key haskell-interactive-mode-map (kbd "C-c c") 'haskell-process-cabal)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LaTeX

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
 '(haskell-process-type (quote cabal-repl))
 '(haskell-process-args-cabal-repl
   '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))
 ;'(haskell-notify-p t)
 ;'(haskell-stylish-on-save nil)
 ;'(haskell-tags-on-save nil)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 ;'(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-use-presentation-mode t)
 '(haskell-interactive-mode-include-file-name nil)
 '(haskell-interactive-mode-eval-pretty nil)
 '(haskell-process-suggest-haskell-docs-imports t)
 '(hindent-style "johan-tibell")
 '(haskell-interactive-mode-eval-mode 'haskell-mode)
 '(haskell-process-path-ghci "ghci-ng")
 '(haskell-process-args-ghci '("-ferror-spans"))
 '(haskell-process-args-cabal-repl
   '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))
 '(haskell-process-generate-tags nil)

 '(haskell-indent-spaces 4)
 '(haskell-interactive-popup-errors nil)
 '(inhibit-startup-screen t)
 '(markdown-command "pandoc -f markdown -t html")
 '(message-kill-buffer-on-exit t)
 '(message-sendmail-envelope-from (quote header))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
