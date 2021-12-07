;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "breakwindy"
      user-mail-address "lw373984795@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;(setq set-face-attribute 'default nil :height 100)
;; here is configuration for coding
(setq python-shell-interpreter "python3")

(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http" . "127.0.0.1:1087")
     ("https" . "127.0.0.1:1087")))

;; here is provider basic info for tags
(setq tags-table-list '("~/workspace/code/c/linux/TAGS"
                        "~/workspace/code/c/redis/TAGS"))


;; here is set super key for command key in macOS
;;(setq mac-command-modifier 'super)
;;(global-set-key (kbd "s-c") 'xref-find-definitions)
(setq linum-relative-current-symbol "")
;;(setq linum-relative-current-symbol "$")
;;(setq linum-relative-mode t)
(linum-relative-global-mode t)
;;(setq display-line-numbers-mode 'relative)
;;(display-line-numbers-mode 'relative)
;;(display-line-numbers-mode 0)


;;(setq global-linum-mode t)
;;(setq display-line-numbers-type f)
;;
;;
;; ------------------ here is config org-mode ----------
;;(package! org-roam)
(setq org-roam-directory "~/workspace/roam")


;;--------------- here is set mysql configuration ------------
;;(setq sql-port 22004)
(setq sql-mysql-login-params
'((user :default "elitel")
        (database :default "elitel!@3$GQ")
        (server :default "www.sjpygq.com")
        (port :default 22004)))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(setq sql-connection-alist
      '((irr-test (sql-product 'mysql)
                  (sql-port 22004)
                  (sql-server "www.sjpygq.com")
                  (sql-user "elitel")
                  (sql-password "elitel!@3$GQ")
                  (sql-database "irr"))))

;;--------------- defun here --------------------------------------

;; here is configuration copy and paste in terminal emacs
;; amazing here  I love this one
(defun copy-from-osx ()
  "Here is copy from OSX Test"
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  "Here is paste to OSX from Emacs"
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(setenv "LANG" "en_US.UTF-8")

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

