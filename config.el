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
     ("http" . "127.0.0.1:1088")
     ("https" . "127.0.0.1:1088")))

;; set edebug-print-length
(setq edebug-print-length 500)
;; here is provider basic info for tags
;; (setq tags-table-list '("~/workspace/code/c/linux/TAGS"
;;                         "~/workspace/code/c/redis/TAGS"))
(require 'srefactor-lisp)

(setq path-to-ctags "~/workspace/bin/tags") ;; <- your ctags path here
(defun create-tags (dir-name)
        "Create tags file."
        (interactive "DDirectory: ")
        (shell-command
        ;; (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name))))
        (format "ctags -f %s/TAGS -e -R %s "  path-to-ctags dir-name)))

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

;;(setq lsp-java-workspace-dir "~/workspace/elitel/product_api")
;;(setq lsp-java-jdt-download-url  "https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz")

(setq lsp-java-maven-download-sources t)
(setq dap-ui-variable-length 200)
;;(setq debug-on-error non-nil)
;;

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
      '((irr-dev-22004 (sql-product 'mysql)
                  (sql-port 22004)
                  (sql-server "www.sjpygq.com")
                  (sql-user "elitel")
                  (sql-password "elitel!@3$GQ")
                  (sql-database "irr_dev"))
        (irr-test-22004 (sql-product 'mysql)
                  (sql-port 22004)
                  (sql-server "www.sjpygq.com")
                  (sql-user "elitel")
                  (sql-password "elitel!@3$GQ")
                  (sql-database "irr")) ;; irr use test , irr-dev , dev use and , local use irr-dev , online backup online irr
        (irr-produce (sql-product 'mysql)
                  (sql-port 13306)
                  (sql-server "www.sjpygq.com")
                  (sql-user "elitel")
                  (sql-password "elitel!@3$GQ")
                  (sql-database "irr"))
        (irr-dev-elitel-company (sql-product 'mysql)
                  (sql-port 13308)
                  (sql-server "119.61.22.194")
                  (sql-user "elitel")
                  (sql-password "elitel!@3$")
                  (sql-database "irr_dev"))))

;; ---------------- here is global-set-key ------------------
(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

(global-set-key (kbd "C-x /") 'comment-region)
(global-set-key (kbd "C-c /") 'uncomment-region)

(global-set-key (kbd "C-x ,") 'find-file-in-project)

;; move
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c j")  'windmove-down)
(global-set-key (kbd "C-c k")    'windmove-up)

(global-set-key (kbd "M-n") 'better-jumper-jump-forward)
(global-set-key (kbd "<f8>") 'dap-hydra)
(global-set-key (kbd "<f7>") 'treemacs)
;;(global-set-key (kbd "C-n") 'better-jumper-jump-forward)
;(bind-key* "C-i" 'better-jumper-jump-forward)
;;--------------- defun here --------------------------------------
;; here is function
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let* ((name (buffer-name))
        (filename (buffer-file-name))
        (basename (file-name-nondirectory filename)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " (file-name-directory filename) basename nil basename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun eshell-new()
  "Open a new instance of eshell."
  (interactive)
  (eshell 'N))


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

;; ---------------- here is config lsp-java-------------
;;
;; current VSCode defaults
;;(setq lsp-java-vmargs '("-XX:+UseParallelGC" "-XX:GCTimeRatio=4" "-XX:AdaptiveSizePolicyWeight=90" "-Dsun.zip.disableMemoryMapping=true" "-Xmx2G" "-Xms100m"))
;; (setq path-to-lombok (car (file-expand-wildcards "/nix/store/*-lombok-*/share/java/lombok.jar") ) )
;; (setq lsp-java-vmargs
;;       `("-noverify"
;;         "-Xmx1G"
;;         "-XX:+UseG1GC"
;;         "-XX:+UseStringDeduplication"
;;         ,(concat "-javaagent:" path-to-lombok)
;;         ,(concat "-Xbootclasspath/a:" path-to-lombok)))

(setq lsp-java-vmargs '("-noverify"
                        "-Xmx1G"
                        "-XX:+UseG1GC"
                        "-XX:+UseStringDeduplication"
                        "-javaagent:/Users/luowen/.m2/repository/org/projectlombok/lombok/1.18.22/lombok-1.18.22.jar"
                        "-Xbootclasspath/a:/Users/luowen/.m2/repository/org/projectlombok/lombok/1.18.22/lombok-1.18.22.jar"))

(use-package! projectile)
(use-package! flycheck)
(use-package! yasnippet :config (yas-global-mode))
(use-package! lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package! hydra)
(use-package! company)
(use-package! lsp-ui)
(use-package! which-key :config (which-key-mode))
(use-package! lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package! dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package! dap-java :ensure nil)
(use-package! helm-lsp)
(use-package! helm
  :config (helm-mode))
(use-package! lsp-treemacs)


;(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;(setq lsp-java-workspace-dir '~/workspace/code/projects/)
;(setq lsp-java-workspace-cache-dir '~/workpsace/lsp/cache/)
;;;;;;;;;;;;;;;;;;;;; ------------ here is dart mode ----------
(setq package-selected-packages
  '(dart-mode lsp-mode lsp-dart lsp-treemacs flycheck company
    ;; Optional packages
    lsp-ui company hover))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(add-hook 'dart-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil)

;; add to $DOOMDIR/config.el
(after! lsp-mode
  (advice-remove #'lsp #'+lsp-dont-prompt-to-install-servers-maybe-a))


(dap-register-debug-template
  "irrigate-application"
  (list :type "java"
        :request "compile_attach"
        :args ""
        :cwd nil
        :host "localhost"
        :request "launch"
        :modulePaths []
        :classPaths nil
        :name "irrigate-main1"
        :projectName "irrigate-main"
        :mainClass "com.elitel.IrrGateApplication"))

;; ((nil . ((eval . (let* ((root (cdr (project-current)))
;;                        (test-bin (concat root "test/test_bin")))
;;                    (setq dap-debug-template-configurations ))))))


;;; ----------- here is temporary function library for irr -------
;; here is implement M3 convert to L and ml and show height if only surface

(defvar area 0.07)
(defun irr-func-show-L-mL (cube-volume)
  "Show volume by convert other unit"
  (interactive "n please input cube volume: ")
  (let ((liter-volume (* cube-volume 1000))
        (milliliter-volume (* cube-volume 1000 1000)))
    (message "cube = %f m3 ;  liter = %f L;  milliliter-volume = %f mL" cube-volume liter-volume milliliter-volume)))

(defun irr-func-consume-surface-height (cube-volume)
  "Provider default convert volume into surface height default area = 0.07
default same bath existed surface water"
  (interactive "n please input volume (default exclude underground): ")
  (let ((height-m (/ cube-volume area))
        height-mm)

    (setq height-mm (* height-m 1000))
    (message "consume surface height: %f m,  %f mm" height-m height-mm)))

(defun irr-func-difference-volume (volume1 volume2)
  "Here is provider difference volume , express use "
  (interactive "n please input first volume: \nn please input second volume: ")
  (irr-func-show-L-mL (- volume1 volume2)))

(defun irr-func-show-all-both-existed-surface (cube-volume)
  "Provider all information for compute"
  (interactive "n please input volume: ")
  (let ((message-height
         (irr-func-consume-surface-height cube-volume))
        (message-volume
         (irr-func-show-L-mL cube-volume)))
    (message "height: \n%s \n\nvolume: \n%s" message-height message-volume)))

(defun money-return-10%-each-year (money years)
  "Here is compound interest 10% each year"
  (interactive "n please input first init money \nn please save your year: ")
  (let ((ratio 0.1)
        (return-money money)
        (year years))
    (dotimes (number year)
      (setq return-money (return-10%-one-year return-money))
      (message "Now year: %d ,and current return-money is %f" number return-money))))

(defun money-return-10%-one-year (init-money)
  "Here is return 10% compound interest one year."
  (interactive "n please your init-money: ")
  (let ((return-money (+ init-money (* init-money 0.1))))
    (message "your return will is return-money = %d" return-money)
    return-money))

(defun money-financial-freedom-by-bank (interest)
  "Fincial freedom formula return by your principal 4.75% for year"
  (interactive "n Please input your financial freedom money of month: ")
  (let ((bank-ratio-each-year (/ 4.57 100))
        bank-ratio-each-month
        principal)
    (setq bank-ratio-each-month (/ bank-ratio-each-year 12))
    (setq principal (/ interest bank-ratio-each-month))
    (message "your principal money of financial freedom is %f ￥" principal)))

(defun money-financial-income-by-work (income)
  "Financial Income from enginer work, return year income"
  (interactive "n Please input your monthly work income: ")
  (message "your year income form work %f " (* income 12)))

;; here I want to implement insert sql command
(defun insert-java-debug-command ()
  "Insert java startup command with debugger mode"
  (interactive)
  (insert "java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 -jar irrigate-main/target/irrigate-main-0.0.1-SNAPSHOT.jar"))
