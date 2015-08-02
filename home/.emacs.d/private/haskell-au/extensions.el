;; Pre extensions are loaded *before* the packages
(setq haskell-au-pre-extensions '(haskell-flycheck))

;; Post extensions are loaded *after* the packages
(setq haskell-au-post-extensions
      '(haskell-flycheck
        ))

(defun haskell-au/init-haskell-flycheck ()
  (use-package haskell-flycheck
    :defer f))

;; (when (configuration-layer/layer-usedp 'syntax-checking)
;;   (defun haskell-au/init-flycheck-haskell ()
;;     (use-package haskell-flycheck
;;       :if (configuration-layer/package-usedp 'flycheck)
;;       :commands flycheck-haskell-configure
;;       :init (add-hook 'flycheck-mode-hook 'flycheck-haskell-configure))))
