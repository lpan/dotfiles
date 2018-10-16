;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     typescript
     ;; languages
     (c-c++ :variables c-c++-default-mode-for-headers 'c++-mode c-c++-enable-clang-support t)
     (go :variables go-tab-width 4 go-use-gometalinter t)
     (shell :variables shell-default-height 30 shell-default-shell 'multi-term shell-default-position 'bottom)
     clojure
     emacs-lisp
     ess
     html
     javascript
     latex
     python
     ruby
     rust
     scala
     vimscript
     yaml
     ;; frameworks
     react
     ruby-on-rails
     ;; miscs
     pdf-tools
     cscope
     themes-megapack
     (ibuffer :variables
              ibuffer-group-buffers-by 'projects)
     (auto-completion
      :variables
      auto-completion-enable-help-tooltip t
      auto-completion-enable-sort-by-usage t
      auto-completion-return-key-behavior 'cycle
      auto-completion-tab-key-behavior 'complete
      auto-completion-complete-with-key-sequence nil
      auto-completion-complete-with-key-sequence-delay 0.05
      auto-completion-private-snippets-directory nil)
     better-defaults
     vagrant
     git
     github
     helm
     markdown
     org
     spell-checking
     (syntax-checking
      :variables
      syntax-checking-enable-tooltips nil)
     version-control
     )
   dotspacemacs-additional-packages
   '(
     makefile-mode
     editorconfig
     dockerfile-mode
     protobuf-mode
     solidity-mode
     flow-minor-mode
     ; pipenv only merged to spacemacs dev branch atm
     pipenv
     )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
                                        ; dotspacemacs-themes '(spacemacs-dark
                                        ;                       spacemacs-light)
   dotspacemacs-themes '(zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Cousine"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file))

(defun dotspacemacs/user-config ()
  (use-package js2-mode
    :config
    (js2-mode-hide-warnings-and-errors)
    (setq
     js2-basic-offset 2))

  (use-package pipenv
    :hook (python-mode . pipenv-mode)
    :init
    (setq
     pipenv-projectile-after-switch-function
     #'pipenv-projectile-after-switch-extended))

  (use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1))

  (use-package org
    :config
    (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.7)))

  (setq-default evil-escape-key-sequence "jl")

  (setq-default python-shell-interpreter "python3")

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  (add-hook 'c++-mode-hook (lambda () ((add-hook 'before-save-hook 'spacemacs/indent-region-or-buffer))))

  (add-hook 'before-save-hook 'delete-trailing-whitespace))
