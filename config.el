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
     ("http" . "127.0.0.1:7890")
     ("https" . "127.0.0.1:7890")))

;; set edebug-print-length
(setq edebug-print-length 1000000)
;; here is provider basic info for tags
;; (setq tags-table-list '("~/workspace/code/c/linux/TAGS"
;;                         "~/workspace/code/c/redis/TAGS"))
(require 'srefactor-lisp)

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\target\\'")
  ;; or
  (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\.my-files\\'"))

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
(setq eww-search-prefix "https://cn.bing.com/search?q=")

(setq smerge-command-prefix "C-c v")

;;
;; ------------------ here is config org-mode ----------
;;(package! org-roam)
(setq org-roam-directory "~/workspace/roam")

;;(setq lsp-java-workspace-dir "~/workspace/elitel/product_api")
;;(setq lsp-java-jdt-download-url  "https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz")

(setq lsp-java-maven-download-sources t)
(setq dap-ui-variable-length 500)
;;(setq debug-on-error non-nil)
;;

;;--------------- here is set mysql configuration ------------
;;(setq sql-port 22004e
;; (setq sql-mysql-login-params
;; '((user :default "elitel")
;;         (database :default "elitel!@3$GQ")
;;         (server :default "www.sjpygq.com")
;;         (port :default 22004)))

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
                  (sql-database "irr_dev"))
        (irr-archive-22004 (sql-product 'mysql)
                  (sql-port 22004)
                  (sql-server "www.sjpygq.com")
                  (sql-user "elitel")
                  (sql-password "elitel!@3$GQ")
                  (sql-database "archives"))

        (local-archive-test (sql-product 'mysql)
                  (sql-port 3308)
                  (sql-server "192.168.0.150")
                  (sql-user "elitel")
                  (sql-password "elitel!@3$GQ")
                  (sql-database "company-local-archives"))

        (local-money (sql-product 'mysql)
                  (sql-port 3306)
                  (sql-server "localhost")
                  (sql-user "luowen")
                  (sql-password "luowen123")
                  (sql-database "money"))

        (local-well-electric (sql-product 'mysql)
                  (sql-port 3306)
                  (sql-server "localhost")
                  (sql-user "luowen")
                  (sql-password "luowen123")
                  (sql-database "well_electric"))

        (local-base_frame (sql-product 'mysql)
                  (sql-port 3306)
                  (sql-server "localhost")
                  (sql-user "luowen")
                  (sql-password "luowen123")
                  (sql-database "base_frame"))

        (local-general_data_platform (sql-product 'mysql)
                  (sql-port 3306)
                  (sql-server "localhost")
                  (sql-user "luowen")
                  (sql-password "luowen123")
                  (sql-database "general_data_platform"))

        (company-well-electric (sql-product 'mysql)
                  (sql-port 3306)
                  (sql-server "192.168.0.154")
                  (sql-user "root")
                  (sql-password "root")
                  (sql-database "well_electric"))


        (company-well-electric-14000 (sql-product 'mysql)
                  (sql-port 3306)
                  (sql-server "192.168.0.154")
                  (sql-user "root")
                  (sql-password "root")
                  (sql-database "well_electric_14000"))

        (online-sync-db (sql-product 'mysql)
                  (sql-port 12005)
                  (sql-server "116.178.217.201")
                  (sql-user "elitel")
                  (sql-password "Elitel!@3$")
                  (sql-database "syncdb"))

        (online-well-electric-Test (sql-product 'mysql)
                  (sql-port 12005)
                  (sql-server "116.178.217.201")
                  (sql-user "elitel")
                  (sql-password "Elitel!@3$")
                  (sql-database "well_electric"))


        (online-well-electric-14000 (sql-product 'mysql)
                  (sql-port 12005)
                  (sql-server "116.178.217.201")
                  (sql-user "elitel")
                  (sql-password "Elitel!@3$")
                  (sql-database "well_electric_14000"))

        ))

;; ---------------- here is global-set-key ------------------
(global-set-key (kbd "C-c c") 'pbcopy)
;;(global-set-key (kbd "C-c v") 'pbpaste)
;;(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c v n") 'smerge-next)
(global-set-key (kbd "C-c v p") 'smerge-prev)
(global-set-key (kbd "C-c v RET") 'smerge-keep-current)
(global-set-key (kbd "C-c v m") 'smerge-keep-mine)
(global-set-key (kbd "C-c v o") 'smerge-keep-other)
(global-set-key (kbd "C-c v E") 'smerge-ediff)


;; save with static file
(global-set-key (kbd "C-c C-d") 'sync-target-file)


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
(global-set-key (kbd "<f9>") 'lsp-java-add-import)


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

;; -------- magit custom ----------

(custom-set-faces
 ;; other faces
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) nil))))
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

;; (setq lsp-java-vmargs '("-noverify"
;;                         "-Xmx1G"
;;                         "-XX:+UseG1GC"
;;                         "-XX:+UseStringDeduplication"
;;                         "-javaagent:/Users/luowen/.m2/repository/org/projectlombok/lombok/1.18.22/lombok-1.18.22.jar"
;;                         "-Xbootclasspath/a:/Users/luowen/.m2/repository/org/projectlombok/lombok/1.18.22/lombok-1.18.22.jar"))
;; (setq lsp-java-vmargs '("-noverify"
;;                         "-Xmx1G"
;;                         "-XX:+UseG1GC"
;;                         "-XX:+UseStringDeduplication"
;;                         "-javaagent:/Users/luowen/.m2/repository/org/projectlombok/lombok/1.18.22/lombok-1.18.22.jar"))

;; current VSCode defaults
(setq lsp-java-vmargs '("-XX:+UseParallelGC" "-XX:GCTimeRatio=4" "-XX:AdaptiveSizePolicyWeight=90" "-Dsun.zip.disableMemoryMapping=true" "-Xmx2G" "-Xms100m" "-javaagent:/Users/luowen/.m2/repository/org/projectlombok/lombok/1.18.22/lombok-1.18.22.jar"))


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

(setq gc-cons-threshold (* 100 1024 1024 4)
      read-process-output-max (* 1024 1024 4)
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil)

;;(setq gc-cons-threshold 134217728)
;;(setq read-process-output-max (* 1024 1024      4)) ;; 1mb


;; add to $DOOMDIR/config.el
(after! lsp-mode
  (advice-remove #'lsp #'+lsp-dont-prompt-to-install-servers-maybe-a))

;; Here is comfigure cc of lsp-mode
;; provider clang as backend server of lsp-mode
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;; Here is provider ccls as lsp-server
;; (after! ccls
;;   (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
;;   (set-lsp-priority! 'ccls 2)) ; optional as ccls is the default in Doom

(require 'dap-gdb-lldb)

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

;; ---------------- c++ configure -------------
(defun dap-debug-create-or-edit-json-template ()
    "Edit the C++ debugging configuration or create + edit if none exists yet."
    (interactive)
    (let ((filename (concat (lsp-workspace-root) "/launch.json"))
	  (default "~/.emacs.d/default-launch.json"))
      (unless (file-exists-p filename)
	(copy-file default filename))
      (find-file-existing filename)))
;; -------- Test template


;;(setq dap-lldb-debug-program '("/usr/bin/lldb"))
;; --------------- dap configure start
;; Enabling only some features
(setq dap-auto-configure-features '(sessions locals controls tooltip))
;; --------------- dap configure end


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

;; (dap-register-debug-template
;;   "irrigate-application-Attach"
;;   (list :name "Java Attach"
;;         :type "java"
;;         :request "attach"
;;         :hostName "localhost"
;;         :projectName "irrigate-main"
;;         :port 1044))

;; (dap-register-debug-template
;;   "money-backend"
;;   (list :type "java"
;;         :request "compile_attach"
;;         :args ""
;;         :cwd nil
;;         :host "localhost"
;;         :request "launch"
;;         :modulePaths []
;;         :classPaths nil
;;         :name "1"
;;         :projectName ""
;;         :mainClass "cn.lwcode.MyAppBackendApplication"))


;; (dap-register-debug-template
;;   "archives"
;;   (list :type "java"
;;         :request "compile_attach"
;;         :args ""
;;         :cwd nil
;;         :host "localhost"
;;         :request "launch"
;;         :modulePaths []
;;         :classPaths nil
;;         :name "1"
;;         :projectName ""
;;         :mainClass "com.elitel.Main"))


(dap-register-debug-template
  "well-electric"
  (list :type "java"
        :request "compile_attach"
        :args ""
        :cwd nil
        :host "localhost"
        :request "launch"
        :modulePaths []
        :classPaths nil
        :name "1"
        :projectName ""
        :mainClass "com.elitel.irr.wellelectric.MainApplication"))

 ;; '(dap-debug-template-configurations
 ;;   (quote
 ;;    (("LLDB Run Configuration" :type "lldb" :cwd nil :request "launch" :program nil :name "LLDB::Run")
 ;;     ("creswick Run Configuration"
 ;;      :type "lldbe"
 ;;      :cwd "/data/home/creswick/projectDir"
 ;;      :request "launch"
 ;;      :program "/data/home/creswick/projectDir/bin/eme_live"
 ;;      :name "creswickProject")
 ;;     )))
(dap-register-debug-template
"C++ LLDB dap"
(list :type "lldb-vscode"
        :cwd nil
        :args nil
        :request "launch"
        :program nil))

(setq dap-lldb-debug-program '("/Users/luowen/Desktop/lldb-vscode"))

;; (dap-register-debug-template
;;   "LLDB::Run-Custom"
;;   (list :type "lldb"
;;         :request "launch"
;;         :name "LLDB::Run-Custom-name"
;;         :program "/Users/luowen/workspace/code/c/redis/src/redis-server"
;;         :cwd "/Users/luowen/workspace/code/c/redis"))


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
(defun insert-java-debug-jar-command ()
  "Insert java startup command with debugger mode"
  (interactive)
  (insert "java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 -jar irrigate-main/target/irrigate-main-0.0.1-SNAPSHOT.jar"))

(defun insert-java-debug-full-path-command()
  "Insert into all path of classes startup application"
  (interactive)
  (insert "java -cp  /Users/luowen/workspace/elitel/product_api/irrigate-main/target/classes:/Users/luowen/workspace/elitel/product_api/irr-common/target/classes:/Users/luowen/.m2/repository/org/apache/kafka/kafka-clients/2.0.1/kafka-clients-2.0.1.jar:/Users/luowen/.m2/repository/org/lz4/lz4-java/1.4.1/lz4-java-1.4.1.jar:/Users/luowen/.m2/repository/org/xerial/snappy/snappy-java/1.1.7.1/snappy-java-1.1.7.1.jar:/Users/luowen/.m2/repository/com/google/protobuf/protobuf-java/4.0.0-rc-2/protobuf-java-4.0.0-rc-2.jar:/Users/luowen/.m2/repository/com/microsoft/sqlserver/mssql-jdbc/6.4.0.jre8/mssql-jdbc-6.4.0.jre8.jar:/Users/luowen/.m2/repository/com/github/virtuald/curvesapi/1.06/curvesapi-1.06.jar:/Users/luowen/.m2/repository/com/unism/commu/1.0/commu-1.0.jar:/Users/luowen/.m2/repository/com/aliyun/dysmsapi20170525/2.0.4/dysmsapi20170525-2.0.4.jar:/Users/luowen/.m2/repository/com/aliyun/tea-util/0.2.11/tea-util-0.2.11.jar:/Users/luowen/.m2/repository/com/aliyun/endpoint-util/0.0.6/endpoint-util-0.0.6.jar:/Users/luowen/.m2/repository/com/aliyun/tea/1.1.15/tea-1.1.15.jar:/Users/luowen/.m2/repository/com/squareup/okhttp3/okhttp/3.8.1/okhttp-3.8.1.jar:/Users/luowen/.m2/repository/com/squareup/okio/okio/1.13.0/okio-1.13.0.jar:/Users/luowen/.m2/repository/org/jacoco/org.jacoco.agent/0.8.4/org.jacoco.agent-0.8.4-runtime.jar:/Users/luowen/.m2/repository/com/aliyun/tea-openapi/0.0.16/tea-openapi-0.0.16.jar:/Users/luowen/.m2/repository/com/aliyun/credentials-java/0.2.4/credentials-java-0.2.4.jar:/Users/luowen/.m2/repository/org/ini4j/ini4j/0.5.4/ini4j-0.5.4.jar:/Users/luowen/.m2/repository/com/sun/xml/bind/jaxb-core/2.3.0/jaxb-core-2.3.0.jar:/Users/luowen/.m2/repository/com/sun/xml/bind/jaxb-impl/2.3.0/jaxb-impl-2.3.0.jar:/Users/luowen/.m2/repository/com/aliyun/openapiutil/0.1.6/openapiutil-0.1.6.jar:/Users/luowen/workspace/elitel/product_api/02IrrSFGL/target/classes:/Users/luowen/workspace/elitel/product_api/03IrrGPDD/target/classes:/Users/luowen/workspace/elitel/product_api/01IrrZHJK/target/classes:/Users/luowen/workspace/elitel/product_api/20IrrSZDP/target/classes:/Users/luowen/workspace/elitel/product_api/04IrrGPJC/target/classes:/Users/luowen/workspace/elitel/product_api/00IrrSY/target/classes:/Users/luowen/workspace/elitel/product_api/05IrrZNGG/target/classes:/Users/luowen/workspace/elitel/product_api/07IrrZHYW/target/classes:/Users/luowen/workspace/elitel/product_api/08IrrJCGL/target/classes:/Users/luowen/.m2/repository/org/junit/jupiter/junit-jupiter-api/5.3.2/junit-jupiter-api-5.3.2.jar:/Users/luowen/.m2/repository/org/apiguardian/apiguardian-api/1.0.0/apiguardian-api-1.0.0.jar:/Users/luowen/.m2/repository/org/opentest4j/opentest4j/1.1.1/opentest4j-1.1.1.jar:/Users/luowen/.m2/repository/org/junit/platform/junit-platform-commons/1.3.2/junit-platform-commons-1.3.2.jar:/Users/luowen/workspace/elitel/product_api/09IrrYWGL/target/classes:/Users/luowen/workspace/elitel/product_api/21IrrAUTOIRR/target/classes:/Users/luowen/workspace/elitel/product_api/30IrrProvince/target/classes:/Users/luowen/.m2/repository/org/springframework/cloud/spring-cloud-starter-openfeign/2.1.1.RELEASE/spring-cloud-starter-openfeign-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/cloud/spring-cloud-starter/2.1.0.RELEASE/spring-cloud-starter-2.1.0.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/cloud/spring-cloud-context/2.1.0.RELEASE/spring-cloud-context-2.1.0.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/security/spring-security-rsa/1.0.7.RELEASE/spring-security-rsa-1.0.7.RELEASE.jar:/Users/luowen/.m2/repository/org/bouncycastle/bcpkix-jdk15on/1.60/bcpkix-jdk15on-1.60.jar:/Users/luowen/.m2/repository/org/bouncycastle/bcprov-jdk15on/1.60/bcprov-jdk15on-1.60.jar:/Users/luowen/.m2/repository/org/springframework/cloud/spring-cloud-openfeign-core/2.1.0.RELEASE/spring-cloud-openfeign-core-2.1.0.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-autoconfigure/2.1.1.RELEASE/spring-boot-autoconfigure-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/cloud/spring-cloud-netflix-ribbon/2.1.0.RELEASE/spring-cloud-netflix-ribbon-2.1.0.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/cloud/spring-cloud-netflix-archaius/2.1.0.RELEASE/spring-cloud-netflix-archaius-2.1.0.RELEASE.jar:/Users/luowen/.m2/repository/io/github/openfeign/form/feign-form-spring/3.5.0/feign-form-spring-3.5.0.jar:/Users/luowen/.m2/repository/io/github/openfeign/form/feign-form/3.5.0/feign-form-3.5.0.jar:/Users/luowen/.m2/repository/commons-fileupload/commons-fileupload/1.3.3/commons-fileupload-1.3.3.jar:/Users/luowen/.m2/repository/commons-io/commons-io/2.2/commons-io-2.2.jar:/Users/luowen/.m2/repository/org/springframework/spring-web/5.1.3.RELEASE/spring-web-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/spring-beans/5.1.3.RELEASE/spring-beans-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/cloud/spring-cloud-commons/2.1.0.RELEASE/spring-cloud-commons-2.1.0.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/security/spring-security-crypto/5.1.2.RELEASE/spring-security-crypto-5.1.2.RELEASE.jar:/Users/luowen/.m2/repository/io/github/openfeign/feign-core/10.1.0/feign-core-10.1.0.jar:/Users/luowen/.m2/repository/io/github/openfeign/feign-slf4j/10.1.0/feign-slf4j-10.1.0.jar:/Users/luowen/.m2/repository/io/github/openfeign/feign-hystrix/10.1.0/feign-hystrix-10.1.0.jar:/Users/luowen/.m2/repository/com/netflix/hystrix/hystrix-core/1.5.18/hystrix-core-1.5.18.jar:/Users/luowen/.m2/repository/io/reactivex/rxjava/1.3.8/rxjava-1.3.8.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-starter-web/2.1.1.RELEASE/spring-boot-starter-web-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-starter/2.1.1.RELEASE/spring-boot-starter-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot/2.1.1.RELEASE/spring-boot-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/javax/annotation/javax.annotation-api/1.3.2/javax.annotation-api-1.3.2.jar:/Users/luowen/.m2/repository/org/yaml/snakeyaml/1.23/snakeyaml-1.23.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-starter-json/2.1.1.RELEASE/spring-boot-starter-json-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.9.7/jackson-datatype-jdk8-2.9.7.jar:/Users/luowen/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jsr310/2.9.7/jackson-datatype-jsr310-2.9.7.jar:/Users/luowen/.m2/repository/com/fasterxml/jackson/module/jackson-module-parameter-names/2.9.7/jackson-module-parameter-names-2.9.7.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-starter-tomcat/2.1.1.RELEASE/spring-boot-starter-tomcat-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/apache/tomcat/embed/tomcat-embed-core/9.0.13/tomcat-embed-core-9.0.13.jar:/Users/luowen/.m2/repository/org/apache/tomcat/embed/tomcat-embed-el/9.0.13/tomcat-embed-el-9.0.13.jar:/Users/luowen/.m2/repository/org/apache/tomcat/embed/tomcat-embed-websocket/9.0.13/tomcat-embed-websocket-9.0.13.jar:/Users/luowen/.m2/repository/org/hibernate/validator/hibernate-validator/6.0.13.Final/hibernate-validator-6.0.13.Final.jar:/Users/luowen/.m2/repository/javax/validation/validation-api/2.0.1.Final/validation-api-2.0.1.Final.jar:/Users/luowen/.m2/repository/org/jboss/logging/jboss-logging/3.3.2.Final/jboss-logging-3.3.2.Final.jar:/Users/luowen/.m2/repository/org/springframework/spring-webmvc/5.1.3.RELEASE/spring-webmvc-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/spring-context/5.1.3.RELEASE/spring-context-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/spring-expression/5.1.3.RELEASE/spring-expression-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-starter-actuator/2.1.1.RELEASE/spring-boot-starter-actuator-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-actuator-autoconfigure/2.1.1.RELEASE/spring-boot-actuator-autoconfigure-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-actuator/2.1.1.RELEASE/spring-boot-actuator-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/io/micrometer/micrometer-core/1.1.1/micrometer-core-1.1.1.jar:/Users/luowen/.m2/repository/org/hdrhistogram/HdrHistogram/2.1.9/HdrHistogram-2.1.9.jar:/Users/luowen/.m2/repository/org/latencyutils/LatencyUtils/2.0.3/LatencyUtils-2.0.3.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-starter-log4j2/2.1.1.RELEASE/spring-boot-starter-log4j2-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/apache/logging/log4j/log4j-slf4j-impl/2.11.1/log4j-slf4j-impl-2.11.1.jar:/Users/luowen/.m2/repository/org/apache/logging/log4j/log4j-jul/2.11.1/log4j-jul-2.11.1.jar:/Users/luowen/.m2/repository/org/slf4j/jul-to-slf4j/1.7.25/jul-to-slf4j-1.7.25.jar:/Users/luowen/.m2/repository/org/apache/logging/log4j/log4j-api/2.17.1/log4j-api-2.17.1.jar:/Users/luowen/.m2/repository/org/apache/logging/log4j/log4j-core/2.17.1/log4j-core-2.17.1.jar:/Users/luowen/.m2/repository/org/codehaus/jackson/jackson-core-asl/1.9.13/jackson-core-asl-1.9.13.jar:/Users/luowen/.m2/repository/org/codehaus/jackson/jackson-mapper-asl/1.9.7/jackson-mapper-asl-1.9.7.jar:/Users/luowen/.m2/repository/org/projectlombok/lombok/1.18.22/lombok-1.18.22.jar:/Users/luowen/.m2/repository/org/mapstruct/mapstruct/1.4.2.Final/mapstruct-1.4.2.Final.jar:/Users/luowen/.m2/repository/org/projectlombok/lombok-mapstruct-binding/0.2.0/lombok-mapstruct-binding-0.2.0.jar:/Users/luowen/.m2/repository/org/openjfx/javafx-graphics/12.0.2/javafx-graphics-12.0.2.jar:/Users/luowen/.m2/repository/org/openjfx/javafx-graphics/12.0.2/javafx-graphics-12.0.2-mac.jar:/Users/luowen/.m2/repository/org/openjfx/javafx-base/12.0.2/javafx-base-12.0.2.jar:/Users/luowen/.m2/repository/org/openjfx/javafx-base/12.0.2/javafx-base-12.0.2-mac.jar:/Users/luowen/.m2/repository/io/springfox/springfox-swagger2/2.6.1/springfox-swagger2-2.6.1.jar:/Users/luowen/.m2/repository/io/swagger/swagger-annotations/1.5.10/swagger-annotations-1.5.10.jar:/Users/luowen/.m2/repository/io/swagger/swagger-models/1.5.10/swagger-models-1.5.10.jar:/Users/luowen/.m2/repository/com/fasterxml/jackson/core/jackson-annotations/2.9.0/jackson-annotations-2.9.0.jar:/Users/luowen/.m2/repository/io/springfox/springfox-spi/2.6.1/springfox-spi-2.6.1.jar:/Users/luowen/.m2/repository/io/springfox/springfox-core/2.6.1/springfox-core-2.6.1.jar:/Users/luowen/.m2/repository/io/springfox/springfox-schema/2.6.1/springfox-schema-2.6.1.jar:/Users/luowen/.m2/repository/io/springfox/springfox-swagger-common/2.6.1/springfox-swagger-common-2.6.1.jar:/Users/luowen/.m2/repository/io/springfox/springfox-spring-web/2.6.1/springfox-spring-web-2.6.1.jar:/Users/luowen/.m2/repository/com/google/guava/guava/18.0/guava-18.0.jar:/Users/luowen/.m2/repository/com/fasterxml/classmate/1.4.0/classmate-1.4.0.jar:/Users/luowen/.m2/repository/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar:/Users/luowen/.m2/repository/org/springframework/plugin/spring-plugin-core/1.2.0.RELEASE/spring-plugin-core-1.2.0.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/plugin/spring-plugin-metadata/1.2.0.RELEASE/spring-plugin-metadata-1.2.0.RELEASE.jar:/Users/luowen/.m2/repository/io/springfox/springfox-swagger-ui/2.6.1/springfox-swagger-ui-2.6.1.jar:/Users/luowen/.m2/repository/com/elitel/elitel-datasource/0.0.1/elitel-datasource-0.0.1.jar:/Users/luowen/.m2/repository/org/mybatis/spring/boot/mybatis-spring-boot-starter/2.0.0/mybatis-spring-boot-starter-2.0.0.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-starter-jdbc/2.1.1.RELEASE/spring-boot-starter-jdbc-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/com/zaxxer/HikariCP/3.2.0/HikariCP-3.2.0.jar:/Users/luowen/.m2/repository/org/springframework/spring-jdbc/5.1.3.RELEASE/spring-jdbc-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/mybatis/spring/boot/mybatis-spring-boot-autoconfigure/2.0.0/mybatis-spring-boot-autoconfigure-2.0.0.jar:/Users/luowen/.m2/repository/org/mybatis/mybatis/3.5.0/mybatis-3.5.0.jar:/Users/luowen/.m2/repository/org/mybatis/mybatis-spring/2.0.0/mybatis-spring-2.0.0.jar:/Users/luowen/.m2/repository/mysql/mysql-connector-java/8.0.13/mysql-connector-java-8.0.13.jar:/Users/luowen/.m2/repository/com/oracle/ojdbc7/12.1.0.2/ojdbc7-12.1.0.2.jar:/Users/luowen/.m2/repository/com/ctrip/framework/apollo/apollo-client/1.1.0/apollo-client-1.1.0.jar:/Users/luowen/.m2/repository/com/ctrip/framework/apollo/apollo-core/1.1.0/apollo-core-1.1.0.jar:/Users/luowen/.m2/repository/com/google/code/gson/gson/2.8.5/gson-2.8.5.jar:/Users/luowen/.m2/repository/com/google/inject/guice/4.1.0/guice-4.1.0.jar:/Users/luowen/.m2/repository/javax/inject/javax.inject/1/javax.inject-1.jar:/Users/luowen/.m2/repository/aopalliance/aopalliance/1.0/aopalliance-1.0.jar:/Users/luowen/.m2/repository/net/sf/json-lib/json-lib/2.4/json-lib-2.4-jdk15.jar:/Users/luowen/.m2/repository/commons-beanutils/commons-beanutils/1.8.0/commons-beanutils-1.8.0.jar:/Users/luowen/.m2/repository/commons-collections/commons-collections/3.2.1/commons-collections-3.2.1.jar:/Users/luowen/.m2/repository/commons-lang/commons-lang/2.5/commons-lang-2.5.jar:/Users/luowen/.m2/repository/commons-logging/commons-logging/1.1.1/commons-logging-1.1.1.jar:/Users/luowen/.m2/repository/net/sf/ezmorph/ezmorph/1.0.6/ezmorph-1.0.6.jar:/Users/luowen/.m2/repository/com/alibaba/fastjson/1.2.66/fastjson-1.2.66.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-starter-data-redis/2.1.1.RELEASE/spring-boot-starter-data-redis-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/data/spring-data-redis/2.1.3.RELEASE/spring-data-redis-2.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/data/spring-data-keyvalue/2.1.3.RELEASE/spring-data-keyvalue-2.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/data/spring-data-commons/2.1.3.RELEASE/spring-data-commons-2.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/spring-tx/5.1.3.RELEASE/spring-tx-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/spring-oxm/5.1.3.RELEASE/spring-oxm-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/spring-context-support/5.1.3.RELEASE/spring-context-support-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/io/lettuce/lettuce-core/5.1.3.RELEASE/lettuce-core-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/io/projectreactor/reactor-core/3.2.3.RELEASE/reactor-core-3.2.3.RELEASE.jar:/Users/luowen/.m2/repository/org/reactivestreams/reactive-streams/1.0.2/reactive-streams-1.0.2.jar:/Users/luowen/.m2/repository/io/netty/netty-common/4.1.31.Final/netty-common-4.1.31.Final.jar:/Users/luowen/.m2/repository/io/netty/netty-transport/4.1.31.Final/netty-transport-4.1.31.Final.jar:/Users/luowen/.m2/repository/io/netty/netty-buffer/4.1.31.Final/netty-buffer-4.1.31.Final.jar:/Users/luowen/.m2/repository/io/netty/netty-resolver/4.1.31.Final/netty-resolver-4.1.31.Final.jar:/Users/luowen/.m2/repository/io/netty/netty-handler/4.1.31.Final/netty-handler-4.1.31.Final.jar:/Users/luowen/.m2/repository/io/netty/netty-codec/4.1.31.Final/netty-codec-4.1.31.Final.jar:/Users/luowen/.m2/repository/org/apache/commons/commons-pool2/2.6.0/commons-pool2-2.6.0.jar:/Users/luowen/.m2/repository/org/springframework/spring-core/5.1.3.RELEASE/spring-core-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/spring-jcl/5.1.3.RELEASE/spring-jcl-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/javax/xml/bind/jaxb-api/2.3.1/jaxb-api-2.3.1.jar:/Users/luowen/.m2/repository/javax/activation/javax.activation-api/1.2.0/javax.activation-api-1.2.0.jar:/Users/luowen/.m2/repository/com/github/pagehelper/pagehelper-spring-boot-starter/1.2.10/pagehelper-spring-boot-starter-1.2.10.jar:/Users/luowen/.m2/repository/com/github/pagehelper/pagehelper-spring-boot-autoconfigure/1.2.10/pagehelper-spring-boot-autoconfigure-1.2.10.jar:/Users/luowen/.m2/repository/com/github/pagehelper/pagehelper/5.1.8/pagehelper-5.1.8.jar:/Users/luowen/.m2/repository/com/github/jsqlparser/jsqlparser/1.2/jsqlparser-1.2.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-starter-aop/2.1.1.RELEASE/spring-boot-starter-aop-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/springframework/spring-aop/5.1.3.RELEASE/spring-aop-5.1.3.RELEASE.jar:/Users/luowen/.m2/repository/org/aspectj/aspectjweaver/1.9.2/aspectjweaver-1.9.2.jar:/Users/luowen/.m2/repository/org/jasig/cas/client/cas-client-core/3.5.0/cas-client-core-3.5.0.jar:/Users/luowen/.m2/repository/com/fasterxml/jackson/core/jackson-databind/2.9.7/jackson-databind-2.9.7.jar:/Users/luowen/.m2/repository/com/fasterxml/jackson/core/jackson-core/2.9.7/jackson-core-2.9.7.jar:/Users/luowen/.m2/repository/org/springframework/boot/spring-boot-configuration-processor/2.1.1.RELEASE/spring-boot-configuration-processor-2.1.1.RELEASE.jar:/Users/luowen/.m2/repository/org/jasig/cas/client/cas-client-integration-tomcat-common/3.3.3/cas-client-integration-tomcat-common-3.3.3.jar:/Users/luowen/.m2/repository/com/elitel/cas/casClient/0.0.1/casClient-0.0.1.jar:/Users/luowen/.m2/repository/org/apache/commons/commons-lang3/3.4/commons-lang3-3.4.jar:/Users/luowen/.m2/repository/com/auth0/java-jwt/3.12.1/java-jwt-3.12.1.jar:/Users/luowen/.m2/repository/commons-codec/commons-codec/1.11/commons-codec-1.11.jar:/Users/luowen/.m2/repository/org/apache/poi/poi/4.1.0/poi-4.1.0.jar:/Users/luowen/.m2/repository/org/apache/commons/commons-collections4/4.3/commons-collections4-4.3.jar:/Users/luowen/.m2/repository/org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar:/Users/luowen/.m2/repository/org/apache/poi/poi-ooxml/4.1.0/poi-ooxml-4.1.0.jar:/Users/luowen/.m2/repository/org/apache/poi/poi-ooxml-schemas/4.1.0/poi-ooxml-schemas-4.1.0.jar:/Users/luowen/.m2/repository/org/apache/xmlbeans/xmlbeans/3.1.0/xmlbeans-3.1.0.jar:/Users/luowen/.m2/repository/org/apache/commons/commons-compress/1.18/commons-compress-1.18.jar:/Users/luowen/.m2/repository/commons-net/commons-net/3.4/commons-net-3.4-ftp.jar:/Users/luowen/.m2/repository/com/hikvision/ga/artemis-http-client/1.1.3/artemis-http-client-1.1.3.jar:/Users/luowen/.m2/repository/org/apache/httpcomponents/httpclient/4.5.6/httpclient-4.5.6.jar:/Users/luowen/.m2/repository/org/apache/httpcomponents/httpcore/4.4.10/httpcore-4.4.10.jar  com.elitel.IrrGateApplication"))

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; Here is provider insert template for java develop
(defun insert-template-java-dao (entity idType)
  "Here is insert dao template"
  (interactive "s Please input entity class name: \ns Please input primary key type: ")
  (let ((template "
public interface %sDao extends JpaRepository<%s, %s>{

}")
        (first entity)
        (second entity)
        (third idType)
        result)
    (setq result (format template first second third))
    (message result)
    (insert result)))

;; Here is provider service interface;
(defun insert-template-java-service (entity idType)
  "Here is insert service template"
  (interactive "s Please input entity class name: \ns Please input primary key type: ")
  (let ((template "

import com.elitel.irr.foundation.framework.service.JpaRepositoryService;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class %sService extends JpaRepositoryService<%s, %s> {

    @Autowired
    private %sDao repository;

    @Override
    public Logger getLogger() {
      return log;
    }
    @Override
    public JpaRepository<%s, %s> getMainRepository() {
        return repository;
    }

}

")
        (first entity)
        (second entity)
        (third idType)

        (fourth entity)
        (fifth entity)
        (sixth idType)
        result)
    (setq result (format template first second third fourth fifth sixth))
    (message result)
    (insert result)))


;; Here is provider service interface;
(defun insert-template-java-business (entity idType)
  "Here is insert service template"
  (interactive "s Please input entity class name: \ns Please input primary key type: ")
  (let ((template "

import com.elitel.irr.foundation.framework.business.BaseServiceBusiness;
import com.elitel.irr.foundation.framework.service.RepositoryService;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;


@Component
@Slf4j
public class %sBusiness extends BaseServiceBusiness<%s, %s> {

    @Autowired
    private %sService mainService;

    @Override
    public Logger getLogger() {
      return log;
    }

    @Override
    public RepositoryService<%s, %s> getMainRepositoryService() {
        return mainService;
    }

}

")
        (first entity)
        (second entity)
        (third idType)

        (fourth entity)

        (fifth entity)
        (sixth idType)

        result)
    (setq result (format template first second third fourth fifth sixth))
    (message result)
    (insert result)))


;;
;; Here is provider service interface;
(defun insert-template-java-controller (entity idType)
  "Here is insert service template"
  (interactive "s Please input entity class name: \ns Please input primary key type: ")
  (let ((template "
import com.elitel.irr.foundation.framework.business.BaseServiceBusiness;
import com.elitel.irr.foundation.framework.controller.BaseBusinessController;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;


@RestController
@RequestMapping(path=\"/%sController\")
@Slf4j
public class %sController extends BaseBusinessController<%s, %s> {

    @Autowired
    private %sBusiness mainBusiness;

    @Override
    public BaseServiceBusiness<%s, %s> getMainServiceBusiness() {
        return mainBusiness;
    }


    @Override
    public Logger getLogger() {
      return log;
    }

}

")
        (zero entity) ;; first line
        (first entity)
        (second entity)
        (third idType)
        (fourth entity)
        (fifth entity)
        (sixth idType)
        result)
    (setq result (format template zero first second third fourth fifth sixth))
    (message result)
    (insert result)))


;; select id, create_time, update_time, rtu_device_go_mission_state , rtu_device_go_mission_update_time from well_state ;
(defun insert-sql-well-state ()
  "Here is insert dao template"
  (interactive )
  (let ((template " select id, well_id, create_time, update_time, rtu_device_go_mission_state_key , rtu_device_go_mission_update_time from well_state;"))
    (setq result (format template ))
    (message result)
    (insert result)))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name))
)

(defun sync-target-file ()
  "Sync target file Order to hot reload"
  (interactive)
  (message (buffer-file-name))
  (let ((current-file-absolute-path (buffer-file-name))
        target-file-absolute-path)
    (setq target-file-absolute-path (replace-regexp-in-string "/src/main/resources" "/target/classes" current-file-absolute-path))
    (f-write-text (buffer-string) 'utf-8 target-file-absolute-path)
    (message (concat "sync to target file: " target-file-absolute-path))
    (save-buffer)))

;;from https://stackoverflow.com/questions/10627289/emacs-internal-process-killing-any-command
(define-key process-menu-mode-map (kbd "C-k") 'joaot/delete-process-at-point)

(defun joaot/delete-process-at-point ()
  (interactive)
  (let ((process (get-text-property (point) 'tabulated-list-id)))
    (cond ((and process
                (processp process))
           (delete-process process)
           (revert-buffer))
          (t
           (error "no process at point!")))))
