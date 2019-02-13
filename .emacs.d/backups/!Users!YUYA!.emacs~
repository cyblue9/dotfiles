;;; .emacs -- a starter Emacs config for working with Extempore
;; Author: You! (with a little help from Ben Swift to get your started...)

;;; Commentary:

;; If you're new to Emacs...

;; This file is a 'starter' .emacs ('dot emacs') file, which might
;; come in handy if you're new to Emacs. When Emacs starts, it looks
;; in your home directory for a file called .emacs, and if it finds
;; one it loads it up. This is where your own Emacs configuration and
;; personalisations go.

;; This file is intended for people who are new to emacs. It has a few
;; handy defaults, and also sets up Emacs to work nicely with
;; Extempore.

;; Feel free to mess with it as much as you like: tweaking
;; one's .emacs is something of a right of passage for Emacs users :)

;; Installation:

;; To 'install' this file, just copy it to your home directory, e.g.
;;
;;   $ cp /path/to/extempore/extras/.emacs ~
;;
;; after that, Emacs will load the file on startup.

;; You'll also need to change the `extempore-share-directory' variable
;; (further down in this file) to point to your Extempore source
;; directory.

;; If you're already an Emacs user...

;; You'll have your own .emacs with its own tweaks. Just grab
;; extempore-mode.el from MELPA:

;; M-x `package-install' RET `extempore-mode' RET

;; and see the commentary at the top of that file for usage
;; instructions.

;; Further info:

;; https://github.com/digego/extempore
;; http://benswift.me/extempore-docs/

;;;;;;;;;;
;; elpa ;;
;;;;;;;;;;

;; this is the Emacs package manager

(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))

(unless package--initialized
  (package-initialize))

(when (null package-archive-contents)
  (package-refresh-contents))

;; add/remove any packages you like here
(dolist (package
         '(ido-completing-read+
           magit
           markdown-mode
           smex
           yasnippet
           extempore-mode
           nyan-mode))
  (if (not (package-installed-p package))
      (package-install package)))

;; nyan-mode
(add-to-list 'load-path "/Users/YUYA/.emacs.d/elpa/nyan-mode-20170423.740/")
(require 'nyan-mode)
(setq nyan-wavy-trail t)
(setq nyan-bar-length 20)
(setq nyan-animate-nyancat t)
(nyan-mode t)
(nyan-start-animation)

;; smart-mode-line
(setq sml/theme 'dark)
(sml/setup)
(require 'total-lines)
(global-total-lines-mode t)
(defun my-set-line-numbers ()
  (setq-default mode-line-front-space
        (append mode-line-front-space
            '((:eval (format " / %d" (- total-lines 1))))))) ;; 「" (%d)"」の部分はお好みで
(add-hook 'after-init-hook 'my-set-line-numbers)

;; mark-multiple
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
;; (global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)

;; (add-hook 'sgml-mode-hook
;;           (lambda ()
;;             (require 'rename-sgml-tag)
;;             (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))
(add-hook 'html-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key html-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; menubar don't display
(menu-bar-mode 0)

(require 'smooth-scroll)
(smooth-scroll-mode t)
;;;;;;;;;;
;; smex ;;
;;;;;;;;;;

(smex-initialize)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(ido-mode 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; display & appearance ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq visible-bell t)
(setq inhibit-startup-message t)
(setq color-theme-is-global t)

(set-default 'indent-tabs-mode nil)
(set-default 'tab-width 2)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(show-paren-mode 1)
(setq show-paren-delay 0)
(column-number-mode 1)
(hl-line-mode t)

;; show time and battery status in mode line

(display-time-mode 1)
(setq display-time-format "%H:%M")
(display-battery-mode 1)

;; whitespace

(setq sentence-end-double-space nil)
(setq shift-select-mode nil)
(setq whitespace-style '(face trailing lines-tail tabs))
(setq whitespace-line-column 80)
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; mark region commands as safe

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; text mode tweaks

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(remove-hook 'text-mode-hook 'smart-spacing-mode)

;; file visiting stuff

(setq save-place t)
(setq save-place-file (concat user-emacs-directory "places"))
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
(setq recentf-max-saved-items 100)

(global-auto-revert-mode t)

;; other niceties

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq diff-switches "-u")

(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(defalias 'yes-or-no-p 'y-or-n-p)

;; pretty lambdas

(add-hook 'prog-mode-hook
          '(lambda ()
             (font-lock-add-keywords
             nil `(("(?\\(lambda\\>\\)"
                     (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                               ,(make-char 'greek-iso8859-7 107))
                              nil)))))))


;; my-setting

;; C-k to remove all of the line
(setq kill-whole-line t)

;; シフト＋矢印で範囲選択
;;(setq pc-select-selection-keys-only t)
;;(pc-selection-mode)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; カーソル行をハイライトする
(global-hl-line-mode t)
;;;;;;;;;;;;;;;;;
;; color theme ;;
;;;;;;;;;;;;;;;;;

;; uncomment these lines when you've found a theme you like (replace
;; `your-theme') and want to load it on startup.

;; (if (display-graphic-p)
;;     (load-theme 'your-theme t))

(set-face-background 'default "#080807")
(set-face-foreground 'default "#e2dfe2")

;;;;;;;;;;;
;; faces ;;
;;;;;;;;;;;

;; to choose a font (and size), you can use this code

;; ;; font size
;; (setq base-face-height 200)
;; ;; monospace font
;; (set-face-attribute 'default nil :height base-face-height :family "Ubuntu Mono")
;; ;; variable-width font
;; (set-face-attribute 'variable-pitch nil :height base-face-height :family "Ubuntu")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("473b8962af513717e51156ae92a06c5837df191962137ce1b2b6ca1e850789e8" "97e593e9e9e8d7513eeee4bce8daaa5e094c5311c30dff4382a28ca7b9dbda44" "0b92290601d72d1573eff439fe543dc4c8331614925cc044e865505362adcd49" "8961e2b020ed95e75eb46deb5d0d671967ae594178bd0229c8107ea177d673ce" "cc6db4e7fcb82a67047d999a90e137f9c6a595edc8cb7ba5c5567ee4e6955e6c" "e40520a9b53364b1f4c2b3791ec5bcf73872f26a6cb38edd7b46777e009bdb12" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (mark-multiple smart-mode-line ## yasnippet smex markdown-mode magit ido-completing-read+ extempore-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#e2dfe2" :background "#080807" :underline nil))))
 '(font-lock-comment-face ((t (:foreground "#747874" :background nil :underline nil))))
 '(font-lock-constant-face ((t (:foreground "#19aed5" :background nil :underline nil))))
 '(font-lock-function-name-face ((t (:foreground "#fafb13" :background nil :underline nil))))
 '(font-lock-keyword-face ((t (:foreground "#fa2cc9" :background nil :underline nil))))
 '(font-lock-string-face ((t (:foreground "#11b321" :background nil :underline nil))))
 '(font-lock-type-face ((t (:foreground "#2562e9" :background nil :underline nil))))
 '(hl-line ((t (:foreground nil :background "#333333")))))
 (set-face-attribute 'show-paren-match nil :foreground "#FF8000" :background "#FF8000" :underline nil :weight 'extra-bold)
