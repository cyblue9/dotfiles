;;; ponylang-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ponylang-mode" "ponylang-mode.el" (0 0 0 0))
;;; Generated autoloads from ponylang-mode.el

(add-to-list 'auto-mode-alist '("\\.pony\\'" . ponylang-mode))

(autoload 'ponylang-mode "ponylang-mode" "\
Major mode for editing Pony files.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ponylang-mode" '("ponylang-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ponylang-mode-autoloads.el ends here
