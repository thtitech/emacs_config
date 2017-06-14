;;;Commentary:
;(set-language-environment "Japanese")
(setq load-path (cons "~/.emacs.d/lisp" load-path))
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(global-hi-lock-mode 1)

(global-set-key "\C-cj" 'goto-line)
(global-set-key "\C-ci" 'indent-region)
(global-set-key "\C-cn" 'newline-and-indent)
(global-set-key "\C-ch" 'dabbrev-expand)
;(global-set-key "\C-cc" 'hightlihgt-regexp)

(define-key hi-lock-map "\C-cc" 'highlight-regexp)
(define-key hi-lock-map "\C-cu" 'unhighlight-regexp)

(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(setq LaTeX-item-indent 2)
(set-face-background 'show-paren-match-face "#ccffff")

(line-number-mode 1)
(column-number-mode t)
(global-linum-mode t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)

(electric-pair-mode 1)

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start 3)
(define-key global-map (kbd "s-b") 'auto-complete)

(require 'package)
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
					;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;use flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;============-
;haskell
;==========
;(add-to-list 'exec-path "~/.cabal/bin/")
(autoload 'haskell-mode "haskell-mode" nil t)
;(autoload 'haskell-cabal "haskell-cabal" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

 ;; indent の有効.
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
;(add-hook 'haskell-mode-hook '(lambda () (setq tab-width 2)))
;(add-hook 'haskell-mode-hook '(lambda () ((setq indent-tabs-mode nil))))

;;M-x run-haskell 
;(setq haskell-program-name "/usr/bin/ghci")
;(add-hook 'haskell-mode-hook 'inf-haskell-mode) ;; enable

;; ghc-mod
;(autoload 'ghc-init "ghc" nil t)
;(autoload 'ghc-debug "ghc" nil t)
;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; hlint flycheck
;(add-hook 'haskell-mode-hook
 ;         '(lambda ()
 ;            (setq flycheck-checker 'haskell-hlint)
 ;            (flycheck-mode 1)))
;;addhock

;; (defun my-haskell-mode-hook ()
;;     (interactive)
;;     ;; インデント
;;     (turn-on-haskell-indentation)
;;     (turn-on-haskell-doc-mode)
;;     (font-lock-mode)
;;     (imenu-add-menubar-index)
;;     (setq tab-width 2)
;;     (setq indent-tabs-mode nil)
;;     ;; GHCi のコマンドを設定
;;     (setq haskell-program-name "/Users/haya/.stack/programs/x86_64-osx/ghc-8.0.2/bin/ghci")
;;     (inf-haskell-mode)
;;     ;; ghc-mod を使えるように
;;     (ghc-init)
;;     ;; flycheck を起動
;;     (flycheck-mode))
;; (add-hook 'haskell-mode-hook 'my-haskell-mode-hook)





;(require 'company)
;(global-company-mode) ; 全バッファで有効にする 
;(setq company-idle-delay 0) ; デフォルトは0.5
;(setq company-minimum-prefix-length 2) ; デフォルトは4
;(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

;(require 'jedi-core)
;(setq jedi:complete-on-dot t)
;(setq jedi:use-shortcuts t)
;(add-hook 'python-mode-hook 'jedi:setup)
;(add-to-list 'company-backends 'company-jedi) ; backendに追加
