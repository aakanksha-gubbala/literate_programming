;; Configure the repositories
(require 'package)

;; Add MELPA repository for package installation
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize) ;; Initialize the package system
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ;; Automatically install missing packages

;; --- Basic Emacs Appearance and Cleanup ---
(setq inhibit-startup-message t)  ;; Disable startup message
(menu-bar-mode -1)                ;; Disable the menu bar
(tool-bar-mode -1)                ;; Disable the toolbar
(scroll-bar-mode -1)              ;; Disable the scroll bar
(setq visible-bell t)             ;; Disable sound on errors
(setq initial-scratch-message nil)  ;; No scratch buffer message

;; Use a light theme (Leuven or Modus Operandi)
(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-operandi t))  ;; Light variant of Modus theme (minimalist)

;; --- Doom Modeline for a Clean Status Bar ---
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 25)))

;; --- Centaur Tabs for Modern Tab Navigation ---
(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "bar"
        centaur-tabs-set-icons t
        centaur-tabs-set-bar 'over)
  (centaur-tabs-headline-match)
  (setq centaur-tabs-set-close-button nil
        centaur-tabs-show-navigation-buttons t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

;; --- Dashboard for a Polished Startup Screen ---
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'official)  ;; Use the Emacs logo
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda . 5)))
  (setq dashboard-center-content t))

;; --- Org Mode for Literate Programming ---
(require 'org)
(setq org-startup-indented t)          ;; Enable org-indent-mode by default
(setq org-hide-leading-stars t)        ;; Hide leading stars in headings
(setq org-ellipsis " ▾")               ;; Change ellipsis to a more modern symbol

;; Org Babel for Literate Programming
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)  ;; Enable Python support
   (C . t)       ;; Enable C support
   (emacs-lisp . t)))
(defun my/org-tangle-and-export ()
  "Tangle the Org file and then export it."
  (interactive)
  (org-babel-tangle)
  (org-export-dispatch))
(global-set-key (kbd "C-c t e") 'my/org-tangle-and-export)

(setq org-confirm-babel-evaluate nil)  ;; Don't ask for confirmation before executing

;; --- Python Development Environment ---
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; Configure Elpy to use the modern Python interpreter
(setq elpy-rpc-python-command "python3")

;; --- C++ Development Environment ---
(use-package cc-mode
  :ensure t
  :config
  (setq c-default-style "linux"
        c-basic-offset 4))

;; --- Projectile for Project Management ---
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map))
  :config
  ;; Change this to your desired directory or ensure ~/projects/ exists
  (setq projectile-project-search-path '("~/projects/")))

;; --- Company Mode for Autocompletion ---
(use-package company
  :ensure t
  :init (global-company-mode))

;; --- Magit for Git Integration ---
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; --- A Few Additional Settings for a Better Experience ---
(global-visual-line-mode t)   ;; Wrap text at word boundaries
(setq-default tab-width 4)    ;; Set default tab width
(show-paren-mode 1)           ;; Highlight matching parentheses
(electric-pair-mode 1)        ;; Auto close brackets and quotes

;; --- Set Font to Menlo ---
(set-face-attribute 'default nil :font "Menlo-12")

;; LaTeX
(use-package auctex
  :ensure t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-PDF-mode t))
(setq org-latex-packages-alist
      '(("AUTO" "inputenc" t)
        ("" "amsmath" t)
        ("" "amssymb" t)
        ("" "geometry" t)
		("" "bm" t)
		("" "xcolor" t)
		("" "geometry" t)
        ("margin=1in" "geometry" nil)
		("" "listings" t)
		("" "enumitem" t)
		("" "setspace" t)
		("" "lmodern")
        ("" "fontenc" t)
        ("" "caption" t)
        ("" "hyperref" t)))

(setq org-latex-default-class "article")
;; Define custom LaTeX header and code style
(setq org-latex-classes
      '(("custom"
         "\\documentclass[a4paper,11pt]{custom}
         \\usepackage{amsmath}
         \\usepackage{amssymb}
         \\usepackage{graphicx}
         \\usepackage{hyperref}
         \\usepackage{lmodern}
         \\renewcommand{\\rmdefault}{lmr}
         \\renewcommand{\\sfdefault}{lmr}
         \\usepackage{titlesec}
         \\titleformat{\\section}
         {\\large\\bfseries}
         {\\thesection $|$}
         {0.1cm}
         {\\ruleafter}
         \\titleformat{\\subsection}
         {}
         {\\thesubsection}
         {0.1cm}
         {}
         \\titlespacing*{\\section}
         {0pt}{0.4cm}{0.4cm}
         \\setlist{nosep}
         \\setlist[itemize]{noitemsep, topsep=0pt}
         \\hypersetup{
             colorlinks=true,
             allcolors=blue
         }
         "
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))

;; HTML
(setq org-html-html5-fancy t)
(setq org-html-doctype "html5")
(setq org-html-head-include-scripts t)
(setq org-html-head-include-default-style t)
(setq org-html-head
      "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.css\" type=\"text/css\" />
       <script src=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML\"></script>")
(setq org-html-validation-link nil)


;; --- Final Touches for Performance and Behavior ---
(setq gc-cons-threshold 50000000)  ;; Increase the GC threshold for better performance
(setq read-process-output-max (* 1024 1024))  ;; Increase process output max (for LSP performance)

