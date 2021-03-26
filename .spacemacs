;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;;better-defaults - better-defaults changes nothing if you use vim-mode (which I do)
     ;;dap
     emacs-lisp
     ;;emoji
     ;; for irc stuff
     ;;erc
     git
     ;;haskell
     ;;helm
     html
     javascript
     lsp
     ;; markdown
     ;;mu4e
     (mu4e :variables
           ;;mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu/mu4e"
           mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu4e"
           mu4e-mu-binary "/usr/local/bin/mu")
     ;;multiple-cursors
     ;;octave
     ;;org
     (org :variables
          org-enable-github-support t
          org-enable-org-journal-support t)
     osx
     ;;perl5
     ;;php
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyls
             python-formatter 'black
             python-format-on-save t)
     (shell :variables
            ;; options are eshell, shell, term, ansi-term and multi-term
            multi-term-program "/usr/local/bin/zsh"
            shell-default-shell 'term
            shell-default-height 30
            shell-default-position 'bottom)
     ;;ruby
     spell-checking
     syntax-checking
     ;; version-control
     themes-megapack
     ;;typescript
     ;;treemacs
     ;;vimscript
     )


   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.

   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.

   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs"
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-read-process-output-max (* 1024 1024)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives t
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   ;; dotspacemacs-editing-style '(hybrid :variables
   ;;                                     hybrid-mode-enable-evilified-state t
   ;;                                     hybrid-mode-enable-hjkl-bindings nil
   ;;                                     hybrid-mode-use-evil-search-module nil
   ;;                                     hybrid-mode-default-state 'normal)
   dotspacemacs-startup-buffer-show-version t
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-new-empty-buffer-major-mode 'text-mode
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(
                         afternoon
                         spacemacs-light
                         light-blue
                         material
                         spacemacs-dark
                         ujelly
                         solarized)
   dotspacemacs-mode-line-theme '(all-the-icons :separator slant :separator-scale 1.5)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro for Powerline"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts t
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-undecorated-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers '(:visual t
                                       :disabled-for-modes
                                       dired-mode
                                       doc-view-mode
                                       pdf-view-mode
                                       :size-limit-kb 1000)
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-enable-server t
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server t
   dotspacemacs-search-tools '("ack" "rg" "ag" "pt" "grep")
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq-default git-magit-status-fullscreen t)
)

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
;; (add-to-list 'initial-frame-alist '(width . 110))
;; (add-to-list 'initial-frame-alist '(height . 60))
;; (add-to-list 'initial-frame-alist '(vertical-scroll-bars . nil))
;; (add-to-list 'initial-frame-alist '(font . "Source Code Pro for Powerline-14"))
(add-to-list 'default-frame-alist '(width . 110))
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-14"))
;; the following two lines help in finding missing parentheses
(setq show-paren-mode t)
(setq show-paren-style 'expression)
(setq paradox-github-token "425cddf9ffcaf7361060211fe6c306dbf4598fe5")
;; these help to debug auth-source
;;(setq auth-source-debug t)
;;(setq auth-source-do-cache nil)
;; - end debug auth-source
;; mu4e and mail section
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(require 'mu4e)
(setq mu4e-maildir "~/.local/share/mail")
(setq mail-user-agent 'mu4e-user-agent)
(setq mu4e-index-cleanup nil)
(setq mu4e-index-lazy-check t)
(setq mu4e-compose-dont-reply-to-self t)
(setq mu4e-headers-skip-duplicates t)
;; helps to prettify html emails
(setq mu4e-compose-in-new-frame t)
(setq org-mu4e-convert-to-html t)
(setq mu4e-view-show-images t)
;; use imag bb bb
(setq mu4e-use-fancy-chars t)
(setq mu4e-context-policy 'pick-first)
(setq mu4e-compose-context-policy 'ask-if-none)
(setq mu4e-headers-auto-update t)
(setq mu4e-view-show-addresses t)
(setq mu4e-hide-index-messages t)
(setq mu4e-change-filenames-when-moving t)
(setq mu4e-sent-messages-behavior 'trash)
(setq mu4e-update-interval (* 10 60))
(setq mu4e-get-mail-command "mbsync -a")
(setq mu4e-attachment-dir "~/Downloads")
;; the following 2 lines allow you to view emails either in the browser or
;; in xwidget - if Emacs was compiled with xwidget support
;; simply press aX or aV when viewing the message in mu4e
(add-to-list 'mu4e-view-actions '("ViewInBrowser" . mu4e-action-view-in-browser))
(add-to-list 'mu4e-view-actions '("XWidget View" . mu4e-action-view-with-xwidget))
(setq smtpmail-stream-type 'starttls)
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-auth-credentials "~/.authinfo.gpg")
(setq smtpmail-queue-dir "~/.local/share/mail/queue/cur")
(setq message-kill-buffer-on-exit t)
(add-hook 'mu4e-compose-mode-hook 'flyspell-mode)
(setq starttls-use-gnutls t)
(auth-source-pass-enable)
;;(use-package esup)
;;(use-package org-mu4e)
(use-package smtpmail)
;; Uncomment the line below to debug smtpmail
;;(setq smtpmail-debug-info t)
(setq mu4e-contexts
     `( ,(make-mu4e-context
        :name "Gmail"
        :enter-func (lambda () (mu4e-message "Entering Gmail context"))
        :leave-func (lambda () (mu4e-message "Leaving Gmail context"))
        :match-func (lambda (msg)
          (when msg
            (mu4e-message-contact-field-matches msg
              :to "bryan.m.obrien@gmail.com")))
           :vars '((mu4e-trash-folder      . "/gmail/Trash")
                   (mu4e-refile-folder     . "/gmail/Archive")
                   (mu4e-drafts-folder     . "/gmail/Drafts")
                   (mu4e-sent-folder       . "/gmail/Sent")
                   (user-mail-address      . "bryan.m.obrien@gmail.com")
                   (user-full-name         . "Bryan O'Brien")
                   (smtpmail-smtp-user     . "bryan.m.obrien@gmail.com")
                   (smtpmail-smtp-server   . "smtp.gmail.com")
                   (smtpmail-smtp-service  . 587)
                   (mu4e-maildir-shortcuts . ( ("/gmail/INBOX"  . ?i)
                                               ("/gmail/Sent"   . ?s)
                                               ("/gmail/Trash"  . ?t)
                                               ("/gmail/Drafts" . ?d)
                                               ))))
       ,(make-mu4e-context
        :name "Yahoo"
        :enter-func (lambda () (mu4e-message "Entering Yahoo context"))
        :leave-func (lambda () (mu4e-message "Leaving Yahoo context"))
        :match-func (lambda (msg)
          (when msg
            (mu4e-message-contact-field-matches msg
              :to "jayjoethecocoa@yahoo.com")))
        :vars '((mu4e-trash-folder  . "/yahoo/Trash")
                (mu4e-refile-folder . "/yahoo/Archive")
                (mu4e-drafts-folder . "/yahoo/Drafts")
                (mu4e-sent-folder   . "/yahoo/Sent")
                (user-mail-address  . "jayjoethecocoa@yahoo.com")
                (user-full-name     . "Jay Joe")
                (smtpmail-smtp-user . "jayjoethecocoa@yahoo.com")
                (smtpmail-smtp-server   . "smtp.mail.yahoo.com")
                (smtpmail-smtp-service  . 587)
                (mu4e-maildir-shortcuts . ( ("/yahoo/Inbox" . ?i)
                                            ("/yahoo/Sent"  . ?s)
                                            ("/yahoo/Draft" . ?d)
                                            ("/yahoo/Trash" . ?t)
                                            ))))
       ,(make-mu4e-context
        :name "Protonmail"
        :enter-func (lambda () (mu4e-message "Entering Protonmail context"))
        :leave-func (lambda () (mu4e-message "Leaving Protonmail context"))
        :match-func (lambda (msg)
          (when msg
            (mu4e-message-contact-field-matches msg
              :to "thecocoa@pm.me")))
        :vars '((mu4e-trash-folder      . "/protonmail/Trash")
                (mu4e-refile-folder     . "/protonmail/Archive")
                (mu4e-drafts-folder     . "/protonmail/Drafts")
                (mu4e-sent-folder       . "/protonmail/Sent")
                (user-mail-address      . "thecocoa@pm.me")
                (user-full-name         . "The Cocoa")
                (smtpmail-smtp-user     . "thecocoa@pm.me")
                (smtpmail-smtp-server   . "127.0.0.1")
                (smtpmail-smtp-service  . 1025)
                (mu4e-maildir-shortcuts . ( ("/protonmail/INBOX" . ?i)
                                            ("/protonmail/Sent"  . ?s)
                                            ("/protonmail/Draft" . ?d)
                                            ("/protonmail/Trash" . ?t)
                                            ))))))
;; end of mu4e and mail section
;; can't find ispell in emacsclient invocation
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-local-dictionary "en_US")

;;  (add-hook 'term-mode-hook #'eterm-256color-mode)
(setq projectile--mode-line 'nil)
;;(setq tramp-use-ssh-controlmaster-options 'nil)
;; if i set the var below to python, python2 is used
;; even when python -V from cmd line says 3.x ???
(setq python-shell-interpreter-args "")
(setq flycheck-python-pycompile-executable "python3")
(setq python-shell-interpreter "python3")
(setq insert-directory-program "/usr/local/bin/gls")
(use-package epa-file)
(custom-set-variables '(epg-gpg-program "/usr/local/bin/gpg"))
(use-package forge
  :after magit)
(setq magit-repository-directories
      '(("~/src/" . 3)
        ("~/.emacs.d")))
;;(use-package dap-python)
;;(setq dap-auto-configure-features '(sessions locals controls tooltip))
)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(awesome-tray-mode-line-active-color "#2fafff")
 '(awesome-tray-mode-line-inactive-color "#323232")
 '(background-color "#202020")
 '(background-mode dark)
 '(comp-async-jobs-number 16)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#cccccc")
 '(cursor-type 'bar)
 '(custom-safe-themes
   '("928ed6d4997ec3cdce10b65c59d0f966a61792a69b84c47155cb5578ce2972be" "6df412e59dbfe7f72f24319b9ee4513e40bb0e44384fc93a2c77399e641348f6" "0f2f1feff73a80556c8c228396d76c1a0342eb4eefd00f881b91e26a14c5b62a" "688ae2e91cb9f9f5459e38a6cc10bc8b14087fa36745ef6c85bd7d834459683c" "5a21604c4b1f2df98e67cda2347b8f42dc9ce471a48164fcb8d3d52c3a0d10be" "3a5f04a517096b08b08ef39db6d12bd55c04ed3d43b344cf8bd855bde6d3a1ae" "89885317e7136d4e86fb842605d47d8329320f0326b62efa236e63ed4be23c58" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "4780d7ce6e5491e2c1190082f7fe0f812707fc77455616ab6f8b38e796cbffa9" "c7f364aeea0458b6368815558cbf1f54bbdcc1dde8a14b5260eb82b76c0ffc7b" "21388667ce5ee0b375e6282f0d6c6b61588da6604d343bbb19389e6a54d3d00d" "f703efe04a108fcd4ad104e045b391c706035bce0314a30d72fbf0840b355c2c" "0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6" "27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" "8f567db503a0d27202804f2ee51b4cd409eab5c4374f57640317b8fcbbd3e466" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "d3856ef5a26c9f375f4a084af2e89fa215212fe44540deea941d264d00efead4" "a6fc75241bcc7ce6f68dcfd0de2d4c4bd804d0f8cd3a9f08c3a07654160e9abe" "e76668f7efa2c9297c3998aba61876e757c99c1e5325c135433cf4f53a95df15" "1a1266e25ed97448bbe80f246f53372d4b914d30802711abfda7afcbf2f7b3ec" "f925bfe2aad634d36f97d3f08b54cf4630b25f476cf6a41bbacc4d841bda45ed" "abe5ee8858cd1fbe36304a8c3b2315d3e0a4ef7c8588fcc45d1c23eafb725bb6" "d600c677f1777c1e4bfb066529b5b73c0179d0499dd4ffa3f599a0fb0cfbd501" "d94a55a07623ee474ddb4a0a5dca9a250ea4dcebe554249ce305560c3340ec57" "72e041c9a2cec227a33e0ac4b3ea751fd4f4039235035894bf18b1c0901e1bd6" "ff4d091b20e9e6cb43954e4eeae1c3b334e28b5923747c7bd5d2720f2a67e272" "1cd4df5762b3041a09609b5fb85933bb3ae71f298c37ba9e14804737e867faf3" "830c887bd2cefd77326ddf24389f3806c2a561a550e309691933f772f1bc5825" "e208e45345b91e391fa66ce028e2b30a6aa82a37da8aa988c3f3c011a15baa22" "1f6039038366e50129643d6a0dc67d1c34c70cdbe998e8c30dc4c6889ea7e3db" "4c460925984441cad09c74e042fa9d26f4b35320e04d6fb8a265d1a61c9f5c45" "24cb0b5666e1e17fb6a378c413682f57fe176775eda015eb0a98d65fbb64b127" "8efa3d21b3fa1ac084798fae4e89848ec26ae5c724b9417caf4922f4b2e31c2a" "413ba24c4f8a0d187a43d69dc7cbfd8b1d8782739422ba2368eb5f0893f0642a" "b7133876a11eb2ded01b4b144b45d9e7457f80dd5900c332241881ab261c50f4" "4a201d19d8f7864e930fbb67e5c2029b558d26a658be1313b19b8958fe451b55" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "eb3ef63dc31fbebb37df3646fbc1e07f25159d19bb1cade2a80000a2764690de" "7922b14d8971cce37ddb5e487dbc18da5444c47f766178e5a4e72f90437c0711" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "3147f60a6e56480728bd702d3874a8927efee05bc5fea43b9b6fc9a6fa45b331" "cc8528fcff6ff85ed132ea83e457a58ae0a49168c93bd752a8c446c61fefcdb5" "b47eca77c785108ab443aea40fbabb2af3e13a3ac8a8537975dee099b866a0f0" "7680e0d0fe93475fcdc514ae4df428245ab30c57114a753701e4fc09a15c949b" "5ef596398fb0ceee52c269e2f0ab81c74b4322ab4eb2b014f4f4435c75f06534" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "fa96a61e4eca5f339ad7f1f3442cb5a83696f6a45d9fe2a7bf3b75fc6912bb91" "16ce45f31cdea5e74ca4d27519d7ebe998d69ec3bf7df7be63c5ffdb5638b387" "fc6697788f00629cd01f4d2cc23f1994d08edb3535e4c0facef6b7247b41f5c7" "b375fc54d0c535bddc2b8012870008055bf29d70eea151869e6ad7aaaadb0d24" "dc8ad8b5833ae06e373cc3d64be28e67e6c3d084ea5f0e9e77225b3badbec661" "76b4632612953d1a8976d983c4fdf5c3af92d216e2f87ce2b0726a1f37606158" "e7ba99d0f4c93b9c5ca0a3f795c155fa29361927cadb99cfce301caf96055dfd" "db7f422324a763cfdea47abf0f931461d1493f2ecf8b42be87bbbbbabf287bfe" "a390bea70629258d80f41a42098bafcc636cd5f29f2449f00a86c1dabf68358d" "0d75aa06198c4245ac2a8877bfc56503d5d8199cc85da2c65a6791b84afb9024" "f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "3a9f65e0004068ecf4cf31f4e68ba49af56993c20258f3a49e06638c825fbfb6" default))
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(evil-want-Y-yank-to-eol nil)
 '(exwm-floating-border-color "#646464")
 '(fci-rule-color "#eee8d5" t)
 '(flycheck-python-pycompile-executable "python3" t)
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-themes-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-themes-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-themes-fringe-yellow))
 '(foreground-color "#cccccc")
 '(fringe-mode 6 nil (fringe))
 '(helm-completion-style 'emacs)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-parentheses-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(highlight-symbol-colors
   '("#efe4da49afb1" "#cfc4e1acd08b" "#fe52c9e6b34e" "#dbb6d3c2dcf3" "#e183dee0b053" "#f944cc6dae47" "#d35fdac4e069"))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   '(("#eee8d5" . 0)
     ("#b3c34d" . 20)
     ("#6ccec0" . 30)
     ("#74adf5" . 50)
     ("#e1af4b" . 60)
     ("#fb7640" . 70)
     ("#ff699e" . 85)
     ("#eee8d5" . 100)))
 '(hl-bg-colors
   '("#e1af4b" "#fb7640" "#ff6849" "#ff699e" "#8d85e7" "#74adf5" "#6ccec0" "#b3c34d"))
 '(hl-fg-colors
   '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(hl-sexp-background-color "#1c1f26")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(ibuffer-deletion-face 'modus-themes-mark-del)
 '(ibuffer-filter-group-name-face 'modus-themes-mark-symbol)
 '(ibuffer-marked-face 'modus-themes-mark-sel)
 '(ibuffer-title-face 'modus-themes-pseudo-header)
 '(jdee-db-active-breakpoint-face-colors (cons "#171F24" "#237AD3"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#171F24" "#579C4C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#171F24" "#777778"))
 '(linum-format " %3i ")
 '(lsp-pyls-plugins-jedi-use-pyenv-environment t)
 '(lsp-ui-doc-border "#586e75")
 '(magit-diff-use-overlays nil)
 '(max-specpdl-size 3000)
 '(mml-secure-openpgp-sign-with-sender t)
 '(notmuch-search-line-faces
   '(("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t)))
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#5b7300" "#b3c34d" "#0061a8" "#2aa198" "#d33682" "#6c71c4"))
 '(objed-cursor-color "#D16969")
 '(org-src-block-faces 'nil)
 '(package-native-compile t)
 '(package-selected-packages
   '(org-journal esup emojify emoji-cheat-sheet-plus company-emoji ox-gfm quelpa mu4e-maildirs-extension mu4e-alert helm-mu eterm-256color erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks jedi jedi-core seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake minitest enh-ruby-mode chruby bundler inf-ruby realgud test-simple loc-changes load-relative company-plsense ubuntu-theme ujelly-theme doom-themes zones company-go solarized-theme yapfify stickyfunc-enhance sphinx-doc pytest pyenv-mode py-isort pippel pipenv pyvenv pip-requirements lsp-python-ms lsp-pyright live-py-mode importmagic epc ctable concurrent deferred helm-pydoc helm-cscope xcscope cython-mode company-anaconda blacken anaconda-mode pythonic web-beautify tide typescript-mode tern prettier-js nodejs-repl livid-mode skewer-mode js2-refactor yasnippet multiple-cursors js2-mode js-doc import-js grizzl impatient-mode htmlize simple-httpd helm-gtags ggtags dap-mode posframe lsp-treemacs bui lsp-mode markdown-mode dash-functional counsel-gtags counsel swiper ivy company add-node-modules-path ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil treemacs ht pfuture toc-org symon symbol-overlay string-inflection spaceline-all-the-icons all-the-icons memoize spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode password-generator paradox spinner overseer org-superstar open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list which-key use-package pcre2el org-plus-contrib hydra hybrid-mode helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio font-lock+ flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav editorconfig dumb-jump dotenv-mode diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(python-shell-interpreter "python" t)
 '(rustic-ansi-faces
   ["#1e1e1e" "#D16969" "#579C4C" "#D7BA7D" "#339CDB" "#C586C0" "#85DDFF" "#d4d4d4"])
 '(safe-local-variable-values
   '((eval progn
           (pp-buffer)
           (indent-buffer))
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp)))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tramp-verbose 6)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#cb4366eb20b4")
     (60 . "#c1167942154f")
     (80 . "#b58900")
     (100 . "#a6ae8f7c0000")
     (120 . "#9ed892380000")
     (140 . "#96be94cf0000")
     (160 . "#8e5397440000")
     (180 . "#859900")
     (200 . "#77679bfc4635")
     (220 . "#6d449d465bfd")
     (240 . "#5fc09ea47092")
     (260 . "#4c68a01784aa")
     (280 . "#2aa198")
     (300 . "#303498e7affc")
     (320 . "#2fa1947cbb9b")
     (340 . "#2c879008c736")
     (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-types '((comp) (comp)))
 '(weechat-color-list
   '(unspecified "#fdf6e3" "#eee8d5" "#a7020a" "#dc322f" "#5b7300" "#859900" "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682" "#007d76" "#2aa198" "#657b83" "#839496"))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
